// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import {
    IPoolFactoryRegistry,
    HookMode
} from "@bush.fi/v3-interfaces/contracts/standalone-utils/IPoolFactoryRegistry.sol";
import { IPoolVersion } from "@bush.fi/v3-interfaces/contracts/solidity-utils/helpers/IPoolVersion.sol";
import { IVersion } from "@bush.fi/v3-interfaces/contracts/solidity-utils/helpers/IVersion.sol";
import { IBasePoolFactory } from "@bush.fi/v3-interfaces/contracts/vault/IBasePoolFactory.sol";
import { IVault } from "@bush.fi/v3-interfaces/contracts/vault/IVault.sol";

import { SingletonAuthentication } from "@bush.fi/v3-vault/contracts/SingletonAuthentication.sol";

/**
 * @notice On-chain registry of official Bush pool factories.
 * @dev Maintains a registry of pool factories, keyed by the deployment task name (e.g., `20241205-v3-weighted-pool`),
 * along with the type of pool each one deploys (a free-form string such as "WEIGHTED" or "STABLE", so new pool types
 * can be added without redeploying) and how it handles hooks. Each factory is registered as one of:
 *
 * - `HookMode.NONE`: pools from this factory never have a hook.
 * - `HookMode.OPTIONAL`: the factory accepts a hook address on `create`, so the pool creator decides.
 * - `HookMode.SPECIFIC`: the factory attaches a fixed hook to every pool (e.g., `StableSurgePoolFactory` with the
 *   `StableSurgeHook`). The hook address is stored with the factory.
 *
 * This lets both on-chain contracts and off-chain tooling answer questions like "is this a trusted factory?", "which
 * factory deploys Stable pools with the surge hook?", "which official factory deployed this pool, and what type is
 * it?", or "what hook will pools from this factory have?" without needing to know the interface of each individual
 * factory. See `IPoolFactoryRegistry` for the lifecycle semantics consumers should rely on.
 *
 * Registration is permissioned through the Vault's Authorizer (see `SingletonAuthentication`), so only accounts
 * granted the relevant action ids can register, deregister, or deprecate factories. Registration performs basic
 * on-chain sanity checks against the factory (it must be a contract that reports this registry's Vault) to guard
 * against fat-finger errors, but governance remains responsible for the correctness of the pool type and hook mode.
 */
