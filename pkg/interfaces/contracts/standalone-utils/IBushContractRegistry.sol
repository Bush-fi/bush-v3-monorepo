// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

/// @notice Registered contracts must be one of these types.
enum ContractType {
    OTHER, // a blank entry will have a 0-value type, and it's safest to return this in that case
    POOL_FACTORY,
    ROUTER,
    HOOK,
    ERC4626
}

/**
 * @notice Describes how a registered pool factory handles hooks for the pools it deploys.
 * @dev `NONE` means the factory always deploys pools without a hook. `OPTIONAL` means the factory accepts a hook
 * address at pool creation time (which may be zero), so the pool creator decides. `SPECIFIC` means the factory always
 * attaches a fixed hook to every pool it deploys (e.g., `StableSurgePoolFactory`); in this case the hook address is
 * stored in the registry alongside the factory.
 */
enum HookMode {
    NONE, // a blank entry will have a 0-value mode
    OPTIONAL,
    SPECIFIC
}

/**
 * @notice On-chain source of truth for official Bush contracts: factories, routers, hooks, and ERC4626 tokens.
 * @dev Every contract is registered under a unique name and address, with a type, and can be deprecated or
 * deregistered by governance. Pool factories carry additional metadata (pool type and hook configuration), which
 * lets consumers (aggregators, solvers, indexers, on-chain integrations) answer two further questions:
 *
 * 1. "Which factories are official, and what do they deploy?" See `getAllPoolFactories`, `getPoolFactoriesByType`.
 * 2. "Is this pool from an official factory, and if so, what type is it and what hook does it have?"
 *    See `getFactoryForPool` and `isPoolFromRegisteredFactory`.
 *
 * Pool factories must be registered with `registerPoolFactory` (not `registerBushContract`), so that every
 * `POOL_FACTORY` entry has this metadata. Deprecation and deregistration use the common functions for all types.
 *
 * Lifecycle semantics for pool factories, which consumers should understand:
 *
 * - Registered + active: the factory is trusted, and may still create new pools.
 * - Registered + deprecated (`isActive == false`): the factory has been superseded and should not be used to create
 *   new pools, but pools it already deployed remain valid, official pools. Deprecation is NOT a signal to stop
 *   routing through existing pools; it mirrors calling `disable()` on the factory.
 * - Not registered (`isRegistered == false`): the factory is not (or is no longer) trusted. Deregistration is the
 *   lever governance uses both to correct mistakes and to revoke trust in a factory that turned out to be unsafe.
 *   Pools from a deregistered factory will no longer resolve via `getFactoryForPool`.
 *
 * Pools from an `OPTIONAL` factory may or may not have a hook; consumers should read the actual hook from the Vault
 * (`IVault.getHooksConfig(pool).hooksContract`). Pools from a `SPECIFIC` factory always have the registered hook.
 */
interface IBushContractRegistry {
    /**
     * @notice Store the state of a registered Bush contract.
     * @dev Contracts can be deprecated, so we store an active flag indicating the status. With two flags, we can
     * differentiate between deprecated and non-existent. The same contract address can have multiple names, but
     * only one type. If a contract is legitimately multiple types (e.g., a hook that also acts as a router), set
     * the type to its "primary" function: hook, in this case. The "Other" type is intended as a catch-all for
     * things that don't find into the standard types (e.g., helper contracts).
     *
     * @param contractType The type of contract (e.g., Router or Hook)
     * @param isRegistered This flag indicates whether there is an entry for the associated address
     * @param isActive If there is an entry, this flag indicates whether it is active or deprecated
     */
    struct ContractInfo {
        ContractType contractType;
        bool isRegistered;
        bool isActive;
    }

    /**
     * @notice Complete state of a registered pool factory.
     * @dev `isRegistered` and `isActive` mirror the factory's `ContractInfo`. The `hook` address is only meaningful
     * (and non-zero) when `hookMode` is `SPECIFIC`.
     *
     * @param name The name of the factory (usually the deployment task id, e.g., "20241205-v3-weighted-pool")
     * @param poolType The type of pool deployed by this factory (e.g., "WEIGHTED", "STABLE", "LBP", "COW")
     * @param hookMode Whether pools from this factory have no hook, an optional hook, or a specific hook
     * @param hook The hook attached to every pool from this factory (zero unless `hookMode` is `SPECIFIC`)
     * @param isRegistered This flag indicates whether there is an entry for the associated address
     * @param isActive If there is an entry, this flag indicates whether it is active or deprecated
     */
    struct FactoryInfo {
        string name;
        string poolType;
        HookMode hookMode;
        address hook;
        bool isRegistered;
        bool isActive;
    }

