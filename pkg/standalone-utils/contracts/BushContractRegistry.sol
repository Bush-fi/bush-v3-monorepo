// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import {
    IBushContractRegistry,
    ContractType,
    HookMode
} from "@bush.fi/v3-interfaces/contracts/standalone-utils/IBushContractRegistry.sol";
import { IPoolVersion } from "@bush.fi/v3-interfaces/contracts/solidity-utils/helpers/IPoolVersion.sol";
import { IVersion } from "@bush.fi/v3-interfaces/contracts/solidity-utils/helpers/IVersion.sol";
import { IBasePoolFactory } from "@bush.fi/v3-interfaces/contracts/vault/IBasePoolFactory.sol";
import { IVault } from "@bush.fi/v3-interfaces/contracts/vault/IVault.sol";

import { SingletonAuthentication } from "@bush.fi/v3-vault/contracts/SingletonAuthentication.sol";

/**
 * @notice On-chain registry of standard Bush contracts, including pool factories and the pools they deploy.
 * @dev Maintain a registry of official Bush Factories, Routers, Hooks, and valid ERC4626 tokens, for three main
 * purposes. The first is to support the many instances where we need to know that a contract is "trusted" (i.e.,
 * is safe and behaves in the required manner). For instance, some hooks depend critically on the identity of the
 * msg.sender, which must be passed down through the Router. Since Routers are permissionless, a malicious one could
 * spoof the sender and "fool" the hook. The hook must therefore "trust" the Router.
 *
 * It is also important for the front-end to know when a particular wrapped token should be used with buffers. Not all
 * "ERC4626" wrapped tokens are fully conforming, and buffer operations with non-conforming tokens may fail in various
 * unexpected ways. It is not enough to simply check whether a buffer exists (e.g., by calling `getBufferAsset`),
 * since best practice is for the pool creator to initialize buffers for all such tokens regardless. They are
 * permissionless, and could otherwise be initialized by anyone in unexpected ways. This registry could be used to
 * keep track of "known good" buffers, such that `isActiveBushContract(ContractType.ERC4626, <address>)` returns
 * true for fully-compliant tokens with properly initialized buffers.
 *
 * Current solutions involve passing in the address of the trusted Router on deployment: but what if it needs to
 * support multiple Routers? Or if the Router is deprecated and replaced? Instead, we can pass the registry address,
 * and query this contract to determine whether the Router is a "trusted" one.
 *
 * The second use case is for off-chain queries, or other protocols that need to easily determine, say, the "latest"
 * Weighted Pool Factory. This contract provides `isActiveBushContract(type, address)` for the first case, and
 * `getBushContract(type, name)` for the second. It is also possible to query all known information about an
 * address, using `getBushContractInfo(address)`, which returns a struct with the detailed state.
 *
 * The third use case is classifying pools. Pool factories are registered (via `registerPoolFactory`) with the type of
 * pool each one deploys (a free-form string such as "WEIGHTED" or "STABLE", so new pool types can be added without
 * redeploying) and how it handles hooks:
 *
 * - `HookMode.NONE`: pools from this factory never have a hook.
 * - `HookMode.OPTIONAL`: the factory accepts a hook address on `create`, so the pool creator decides.
 * - `HookMode.SPECIFIC`: the factory attaches a fixed hook to every pool (e.g., `StableSurgePoolFactory` with the
 *   `StableSurgeHook`). The hook address is stored with the factory.
 *
 * This lets both on-chain contracts and off-chain tooling answer questions like "which factory deploys Stable pools
 * with the surge hook?", "which official factory deployed this pool, and what type is it?", or "what hook will pools
 * from this factory have?" without needing to know the interface of each individual factory. See
 * `IBushContractRegistry` for the lifecycle semantics consumers should rely on.
 *
 * Note that the `SingletonAuthentication` base contract provides `getVault`, so it is also possible to ask this
 * contract for the Vault address, so it doesn't need to be a type.
 */