contract PoolFactoryRegistry is IPoolFactoryRegistry, SingletonAuthentication {
    using EnumerableSet for EnumerableSet.AddressSet;

    // FactoryId is the hash of the factory name. Names must be unique.
    mapping(bytes32 factoryId => address factory) private _factoryRegistry;

    // Given an address, store the factory state (name, pool type, hook configuration, and active or deprecated).
    //
    // Conceptually, we maintain a <unique name> => <unique address> => <factory info> registry. The only thing that
    // can change after registration is the `isActive` flag (and `deprecatedAt`), when a factory is deprecated. If a
    // factory is registered in error (e.g., wrong type or hook), the remedy is to deregister (delete) it, and then
    // register the correct one.
    mapping(address factory => FactoryInfo info) private _factoryInfo;

    // Set of all registered factory addresses, to support enumeration.
    EnumerableSet.AddressSet private _factories;

    /**
     * @notice A `_factoryRegistry` entry has no corresponding `_factoryInfo`.
     * @dev This should never happen.
     * @param name The name of the factory that has a registry entry but no info
     * @param factory The address of the factory with missing state
     */
    error InconsistentState(string name, address factory);

    constructor(IVault vault) SingletonAuthentication(vault) {
        // solhint-disable-previous-line no-empty-blocks
    }

    /*
     * Example usage:
     *
     * // A factory whose pools never have a hook.
     * registerPoolFactory(
     *      '20241205-v3-weighted-pool-8020', 0x..., 'WEIGHTED', HookMode.NONE, address(0)
     * );
     *
     * // A factory that lets the pool creator pass in any hook (or none) on `create`.
     * registerPoolFactory(
     *      '20241205-v3-weighted-pool', 0x..., 'WEIGHTED', HookMode.OPTIONAL, address(0)
     * );
     *
     * // A factory that always attaches a specific hook to every pool it deploys.
     * registerPoolFactory(
     *      '20250120-v3-stable-surge', 0x..., 'STABLE', HookMode.SPECIFIC, <StableSurgeHook address>
     * );
     *
     * Later, when a factory is replaced, governance would call `deprecatePoolFactory(<old factory>)` and register the
     * new one under its own deployment name. `isActivePoolFactory(<old factory>)` would then return false, while
     * `getPoolFactory('<old name>')` still resolves (with `isActive == false`) for historical lookups, and pools
     * deployed by the old factory still resolve via `getFactoryForPool`.
     *
     * An aggregator encountering an unknown pool would call `getFactoryForPool(pool)`: a zero factory means the pool
     * is not from any official factory; otherwise `info.poolType` tells it which math to apply, and `info.hookMode`
     * / `info.hook` tell it whether (and which) hook to expect.
     */

    /***************************************************************************
                                   Governance
    ***************************************************************************/

    /// @inheritdoc IPoolFactoryRegistry
    function registerPoolFactory(
        string memory name,
        address factory,
        string memory poolType,
        HookMode hookMode,
        address hook
    ) external authenticate {
        // Ensure arguments are valid.
        if (factory == address(0)) {
            revert ZeroFactoryAddress();
        }

        if (bytes(name).length == 0) {
            revert InvalidFactoryName();
        }

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

        // Ensure the factory looks like a Bush pool factory for this Vault.
        _ensureValidFactory(factory);

        // Ensure the address isn't already in use.
        FactoryInfo memory info = _factoryInfo[factory];
        if (info.isRegistered) {
            revert FactoryAddressAlreadyRegistered(factory, info.name);
        }

        // Ensure the name isn't already in use.
        bytes32 factoryId = _getFactoryId(name);
        address existingFactory = _factoryRegistry[factoryId];
        if (existingFactory != address(0)) {
            revert FactoryNameAlreadyRegistered(name, existingFactory);
        }

        // Store the address in the registry, under the unique name.
        _factoryRegistry[factoryId] = factory;

        // Record the factory as active. The `isActive` flag enables differentiating between unregistered and
        // deprecated addresses.
        _factoryInfo[factory] = FactoryInfo({
            name: name,
            poolType: poolType,
            hookMode: hookMode,
            hook: hook,
            isRegistered: true,
            isActive: true,
            // solhint-disable-next-line not-rely-on-time
            registeredAt: uint32(block.timestamp),
            deprecatedAt: 0
        });

        _factories.add(factory);

        emit PoolFactoryRegistered(factory, name, poolType, hookMode, hook);
    }

    /// @inheritdoc IPoolFactoryRegistry
    function deregisterPoolFactory(string memory name) external authenticate {
        if (bytes(name).length == 0) {
            revert InvalidFactoryName();
        }

        // Ensure the name is registered.
        bytes32 factoryId = _getFactoryId(name);
        address factory = _factoryRegistry[factoryId];

        if (factory == address(0)) {
            revert FactoryNameNotRegistered(name);
        }

        // This should be impossible: the registry and info mappings must be in sync.
        if (_factoryInfo[factory].isRegistered == false) {
            revert InconsistentState(name, factory);
        }

        delete _factoryRegistry[factoryId];
        delete _factoryInfo[factory];
        _factories.remove(factory);

        emit PoolFactoryDeregistered(factory, name);
    }

    /// @inheritdoc IPoolFactoryRegistry
    function deprecatePoolFactory(address factory) external authenticate {
        if (factory == address(0)) {
            revert ZeroFactoryAddress();
        }

        FactoryInfo storage info = _factoryInfo[factory];

        // Check that the address has been registered.
        if (info.isRegistered == false) {
            revert FactoryAddressNotRegistered(factory);
        }

        // If it was registered, check that it has not already been deprecated.
        if (info.isActive == false) {
            revert FactoryAlreadyDeprecated(factory);
        }

        // Set active to false to indicate that it's now deprecated. This is a one-way operation, since deprecation
        // is considered permanent (calling `disable` on a factory to prevent new pool creation is also permanent).
        info.isActive = false;
        // solhint-disable-next-line not-rely-on-time
        info.deprecatedAt = uint32(block.timestamp);

        emit PoolFactoryDeprecated(factory);
    }

    /***************************************************************************
                                  Factory queries
    ***************************************************************************/

    /// @inheritdoc IPoolFactoryRegistry
    function isActivePoolFactory(address factory) external view returns (bool) {
        return _factoryInfo[factory].isActive;
    }

    /// @inheritdoc IPoolFactoryRegistry
    function isActivePoolFactoryOfType(string memory poolType, address factory) external view returns (bool) {
        FactoryInfo storage info = _factoryInfo[factory];

        return info.isActive && _isSameType(info.poolType, _getPoolTypeId(poolType));
    }

    /// @inheritdoc IPoolFactoryRegistry
    function isRegisteredPoolFactory(address factory) external view returns (bool) {
        return _factoryInfo[factory].isRegistered;
    }

    /// @inheritdoc IPoolFactoryRegistry
    function getPoolFactory(string memory name) external view returns (address factory, FactoryInfo memory info) {
        factory = _factoryRegistry[_getFactoryId(name)];
        info = _factoryInfo[factory];
    }

    /// @inheritdoc IPoolFactoryRegistry
    function getPoolFactoryInfo(address factory) external view returns (FactoryInfo memory info) {
        return _factoryInfo[factory];
    }

    /// @inheritdoc IPoolFactoryRegistry
    function getPoolFactoryHook(address factory) external view returns (address) {
        return _factoryInfo[factory].hook;
    }

    /// @inheritdoc IPoolFactoryRegistry
    function getPoolFactoryDetails(address factory) external view returns (FactoryDetails memory) {
        return _getFactoryDetails(factory);
    }

    /***************************************************************************
                                   Pool queries
    ***************************************************************************/

    /// @inheritdoc IPoolFactoryRegistry
    function getFactoryForPool(address pool) external view returns (address factory, FactoryInfo memory info) {
        factory = _findFactoryForPool(pool);
        info = _factoryInfo[factory];
    }

    /// @inheritdoc IPoolFactoryRegistry
    function getFactoryDetailsForPool(address pool) external view returns (FactoryDetails memory) {
        return _getFactoryDetails(_findFactoryForPool(pool));
    }

    /// @inheritdoc IPoolFactoryRegistry
    function isPoolFromRegisteredFactory(address pool) external view returns (bool) {
        return _findFactoryForPool(pool) != address(0);
    }

    /// @inheritdoc IPoolFactoryRegistry
    function isPoolOfType(string memory poolType, address pool) external view returns (bool) {
        address factory = _findFactoryForPool(pool);

        return factory != address(0) && _isSameType(_factoryInfo[factory].poolType, _getPoolTypeId(poolType));
    }

    /***************************************************************************
                                    Enumeration
    ***************************************************************************/

    /// @inheritdoc IPoolFactoryRegistry
    function getPoolFactoryCount() external view returns (uint256) {
        return _factories.length();
    }

    /// @inheritdoc IPoolFactoryRegistry
    function getPoolFactoryAt(uint256 index) external view returns (address) {
        return _factories.at(index);
    }

    /// @inheritdoc IPoolFactoryRegistry
    function getPoolFactories() external view returns (address[] memory) {
        return _factories.values();
    }

    /// @inheritdoc IPoolFactoryRegistry
    function getAllPoolFactories() external view returns (address[] memory factories, FactoryInfo[] memory infos) {
        factories = _factories.values();
        infos = new FactoryInfo[](factories.length);

        for (uint256 i = 0; i < factories.length; ++i) {
            infos[i] = _factoryInfo[factories[i]];
        }
    }

    /// @inheritdoc IPoolFactoryRegistry
    function getAllPoolFactoryDetails() external view returns (FactoryDetails[] memory details) {
        uint256 numFactories = _factories.length();
        details = new FactoryDetails[](numFactories);

        for (uint256 i = 0; i < numFactories; ++i) {
            details[i] = _getFactoryDetails(_factories.at(i));
        }
    }

    /// @inheritdoc IPoolFactoryRegistry
    function getPoolFactoriesByType(
        string memory poolType,
        bool activeOnly
    ) external view returns (address[] memory factories) {
        bytes32 poolTypeId = _getPoolTypeId(poolType);
        uint256 numFactories = _factories.length();
        address[] memory matches = new address[](numFactories);
        uint256 numMatches;

        for (uint256 i = 0; i < numFactories; ++i) {
            address factory = _factories.at(i);
            FactoryInfo storage info = _factoryInfo[factory];

            if (_isSameType(info.poolType, poolTypeId) && (info.isActive || activeOnly == false)) {
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
     * but a factory that reverts (or returns malformed data) is skipped rather than allowed to break lookups for
     * every other factory.
     */
    function _findFactoryForPool(address pool) internal view returns (address) {
        uint256 numFactories = _factories.length();

        for (uint256 i = 0; i < numFactories; ++i) {
            address factory = _factories.at(i);

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
        FactoryInfo memory info = _factoryInfo[factory];
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

    function _getFactoryId(string memory name) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked(name));
    }

    function _getPoolTypeId(string memory poolType) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked(poolType));
    }

    function _isSameType(string storage storedType, bytes32 poolTypeId) internal pure returns (bool) {
        return keccak256(abi.encodePacked(storedType)) == poolTypeId;
    }
}