    /**
     * @notice Registry data combined with live data read from the factory itself.
     * @dev This is a convenience view for consumers that want everything about a factory in one call, without
     * knowing the factory ABI. The live fields are read via `IVersion`, `IPoolVersion`, and `IBasePoolFactory`; if a
     * factory does not support one of these calls, the corresponding field is left blank (empty string / false / 0).
     * Nothing here is stored by the registry, so it always reflects the factory's current state.
     *
     * @param factory The address of the factory (zero if not registered)
     * @param info The registry's stored information about the factory
     * @param factoryVersion The factory's own version string (`IVersion.version()`), typically JSON with name,
     * version, and deployment id
     * @param poolVersion The version string of pools deployed by this factory (`IPoolVersion.getPoolVersion()`)
     * @param isDisabled Whether the factory has been disabled on-chain (`IBasePoolFactory.isDisabled()`), which
     * permanently prevents it from creating new pools
     * @param poolCount The number of pools the factory has deployed (`IBasePoolFactory.getPoolCount()`), useful for
     * paging through `getPoolsInRange`
     */
    struct FactoryDetails {
        address factory;
        FactoryInfo info;
        string factoryVersion;
        string poolVersion;
        bool isDisabled;
        uint256 poolCount;
    }

    /**
     * @notice Emitted when a new contract is registered.
     * @dev Also emitted for pool factories, alongside `PoolFactoryRegistered`.
     * @param contractType The type of contract being registered
     * @param contractName The name of the contract being registered
     * @param contractAddress The address of the contract being registered
     */
    event BushContractRegistered(
        ContractType indexed contractType,
        string indexed contractName,
        address indexed contractAddress
    );

    /**
     * @notice Emitted when a new pool factory is registered, with its pool factory metadata.
     * @dev The strings are deliberately not indexed, so that off-chain consumers can read them from the event data
     * (indexed strings are only available as hashes).
     *
     * @param factory The address of the factory being registered
     * @param name The name of the factory being registered
     * @param poolType The type of pool deployed by the factory
     * @param hookMode The hook mode of the factory
     * @param hook The specific hook attached to pools from this factory (zero unless `hookMode` is `SPECIFIC`)
     */
    event PoolFactoryRegistered(address indexed factory, string name, string poolType, HookMode hookMode, address hook);

    /**
     * @notice Emitted when a new contract is deregistered (deleted).
     * @param contractType The type of contract being deregistered
     * @param contractName The name of the contract being deregistered
     * @param contractAddress The address of the contract being deregistered
     */
    event BushContractDeregistered(
        ContractType indexed contractType,
        string indexed contractName,
        address indexed contractAddress
    );

    /**
     * @notice Emitted when a registered contract is deprecated.
     * @dev This sets the `isActive` flag to false.
     * @param contractAddress The address of the contract being deprecated
     */
    event BushContractDeprecated(address indexed contractAddress);

    /**
     * @notice Emitted when an alias is added or updated.
     * @param contractAlias The alias name
     * @param contractAddress The address of the contract being deprecated
     */
    event ContractAliasUpdated(string indexed contractAlias, address indexed contractAddress);

    /**
     * @notice A contract has already been registered under the given address.
     * @dev Both names and addresses must be unique in the primary registration mapping. Though there are two mappings
     * to accommodate searching by either name or address, conceptually there is a single guaranteed-consistent
     * name => address => state mapping.
     *
     * @param contractType The contract type, provided for documentation purposes
     * @param contractAddress The address of the previously registered contract
     */
    error ContractAddressAlreadyRegistered(ContractType contractType, address contractAddress);

    /**
     * @notice A contract has already been registered under the given name.
     * @dev Note that names must be unique; it is not possible to register two contracts with the same name and
     * different types, or the same name and different addresses.
     *
     * @param contractType The registered contract type, provided for documentation purposes
     * @param contractName The name of the previously registered contract
     */
    error ContractNameAlreadyRegistered(ContractType contractType, string contractName);

    /**
     * @notice The proposed contract name has already been added as an alias.
     * @dev This could lead to inconsistent (or at least redundant) internal state if allowed.
     * @param contractName The name of the previously registered contract
     * @param contractAddress The address of the previously registered contract
     */
    error ContractNameInUseAsAlias(string contractName, address contractAddress);

    /**
     * @notice The proposed alias has already been registered as a contract.
     * @dev This could lead to inconsistent (or at least redundant) internal state if allowed.
     * @param contractType The registered contract type, provided for documentation purposes
     * @param contractName The name of the previously registered contract (and proposed alias)
     */
    error ContractAliasInUseAsName(ContractType contractType, string contractName);

