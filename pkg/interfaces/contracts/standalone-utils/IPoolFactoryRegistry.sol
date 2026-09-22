// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

/**
 * @notice Describes how a registered factory handles hooks for the pools it deploys.
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
 * @notice On-chain source of truth for official Bush pool factories.
 * @dev Consumers (aggregators, solvers, indexers, on-chain integrations) use this registry to answer two questions:
 *
 * 1. "Which factories are official, and what do they deploy?" See `getAllPoolFactories`, `getPoolFactoriesByType`.
 * 2. "Is this pool from an official factory, and if so, what type is it and what hook does it have?"
 *    See `getFactoryForPool` and `isPoolFromRegisteredFactory`.
 *
 * Lifecycle semantics, which consumers should understand:
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
interface IPoolFactoryRegistry {
    /**
     * @notice Store the state of a registered pool factory.
     * @dev Factories can be deprecated, so we store an active flag indicating the status. With two flags, we can
     * differentiate between deprecated and non-existent. The `hook` address is only meaningful (and non-zero) when
     * `hookMode` is `SPECIFIC`. The timestamps allow answering "was this factory active at time T" without an
     * event indexer: it was active iff `registeredAt <= T` and (`deprecatedAt == 0` or `T < deprecatedAt`).
     *
     * @param name The name of the factory (usually the deployment task id, e.g., "20241205-v3-weighted-pool")
     * @param poolType The type of pool deployed by this factory (e.g., "WEIGHTED", "STABLE", "LBP", "COW")
     * @param hookMode Whether pools from this factory have no hook, an optional hook, or a specific hook
     * @param hook The hook attached to every pool from this factory (zero unless `hookMode` is `SPECIFIC`)
     * @param isRegistered This flag indicates whether there is an entry for the associated address
     * @param isActive If there is an entry, this flag indicates whether it is active or deprecated
     * @param registeredAt Timestamp of registration (zero if not registered)
     * @param deprecatedAt Timestamp of deprecation (zero if not deprecated)
     */
    struct FactoryInfo {
        string name;
        string poolType;
        HookMode hookMode;
        address hook;
        bool isRegistered;
        bool isActive;
        uint32 registeredAt;
        uint32 deprecatedAt;
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
     * @notice Emitted when a new pool factory is registered.
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
     * @notice Emitted when a pool factory is deregistered (deleted).
     * @param factory The address of the factory being deregistered
     * @param name The name of the factory being deregistered
     */
    event PoolFactoryDeregistered(address indexed factory, string name);

    /**
     * @notice Emitted when a registered pool factory is deprecated.
     * @dev This sets the `isActive` flag to false.
     * @param factory The address of the factory being deprecated
     */
    event PoolFactoryDeprecated(address indexed factory);

    /**
     * @notice A factory has already been registered under the given address.
     * @dev Both names and addresses must be unique. Though there are two mappings to accommodate searching by either
     * name or address, conceptually there is a single guaranteed-consistent name => address => state mapping.
     *
     * @param factory The address of the previously registered factory
     * @param name The name it was registered under, provided for documentation purposes
     */
    error FactoryAddressAlreadyRegistered(address factory, string name);

    /**
     * @notice A factory has already been registered under the given name.
     * @param name The name of the previously registered factory
     * @param factory The address it resolves to, provided for documentation purposes
     */
    error FactoryNameAlreadyRegistered(string name, address factory);

    /**
     * @notice Thrown when attempting to deregister or look up a factory by a name that was never registered.
     * @param name The name of the unregistered factory
     */
    error FactoryNameNotRegistered(string name);

    /**
     * @notice An operation that requires a registered factory specified an unrecognized address.
     * @param factory The address of the factory that was not registered
     */
    error FactoryAddressNotRegistered(address factory);

    /**
     * @notice Factories can only be deprecated once.
     * @param factory The address of the previously deprecated factory
     */
    error FactoryAlreadyDeprecated(address factory);

    /// @notice Cannot register or deprecate a factory at the zero address.
    error ZeroFactoryAddress();

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

    /// @notice Cannot register (or deregister) a factory with an empty string as a name.
    error InvalidFactoryName();

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
     * @notice Register an official pool factory.
     * @dev This is a permissioned function. It validates that the factory is a contract that reports the same Vault
     * as this registry, that the name and pool type are not blank, and that a hook (which must be a contract) is
     * present if and only if `hookMode` is `SPECIFIC`. It cannot verify that the pool type or hook mode are correct
     * for the factory; governance must ensure this is called with valid information. Emits the
     * `PoolFactoryRegistered` event if successful. Reverts if either the name or address is already in use.
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
     * @notice Deregister a pool factory, removing it (and its pools) from the set of trusted factories.
     * @dev This is a permissioned function with two purposes. It makes it possible to correct errors without complex
     * update logic: if a factory was registered with an incorrect name, type, hook mode, or address, governance can
     * simply delete it, and register it again with the correct data. It is also how governance revokes trust in a
     * factory found to be unsafe (as opposed to deprecation, which only signals that no new pools should be created).
     * It takes the name, as this is the registry key.
     *
     * @param name The name of the factory being deregistered
     */
    function deregisterPoolFactory(string memory name) external;

    /**
     * @notice Deprecate a pool factory.
     * @dev This is a permissioned function that sets the `isActive` flag to false and records `deprecatedAt`.
     * Deprecation is one-way: it is meant to mirror calling `disable` on the factory itself, which is permanent.
     * Pools already deployed by a deprecated factory remain official pools.
     *
     * @param factory The address of the factory being deprecated
     */
    function deprecatePoolFactory(address factory) external;

    /***************************************************************************
                                  Factory queries
    ***************************************************************************/

    /**
     * @notice Determine whether an address is a registered, active pool factory.
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
     * @notice Look up a registered factory by name.
     * @param name The name of the factory (e.g., `20241205-v3-weighted-pool`)
     * @return factory The address of the associated factory, if registered, or zero
     * @return info FactoryInfo struct corresponding to the factory (blank if not registered)
     */
    function getPoolFactory(string memory name) external view returns (address factory, FactoryInfo memory info);

    /**
     * @notice Look up complete information about a registered factory by address.
     * @param factory The address of the factory
     * @return info FactoryInfo struct corresponding to the address (blank if not registered)
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
     * @dev Returns blank details (zero `factory`) if the address is not registered; no calls are made to
     * unregistered addresses.
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
                                    Enumeration
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
     * @notice Get a full snapshot of the registry in a single call.
     * @dev Intended for off-chain consumers bootstrapping an index. Includes deprecated factories.
     * @return factories The addresses of all registered factories
     * @return infos The FactoryInfo struct for each factory, in the same order
     */
    function getAllPoolFactories() external view returns (address[] memory factories, FactoryInfo[] memory infos);

    /**
     * @notice Get a full snapshot of the registry, including live version/status data from each factory.
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