contract BushContractRegistry is IBushContractRegistry, SingletonAuthentication {
    using EnumerableSet for EnumerableSet.AddressSet;

    /**
     * @dev Metadata stored for pool factories only, in addition to their `ContractInfo`. The registration and active
     * flags live in `_contractInfo`, so there is a single source of truth for status across all contract types.
     */
    struct PoolFactoryData {
        string name;
        string poolType;
        HookMode hookMode;
        address hook;
    }

    // ContractId is the hash of contract name. Names must be unique (cannot have the same name with different types).
    mapping(bytes32 contractId => address addr) private _contractRegistry;

    // Given an address, store the contract state (i.e., type, and active or deprecated).
    //
    // Conceptually, we maintain a <unique name> => <unique address> => <contract info> registry of contracts.
    // The only thing that can change is the `isActive` flag, when a contract is deprecated. If a contract is
    // registered in error (e.g., wrong type or address), the remedy is to deregister (delete) it, and then register
    // the correct one.
    //
    // We also maintain a registry of aliases: <unique alias> => <unique registered address>, where the target address
    // must be in the main registry, and the alias cannot match a unique registered contract name. Aliases can be
    // overwritten (e.g., when the `WeightedPool` alias migrates from v2 to v3). See `_contractAliases` below.
    mapping(address addr => ContractInfo info) private _contractInfo;

    // ContractAliasId is the hash of the alias (e.g., "WeightedPool").
    // This is separate from the main contract registry to enforce different rules (e.g., prevent corrupting the
    // contract state by overwriting a registry entry with an "alias" that matches a different contract).
    mapping(bytes32 contractAliasId => address addr) private _contractAliases;

    // Pool factory metadata, for addresses registered with the `POOL_FACTORY` type.
    mapping(address factory => PoolFactoryData data) private _poolFactoryData;

    // Set of all registered pool factory addresses (active or deprecated), to support enumeration and pool lookups.
    EnumerableSet.AddressSet private _poolFactories;

    // Gas forwarded to each factory's `isPoolFromFactory` during pool lookups. This is a single mapping read in a
    // standard factory, so the cap is generous; it prevents one misbehaving factory from consuming all the gas and
    // breaking lookups for every other factory.
    uint256 private constant _POOL_LOOKUP_GAS_LIMIT = 50_000;

    /**
     * @notice A `_contractRegistry` entry has no corresponding `_contractInfo`.
     * @dev This should never happen.
     * @param contractName The name of the contract that has a registry entry but no contract info
     * @param contractAddress The address of the contract with missing state
     */
    error InconsistentState(string contractName, address contractAddress);

    constructor(IVault vault) SingletonAuthentication(vault) {
        // solhint-disable-previous-line no-empty-blocks
    }

    /*
     * Example usage:
     *
     * // Register both the named version and the "latest" Weighted Pool Factory.
     * registerPoolFactory(
     *      '20241205-v3-weighted-pool', 0x201efd508c8DfE9DE1a13c2452863A78CB2a86Cc, 'WEIGHTED', HookMode.OPTIONAL,
     *      address(0)
     * );
     * addOrUpdateBushContractAlias('WeightedPool', 0x201efd508c8DfE9DE1a13c2452863A78CB2a86Cc);
     *
     * // A factory that always attaches a specific hook to every pool it deploys.
     * registerPoolFactory('20250120-v3-stable-surge', 0x..., 'STABLE', HookMode.SPECIFIC, <StableSurgeHook address>);
     *
     * // Register the Routers (two of them anyway).
     * registerBushContract(ContractType.ROUTER, '20241205-v3-router', 0x5C6fb490BDFD3246EB0bB062c168DeCAF4bD9FDd);
     * registerBushContract(
     *      ContractType.ROUTER, '20241205-v3-batch-router', 0x136f1EFcC3f8f88516B9E94110D56FDBfB1778d1
     * );
     *
     * // Now, hooks that require trusted routers can be deployed with the registry address, and query the router to
     * // see whether it's "trusted" (i.e., registered by governance):
     *
     * isActiveBushContract(ContractType.ROUTER, 0x5C6fb490BDFD3246EB0bB062c168DeCAF4bD9FDd) would return true.
     *
     * Off-chain processes that wanted to know the current address of the Weighted Pool Factory could query by either
     * name:
     *
     * (address, active) = getBushContract(ContractType.POOL_FACTORY, '20241205-v3-weighted-pool');
     * (address, active) = getBushContract(ContractType.POOL_FACTORY, 'WeightedPool');
     *
     * These would return the same result.
     *
     * If we replaced `20241205-v3-weighted-pool` with `20250107-v3-weighted-pool-v2`, governance would call:
     *
     * deprecateBushContract(0x201efd508c8DfE9DE1a13c2452863A78CB2a86Cc);
     * registerPoolFactory(
     *      '20250107-v3-weighted-pool-v2', 0x9FC3da866e7DF3a1c57adE1a97c9f00a70f010c8, 'WEIGHTED', HookMode.OPTIONAL,
     *      address(0)
     * );
     * addOrUpdateBushContractAlias('WeightedPool', 0x9FC3da866e7DF3a1c57adE1a97c9f00a70f010c8);
     *
     * At that point,
     * getBushContract(ContractType.POOL_FACTORY, '20241205-v3-weighted-pool') returns active=false,
     * isActiveBushContract(ContractType.POOL_FACTORY, 0x201efd508c8DfE9DE1a13c2452863A78CB2a86Cc) returns false,
     * getBushContract(ContractType.POOL_FACTORY, 'WeightedPool') returns the v2 address (and active=true).
     *
     * Pools deployed by the old factory still resolve via `getFactoryForPool` (with `isActive == false`). An
     * aggregator encountering an unknown pool would call `getFactoryForPool(pool)`: a zero factory means the pool is
     * not from any official factory; otherwise `info.poolType` tells it which math to apply, and `info.hookMode` /
     * `info.hook` tell it whether (and which) hook to expect.
     */

    /***************************************************************************
                                   Governance
    ***************************************************************************/

    /// @inheritdoc IBushContractRegistry
    function registerBushContract(
        ContractType contractType,
        string memory contractName,
        address contractAddress
    ) external authenticate {
        // Pool factories need their metadata recorded, so that pool lookups and enumeration cover all of them.
        if (contractType == ContractType.POOL_FACTORY) {
            revert UseRegisterPoolFactory();
        }

        _registerBushContract(contractType, contractName, contractAddress);
    }

    /// @inheritdoc IBushContractRegistry
    function registerPoolFactory(
        string memory name,
        address factory,
        string memory poolType,
        HookMode hookMode,
        address hook
    ) external authenticate {
        if (bytes(poolType).length == 0) {
            revert InvalidPoolType();
        }

        // The hook address must be present if and only if the factory always attaches a specific hook.
        if (hookMode == HookMode.SPECIFIC) {
            if (hook == address(0)) {
                revert ZeroHookAddress();
            }

            if (hook.code.length == 0) {
                revert HookNotAContract(hook);
            }
        } else if (hook != address(0)) {
            revert UnexpectedHookAddress(hookMode, hook);
        }

        // Validates the name and address (including uniqueness), and records the factory as an active contract.
        _registerBushContract(ContractType.POOL_FACTORY, name, factory);

        // Ensure the factory looks like a Bush pool factory for this Vault. The zero address was rejected above.
        _ensureValidFactory(factory);

        _poolFactoryData[factory] = PoolFactoryData({ name: name, poolType: poolType, hookMode: hookMode, hook: hook });

        _poolFactories.add(factory);

        emit PoolFactoryRegistered(factory, name, poolType, hookMode, hook);
    }

    /// @inheritdoc IBushContractRegistry
    function deregisterBushContract(string memory contractName) external authenticate {
        if (bytes(contractName).length == 0) {
            revert InvalidContractName();
        }

        // Ensure the name is registered
        bytes32 contractId = _getContractId(contractName);
        address contractAddress = _contractRegistry[contractId];

        if (contractAddress == address(0)) {
            revert ContractNameNotRegistered(contractName);
        }

        ContractInfo memory info = _contractInfo[contractAddress];
        // This should be impossible: the registry and info mappings must be in sync.
        if (info.isRegistered == false) {
            revert InconsistentState(contractName, contractAddress);
        }

        delete _contractRegistry[contractId];
        delete _contractInfo[contractAddress];

        // Deregistering a pool factory also removes it from pool lookups, revoking trust in the pools it deployed.
        if (info.contractType == ContractType.POOL_FACTORY) {
            delete _poolFactoryData[contractAddress];
            _poolFactories.remove(contractAddress);
        }

        emit BushContractDeregistered(info.contractType, contractName, contractAddress);
    }

    /// @inheritdoc IBushContractRegistry
    function deprecateBushContract(address contractAddress) external authenticate {
        if (contractAddress == address(0)) {
            revert ZeroContractAddress();
        }

        ContractInfo memory info = _contractInfo[contractAddress];

        // Check that the address has been registered.
        if (info.isRegistered == false) {
            revert ContractAddressNotRegistered(contractAddress);
        }

        // If it was registered, check that it has not already been deprecated.
        if (info.isActive == false) {
            revert ContractAlreadyDeprecated(contractAddress);
        }

        // Set active to false to indicate that it's now deprecated. This is currently a one-way operation, since
        // deprecation is considered permanent. For instance, calling `disable` to deprecate a factory (preventing
        // new pool creation) is permanent.
        info.isActive = false;
        _contractInfo[contractAddress] = info;

        emit BushContractDeprecated(contractAddress);
    }

    /// @inheritdoc IBushContractRegistry
    function addOrUpdateBushContractAlias(string memory contractAlias, address contractAddress) external authenticate {
        // Ensure arguments are valid.
        if (bytes(contractAlias).length == 0) {
            revert InvalidContractAlias();
        }

        if (contractAddress == address(0)) {
            revert ZeroContractAddress();
        }

        // Ensure the address was already registered.
        ContractInfo memory info = _contractInfo[contractAddress];
        if (info.isRegistered == false) {
            revert ContractAddressNotRegistered(contractAddress);
        }

        // Ensure the proposed alias is not in use (i.e., no collision with existing registered contracts).
        // It can match an existing alias: that's the "update" case. For instance, if we wanted to migrate
        // the `WeightedPool` alias from v2 to v3. If the name is not already in `_contractAliases`, we are
        // adding a new alias.
        bytes32 contractId = _getContractId(contractAlias);
        address existingRegistryAddress = _contractRegistry[contractId];
        if (existingRegistryAddress != address(0)) {
            info = _contractInfo[existingRegistryAddress];

            revert ContractAliasInUseAsName(info.contractType, contractAlias);
        }

        // This will either add a new or overwrite an existing alias.
        _contractAliases[contractId] = contractAddress;

        emit ContractAliasUpdated(contractAlias, contractAddress);
    }

    /***************************************************************************
                                 Contract queries
    ***************************************************************************/

    /// @inheritdoc IBushContractRegistry
    function isActiveBushContract(ContractType contractType, address contractAddress) external view returns (bool) {
        return _isActiveBushContract(contractType, contractAddress);
    }

    /// @inheritdoc IBushContractRegistry
    function getBushContract(
        ContractType contractType,
        string memory contractName
    ) external view returns (address contractAddress, bool isActive) {
        address registeredAddress = _resolveName(contractName);

        ContractInfo memory info = _contractInfo[registeredAddress];
        // It is possible to register a contract and alias, then deregister the contract, leaving a "stale" alias
        // reference. In this case, `isRegistered` will be false. Only return the contract address if it is still
        // valid and of the correct type.
        if (info.isRegistered && info.contractType == contractType) {
            contractAddress = registeredAddress;
            isActive = info.isActive;
        }
    }

    /// @inheritdoc IBushContractRegistry
    function getBushContractInfo(address contractAddress) external view returns (ContractInfo memory info) {
        return _contractInfo[contractAddress];
    }

    /// @inheritdoc IBushContractRegistry
    function isTrustedRouter(address router) external view returns (bool) {
        return _isActiveBushContract(ContractType.ROUTER, router);
    }

    /***************************************************************************
                                  Factory queries
    ***************************************************************************/

    /// @inheritdoc IBushContractRegistry
    function isActivePoolFactory(address factory) external view returns (bool) {
        return _isActiveBushContract(ContractType.POOL_FACTORY, factory);
    }

    /// @inheritdoc IBushContractRegistry
    function isActivePoolFactoryOfType(string memory poolType, address factory) external view returns (bool) {
        return
            _isActiveBushContract(ContractType.POOL_FACTORY, factory) &&
            _isSameType(_poolFactoryData[factory].poolType, _getPoolTypeId(poolType));
    }

    /// @inheritdoc IBushContractRegistry
    function isRegisteredPoolFactory(address factory) external view returns (bool) {
        return _isPoolFactory(factory);
    }

    /// @inheritdoc IBushContractRegistry
    function getPoolFactory(string memory name) external view returns (address factory, FactoryInfo memory info) {
        address registeredAddress = _resolveName(name);

        // Only resolve names (or aliases) that point to a registered pool factory.
        if (_isPoolFactory(registeredAddress)) {
            factory = registeredAddress;
            info = _getFactoryInfo(factory);
        }
    }

    /// @inheritdoc IBushContractRegistry
    function getPoolFactoryInfo(address factory) external view returns (FactoryInfo memory info) {
        return _getFactoryInfo(factory);
    }

    /// @inheritdoc IBushContractRegistry
    function getPoolFactoryHook(address factory) external view returns (address) {
        return _poolFactoryData[factory].hook;
    }

    /// @inheritdoc IBushContractRegistry
    function getPoolFactoryDetails(address factory) external view returns (FactoryDetails memory) {
        return _getFactoryDetails(factory);
    }

    /***************************************************************************
                                   Pool queries
    ***************************************************************************/

    /// @inheritdoc IBushContractRegistry
    function getFactoryForPool(address pool) external view returns (address factory, FactoryInfo memory info) {
        factory = _findFactoryForPool(pool);
        info = _getFactoryInfo(factory);
    }

    /// @inheritdoc IBushContractRegistry
    function getFactoryDetailsForPool(address pool) external view returns (FactoryDetails memory) {
        return _getFactoryDetails(_findFactoryForPool(pool));
    }

    /// @inheritdoc IBushContractRegistry
    function isPoolFromRegisteredFactory(address pool) external view returns (bool) {
        return _findFactoryForPool(pool) != address(0);
    }

    /// @inheritdoc IBushContractRegistry
    function isPoolOfType(string memory poolType, address pool) external view returns (bool) {
        address factory = _findFactoryForPool(pool);

        return factory != address(0) && _isSameType(_poolFactoryData[factory].poolType, _getPoolTypeId(poolType));
    }

    /***************************************************************************
                                Factory enumeration
    ***************************************************************************/

    /// @inheritdoc IBushContractRegistry
    function getPoolFactoryCount() external view returns (uint256) {
        return _poolFactories.length();
    }

    /// @inheritdoc IBushContractRegistry
    function getPoolFactoryAt(uint256 index) external view returns (address) {
        return _poolFactories.at(index);
    }

    /// @inheritdoc IBushContractRegistry
    function getPoolFactories() external view returns (address[] memory) {
        return _poolFactories.values();
    }

    /// @inheritdoc IBushContractRegistry
    function getAllPoolFactories() external view returns (address[] memory factories, FactoryInfo[] memory infos) {
        factories = _poolFactories.values();
        infos = new FactoryInfo[](factories.length);

        for (uint256 i = 0; i < factories.length; ++i) {
            infos[i] = _getFactoryInfo(factories[i]);
        }
    }

    /// @inheritdoc IBushContractRegistry
    function getAllPoolFactoryDetails() external view returns (FactoryDetails[] memory details) {
        uint256 numFactories = _poolFactories.length();
        details = new FactoryDetails[](numFactories);

        for (uint256 i = 0; i < numFactories; ++i) {
            details[i] = _getFactoryDetails(_poolFactories.at(i));
        }
    }

    /// @inheritdoc IBushContractRegistry
    function getPoolFactoriesByType(
        string memory poolType,
        bool activeOnly
    ) external view returns (address[] memory factories) {
        bytes32 poolTypeId = _getPoolTypeId(poolType);
        uint256 numFactories = _poolFactories.length();
        address[] memory matches = new address[](numFactories);
        uint256 numMatches;

        for (uint256 i = 0; i < numFactories; ++i) {
            address factory = _poolFactories.at(i);

            if (
                _isSameType(_poolFactoryData[factory].poolType, poolTypeId) &&
                (activeOnly == false || _contractInfo[factory].isActive)
            ) {
                matches[numMatches++] = factory;
            }
        }

        // Shrink the array to the number of matches.
        factories = matches;
        // solhint-disable-next-line no-inline-assembly
        assembly ("memory-safe") {
            mstore(factories, numMatches)
        }
    }

    /***************************************************************************
                                     Internal
    ***************************************************************************/

    function _registerBushContract(
        ContractType contractType,
        string memory contractName,
        address contractAddress
    ) internal {
        // Ensure arguments are valid.
        if (contractAddress == address(0)) {
            revert ZeroContractAddress();
        }

        if (bytes(contractName).length == 0) {
            revert InvalidContractName();
        }

        // Ensure address isn't already in use.
        ContractInfo memory info = _contractInfo[contractAddress];
        if (info.isRegistered) {
            revert ContractAddressAlreadyRegistered(info.contractType, contractAddress);
        }

        // Ensure name isn't already in use as a registered contract name.
        bytes32 contractId = _getContractId(contractName);
        address existingRegistryAddress = _contractRegistry[contractId];
        if (existingRegistryAddress != address(0)) {
            info = _contractInfo[existingRegistryAddress];

            revert ContractNameAlreadyRegistered(info.contractType, contractName);
        }

        // Also check that it isn't an existing alias.
        address existingAliasAddress = _contractAliases[contractId];
        if (existingAliasAddress != address(0)) {
            revert ContractNameInUseAsAlias(contractName, existingAliasAddress);
        }

        // Store the address in the registry, under the unique name.
        _contractRegistry[contractId] = contractAddress;

        // Record the address as active. The `isActive` flag enables differentiating between unregistered and deprecated
        // addresses.
        _contractInfo[contractAddress] = ContractInfo({
            contractType: contractType,
            isRegistered: true,
            isActive: true
        });

        emit BushContractRegistered(contractType, contractName, contractAddress);
    }

    function _isActiveBushContract(ContractType contractType, address contractAddress) internal view returns (bool) {
        ContractInfo memory info = _contractInfo[contractAddress];

        // Ensure the address was registered as the given type - and that it's still active.
        return info.isActive && info.contractType == contractType;
    }

    function _isPoolFactory(address contractAddress) internal view returns (bool) {
        ContractInfo memory info = _contractInfo[contractAddress];

        return info.isRegistered && info.contractType == ContractType.POOL_FACTORY;
    }

    /// @dev Look up a name in the primary registry, falling back to the aliases. Returns zero if neither matches.
    function _resolveName(string memory contractName) internal view returns (address registeredAddress) {
        bytes32 contractId = _getContractId(contractName);
        registeredAddress = _contractRegistry[contractId];

        if (registeredAddress == address(0)) {
            registeredAddress = _contractAliases[contractId];
        }
    }

    /// @dev Combine the common contract status with the pool factory metadata. Blank if not a registered factory.
    function _getFactoryInfo(address factory) internal view returns (FactoryInfo memory info) {
        if (_isPoolFactory(factory) == false) {
            return info;
        }

        PoolFactoryData storage data = _poolFactoryData[factory];

        info = FactoryInfo({
            name: data.name,
            poolType: data.poolType,
            hookMode: data.hookMode,
            hook: data.hook,
            isRegistered: true,
            isActive: _contractInfo[factory].isActive
        });
    }

    /**
     * @dev Sanity-check a factory before registering it. This cannot prove the factory is a genuine Bush factory, but
     * it does reject the most likely mistakes: an EOA / typo'd address, or a factory deployed against another Vault
     * (e.g., a different chain's address pasted by accident, or a testnet deployment).
     */
    function _ensureValidFactory(address factory) internal view {
        if (factory.code.length == 0) {
            revert FactoryNotAContract(factory);
        }

        // All Bush pool factories inherit `SingletonAuthentication`, and therefore expose `getVault`.
        try SingletonAuthentication(factory).getVault() returns (IVault factoryVault) {
            if (factoryVault != getVault()) {
                revert FactoryVaultMismatch(factory, address(factoryVault));
            }
        } catch {
            revert FactoryVaultMismatch(factory, address(0));
        }
    }

    /**
     * @dev Ask each registered factory whether it deployed the pool. Registered factories are governance-approved,
     * but a factory that reverts, returns malformed data, or exceeds the gas limit is skipped rather than allowed to
     * break lookups for every other factory.
     */
    function _findFactoryForPool(address pool) internal view returns (address) {
        uint256 numFactories = _poolFactories.length();

        for (uint256 i = 0; i < numFactories; ++i) {
            address factory = _poolFactories.at(i);

            try IBasePoolFactory(factory).isPoolFromFactory(pool) returns (bool isFromFactory) {
                if (isFromFactory) {
                    return factory;
                }
            } catch {
                // solhint-disable-previous-line no-empty-blocks
            }
        }

        return address(0);
    }

    /**
     * @dev Combine stored registry info with live data from the factory. Only registered factories are queried;
     * for anything else, blank details are returned without making external calls. Each live call is guarded, so a
     * factory that doesn't implement a given interface simply leaves that field blank.
     */
    function _getFactoryDetails(address factory) internal view returns (FactoryDetails memory details) {
        FactoryInfo memory info = _getFactoryInfo(factory);
        if (info.isRegistered == false) {
            return details;
        }

        details.factory = factory;
        details.info = info;

        try IVersion(factory).version() returns (string memory factoryVersion) {
            details.factoryVersion = factoryVersion;
        } catch {
            // solhint-disable-previous-line no-empty-blocks
        }

        try IPoolVersion(factory).getPoolVersion() returns (string memory poolVersion) {
            details.poolVersion = poolVersion;
        } catch {
            // solhint-disable-previous-line no-empty-blocks
        }

        try IBasePoolFactory(factory).isDisabled() returns (bool isDisabled) {
            details.isDisabled = isDisabled;
        } catch {
            // solhint-disable-previous-line no-empty-blocks
        }

        try IBasePoolFactory(factory).getPoolCount() returns (uint256 poolCount) {
            details.poolCount = poolCount;
        } catch {
            // solhint-disable-previous-line no-empty-blocks
        }
    }

    function _getContractId(string memory contractName) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked(contractName));
    }

    function _getPoolTypeId(string memory poolType) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked(poolType));
    }

    function _isSameType(string storage storedType, bytes32 poolTypeId) internal pure returns (bool) {
        return keccak256(abi.encodePacked(storedType)) == poolTypeId;
    }
}