    /**
     * @notice Thrown when attempting to deregister a contract that was not previously registered.
     * @param contractName The name of the unregistered contract
     */
    error ContractNameNotRegistered(string contractName);

    /**
     * @notice An operation that requires a valid contract specified an unrecognized address.
     * @dev A contract being deprecated was never registered, or the target of an alias isn't a previously
     * registered contract.
     *
     * @param contractAddress The address of the contract that was not registered
     */
    error ContractAddressNotRegistered(address contractAddress);

    /**
     * @notice Contracts can only be deprecated once.
     * @param contractAddress The address of the previously deprecated contract
     */
    error ContractAlreadyDeprecated(address contractAddress);

    /// @notice Cannot register or deprecate contracts, or add an alias targeting the zero address.
    error ZeroContractAddress();

    /// @notice Cannot register (or deregister) a contract with an empty string as a name.
    error InvalidContractName();

    /// @notice Cannot add an empty string as an alias.
    error InvalidContractAlias();

    /// @notice Pool factories must be registered through `registerPoolFactory`, which records their metadata.
    error UseRegisterPoolFactory();

    /**
     * @notice The address being registered as a factory has no code.
     * @param factory The address that was supplied
     */
    error FactoryNotAContract(address factory);

    /**
     * @notice The factory being registered reports a different Vault than the one this registry serves.
     * @dev All Bush pool factories expose `getVault()`. If the call fails (i.e., the address is not a Bush factory),
     * `factoryVault` will be zero.
     *
     * @param factory The address of the factory
     * @param factoryVault The Vault reported by the factory (zero if it could not be determined)
     */
    error FactoryVaultMismatch(address factory, address factoryVault);

    /// @notice Cannot register a factory with an empty string as a pool type.
    error InvalidPoolType();

    /// @notice A factory registered with `HookMode.SPECIFIC` must supply a non-zero hook address.
    error ZeroHookAddress();

    /**
     * @notice The hook address supplied for a `HookMode.SPECIFIC` factory has no code.
     * @param hook The address that was supplied
     */
    error HookNotAContract(address hook);

    /**
     * @notice A hook address was supplied, but the hook mode is not `SPECIFIC`.
     * @dev The hook address is only stored for factories that always attach a fixed hook. For `NONE` and `OPTIONAL`
     * modes, pass the zero address.
     *
     * @param hookMode The hook mode that was supplied
     * @param hook The (non-zero) hook address that was supplied
     */
    error UnexpectedHookAddress(HookMode hookMode, address hook);

    /***************************************************************************
                                   Governance
    ***************************************************************************/

    /**
     * @notice Register an official Bush contract (e.g., a trusted router or hook).
     * @dev This is a permissioned function, and does only basic validation of the address (non-zero) and the name
     * (not blank). Governance must ensure this is called with valid information. Emits the
     * `BushContractRegistered` event if successful. Reverts if either the name or address is invalid or
     * already in use. Pool factories cannot be registered this way; use `registerPoolFactory`.
     *
     * @param contractType The type of contract being registered (cannot be `POOL_FACTORY`)
     * @param contractName A text description of the contract, usually the deployed version (e.g., "v3-router")
     * @param contractAddress The address of the contract
     */
    function registerBushContract(
        ContractType contractType,
        string memory contractName,
        address contractAddress
    ) external;

    /**
     * @notice Register an official pool factory, under the `POOL_FACTORY` contract type.
     * @dev This is a permissioned function. In addition to the checks in `registerBushContract`, it validates that
     * the factory is a contract that reports the same Vault as this registry, that the pool type is not blank, and
     * that a hook (which must be a contract) is present if and only if `hookMode` is `SPECIFIC`. It cannot verify that
     * the pool type or hook mode are correct for the factory; governance must ensure this is called with valid
     * information. Emits both `BushContractRegistered` and `PoolFactoryRegistered` if successful.
     *
     * Pool types are free-form strings so that new kinds of pools can be registered without redeploying the registry.
     * Comparisons are exact (case-sensitive), so governance should use a consistent convention (e.g., "WEIGHTED",
     * "STABLE", "LBP", "COW").
     *
     * @param name The name of the factory, usually the deployment task id (e.g., "20241205-v3-weighted-pool")
     * @param factory The address of the factory
     * @param poolType The type of pool deployed by this factory (e.g., "WEIGHTED")
     * @param hookMode Whether pools from this factory have no hook, an optional hook, or a specific hook
     * @param hook The specific hook attached to every pool from this factory (must be zero unless `SPECIFIC`)
     */
    function registerPoolFactory(
        string memory name,
        address factory,
        string memory poolType,
        HookMode hookMode,
        address hook
    ) external;

    /**
     * @notice Deregister an official Bush contract (e.g., a trusted router, standard pool factory, or hook).
     * @dev This is a permissioned function, and makes it possible to correct errors without complex update logic.
     * If a contract was registered with an incorrect type, name, or address (or, for a pool factory, pool type or hook
     * mode), this allows governance to simply delete it, and register it again with the correct data. It is also how
     * governance revokes trust in a contract found to be unsafe. It must start with the name, as this is the registry
     * key, required for complete deletion.
     *
     * Note that there might still be an alias targeting the address being deleted, but accessing it will just return
     * inactive, and this orphan alias can simply be overwritten with `addOrUpdateBushContractAlias` to point to
     * the correct address.
     *
     * @param contractName The name of the contract being deprecated (cannot be an alias)
     */
    function deregisterBushContract(string memory contractName) external;

    /**
     * @notice Deprecate an official Bush contract.
     * @dev This is a permissioned function that sets the `isActive` flag to false in the contract info. It uses the
     * address instead of the name for maximum clarity, and to avoid having to handle aliases. Addresses and names are
     * enforced unique, so either the name or address could be specified in principle. Pools already deployed by a
     * deprecated factory remain official pools.
     *
     * @param contractAddress The address of the contract being deprecated
     */
    function deprecateBushContract(address contractAddress) external;

    /**
     * @notice Add an alias for a registered contract.
     * @dev This is a permissioned function to support querying by a contract alias. For instance, we might create a
     * `WeightedPool` alias meaning the "latest" version of the `WeightedPoolFactory`, so that off-chain users don't
     * need to track specific versions. Once added, an alias can also be updated to point to a different address
     * (e.g., when migrating from the v2 to the v3 weighted pool).
     *
     * @param contractAlias An alternate name that can be used to fetch a contract address
     * @param existingContract The target address of the contract alias
     */
    function addOrUpdateBushContractAlias(string memory contractAlias, address existingContract) external;

    /***************************************************************************
                                 Contract queries
    ***************************************************************************/

    /**
     * @notice Determine whether an address is an official contract of the specified type.
     * @param contractType The type of contract
     * @param contractAddress The address of the contract
     * @return isActive True if the given address is a registered and active contract of the specified type
     */
    function isActiveBushContract(
        ContractType contractType,
        address contractAddress
    ) external view returns (bool isActive);

    /**
     * @notice Look up a registered contract by type and name.
     * @dev This could target a particular version (e.g. `20241205-v3-weighted-pool`), or a contract alias
     * (e.g., `WeightedPool`).
     *
     * @param contractType The type of the contract
     * @param contractName The name of the contract
     * @return contractAddress The address of the associated contract, if registered, or zero
     * @return isActive True if the contract was registered and not deprecated
     */
    function getBushContract(
        ContractType contractType,
        string memory contractName
    ) external view returns (address contractAddress, bool isActive);

    /**
     * @notice Look up complete information about a registered contract by address.
     * @param contractAddress The address of the associated contract
     * @return info ContractInfo struct corresponding to the address
     */
    function getBushContractInfo(address contractAddress) external view returns (ContractInfo memory info);

    /// @notice Returns `true` if the given address is an active contract under the ROUTER type.
    function isTrustedRouter(address router) external view returns (bool);

    /***************************************************************************
                                  Factory queries
    ***************************************************************************/

    /**
     * @notice Determine whether an address is a registered, active pool factory.
     * @dev Equivalent to `isActiveBushContract(ContractType.POOL_FACTORY, factory)`.
     * @param factory The address of the factory
     * @return isActive True if the given address is a registered and non-deprecated factory
     */
    function isActivePoolFactory(address factory) external view returns (bool isActive);

    /**
     * @notice Determine whether an address is a registered, active pool factory of the given type.
     * @param poolType The expected pool type (exact match)
     * @param factory The address of the factory
     * @return isActive True if the given address is a registered, non-deprecated factory of the given type
     */
    function isActivePoolFactoryOfType(string memory poolType, address factory) external view returns (bool isActive);

    /**
     * @notice Determine whether an address is a registered pool factory (active or deprecated).
     * @param factory The address of the factory
     * @return isRegistered True if the given address is a registered factory
     */
    function isRegisteredPoolFactory(address factory) external view returns (bool isRegistered);

    /**
     * @notice Look up a registered factory by name or alias.
     * @param name The name of the factory (e.g., `20241205-v3-weighted-pool`), or an alias (e.g., `WeightedPool`)
     * @return factory The address of the associated factory, if registered, or zero
     * @return info FactoryInfo struct corresponding to the factory (blank if not registered, or not a pool factory)
     */
    function getPoolFactory(string memory name) external view returns (address factory, FactoryInfo memory info);

    /**
     * @notice Look up complete information about a registered factory by address.
     * @param factory The address of the factory
     * @return info FactoryInfo struct corresponding to the address (blank if not a registered pool factory)
     */
    function getPoolFactoryInfo(address factory) external view returns (FactoryInfo memory info);

    /**
     * @notice Get the hook attached to pools from the given factory.
     * @dev Returns zero unless the factory is registered with `HookMode.SPECIFIC`.
     * @param factory The address of the factory
     * @return hook The hook address, or zero
     */
    function getPoolFactoryHook(address factory) external view returns (address hook);

    /**
     * @notice Get registry information plus live version/status data for a registered factory, in one call.
     * @dev Returns blank details (zero `factory`) if the address is not a registered pool factory; no calls are made
     * to unregistered addresses.
     *
     * @param factory The address of the factory
     * @return details The combined registry and live factory data
     */
    function getPoolFactoryDetails(address factory) external view returns (FactoryDetails memory details);

    /***************************************************************************
                                   Pool queries
    ***************************************************************************/

    /**
     * @notice Find the registered factory that deployed the given pool.
     * @dev This is the primary entry point for consumers that want to classify a pool. It asks each registered
     * factory (active or deprecated) whether it deployed the pool, via `IBasePoolFactory.isPoolFromFactory`. Cost is
     * linear in the number of registered factories, which is expected to remain small; a factory that reverts on
     * this call is skipped.
     *
     * @param pool The address of the pool
     * @return factory The registered factory that deployed the pool, or zero if none did
     * @return info FactoryInfo struct corresponding to the factory (blank if not found)
     */
    function getFactoryForPool(address pool) external view returns (address factory, FactoryInfo memory info);

    /**
     * @notice Find the registered factory that deployed the given pool, and return its full details.
     * @dev Equivalent to `getPoolFactoryDetails(getFactoryForPool(pool))`; see `getFactoryForPool` for cost.
     * @param pool The address of the pool
     * @return details The combined registry and live factory data (zero `factory` if not found)
     */
    function getFactoryDetailsForPool(address pool) external view returns (FactoryDetails memory details);

    /**
     * @notice Determine whether a pool was deployed by any registered factory (active or deprecated).
     * @dev Pools from deprecated factories are still official pools; see the interface-level documentation.
     * @param pool The address of the pool
     * @return isRegistered True if a registered factory reports having deployed the pool
     */
    function isPoolFromRegisteredFactory(address pool) external view returns (bool isRegistered);

    /**
     * @notice Determine whether a pool was deployed by a registered factory of the given type.
     * @param poolType The expected pool type (exact match)
     * @param pool The address of the pool
     * @return isOfType True if a registered factory of the given type reports having deployed the pool
     */
    function isPoolOfType(string memory poolType, address pool) external view returns (bool isOfType);

    /***************************************************************************
                                Factory enumeration
    ***************************************************************************/

    /// @notice Get the number of registered factories (including deprecated ones).
    function getPoolFactoryCount() external view returns (uint256 count);

    /**
     * @notice Get the address of a registered factory by index.
     * @dev Ordering is not guaranteed to be stable across deregistrations.
     * @param index The index into the set of registered factories
     * @return factory The factory address at that index
     */
    function getPoolFactoryAt(uint256 index) external view returns (address factory);

    /// @notice Get the addresses of all registered factories (including deprecated ones).
    function getPoolFactories() external view returns (address[] memory factories);

    /**
     * @notice Get a full snapshot of the registered factories in a single call.
     * @dev Intended for off-chain consumers bootstrapping an index. Includes deprecated factories.
     * @return factories The addresses of all registered factories
     * @return infos The FactoryInfo struct for each factory, in the same order
     */
    function getAllPoolFactories() external view returns (address[] memory factories, FactoryInfo[] memory infos);

    /**
     * @notice Get a full snapshot of the registered factories, including live version/status data from each one.
     * @dev Makes several external calls per factory; intended for off-chain use. Includes deprecated factories.
     * @return details The combined registry and live data for every registered factory
     */
    function getAllPoolFactoryDetails() external view returns (FactoryDetails[] memory details);

    /**
     * @notice Get the addresses of all registered factories of a given pool type.
     * @param poolType The pool type to filter by (exact match)
     * @param activeOnly If true, exclude deprecated factories
     * @return factories The matching factory addresses
     */
    function getPoolFactoriesByType(
        string memory poolType,
        bool activeOnly
    ) external view returns (address[] memory factories);
}
