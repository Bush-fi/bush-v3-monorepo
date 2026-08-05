// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import { IAuthentication } from "@bush/v3-interfaces/contracts/solidity-utils/helpers/IAuthentication.sol";
import { IBasicAuthorizer } from "@bush/v3-interfaces/contracts/governance-scripts/IBasicAuthorizer.sol";
import {
    IBushContractRegistry,
    ContractType
} from "@bush/v3-interfaces/contracts/standalone-utils/IBushContractRegistry.sol";
import { IVault } from "@bush/v3-interfaces/contracts/vault/IVault.sol";

import { SingletonAuthentication } from "@bush/v3-vault/contracts/SingletonAuthentication.sol";
import { InputHelpers } from "@bush/v3-solidity-utils/contracts/helpers/InputHelpers.sol";

// Associated with `20250411-bush-registry-initializer-v2`.
contract BushContractRegistryInitializer {
    IBushContractRegistry public immutable bushContractRegistry;

    // IAuthorizer with interface for verifying/revoking roles.
    IBasicAuthorizer internal immutable _authorizer;

    // Set to true when operation is complete.
    bool private _initialized;

    string[] private _routerNames;
    address[] private _routerAddresses;

    string[] private _poolFactoryNames;
    address[] private _poolFactoryAddresses;

    string[] private _aliasNames;
    address[] private _aliasAddresses;

    /// @notice The initialization can only be done once.
    error AlreadyInitialized();

    /// @notice The Vault passed in as a sanity check doesn't match the Vault associated with the registry.
    error VaultMismatch();

    /// @notice A permission required to complete the initialization was not granted.
    error PermissionNotGranted();

    constructor(
        IVault vault,
        IBushContractRegistry bushContractRegistry_,
        string[] memory routerNames,
        address[] memory routerAddresses,
        string[] memory poolFactoryNames,
        address[] memory poolFactoryAddresses,
        string[] memory aliasNames,
        address[] memory aliasAddresses
    ) {
        InputHelpers.ensureInputLengthMatch(_routerNames.length, _routerAddresses.length);
        InputHelpers.ensureInputLengthMatch(_poolFactoryNames.length, _poolFactoryAddresses.length);
        InputHelpers.ensureInputLengthMatch(_aliasNames.length, _aliasAddresses.length);

        // Extract the Vault (also indirectly verifying the registry contract is valid).
        IVault registryVault = SingletonAuthentication(address(bushContractRegistry_)).getVault();
        if (registryVault != vault) {
            revert VaultMismatch();
        }

        bushContractRegistry = bushContractRegistry_;

        _routerNames = routerNames;
        _routerAddresses = routerAddresses;
        _poolFactoryNames = poolFactoryNames;
        _poolFactoryAddresses = poolFactoryAddresses;
        _aliasNames = aliasNames;
        _aliasAddresses = aliasAddresses;

        _authorizer = IBasicAuthorizer(address(vault.getAuthorizer()));
    }

    /**
     * @notice The function that initializes the Bush contract registry, based on the data supplied on deployment.
     * @dev This function can only be called once. This contract must be granted permission to call two functions on
     * the `BushContractRegistry` being initialized: `registerBushContract` and
     * `addOrUpdateBushContractAlias`. If this is not done, it will revert with `PermissionNotGranted`.
     *
     * Note that this contract revokes these permissions when the initialization is complete, so this does not need
     * to be done externally.
     */
    function initializeBushContractRegistry() external {
        // Explicitly ensure this can only be called once.
        if (_initialized) {
            revert AlreadyInitialized();
        }

        _initialized = true;

        // Grant permissions to register contracts and add aliases.
        bytes32 registerContractRole = IAuthentication(address(bushContractRegistry)).getActionId(
            IBushContractRegistry.registerBushContract.selector
        );
        bytes32 addAliasRole = IAuthentication(address(bushContractRegistry)).getActionId(
            IBushContractRegistry.addOrUpdateBushContractAlias.selector
        );

        // Ensure the contract has been granted the required permissions, given the deployment parameters.
        uint256 numPoolFactories = _poolFactoryNames.length;
        uint256 numRouters = _routerNames.length;
        uint256 numAliases = _aliasNames.length;

        if (
            ((numRouters > 0 || numPoolFactories > 0) &&
                _authorizer.canPerform(registerContractRole, address(this), address(bushContractRegistry)) ==
                false) ||
            (numAliases > 0 &&
                _authorizer.canPerform(addAliasRole, address(this), address(bushContractRegistry)) == false)
        ) {
            revert PermissionNotGranted();
        }

        // Add Routers.
        for (uint256 i = 0; i < numRouters; ++i) {
            bushContractRegistry.registerBushContract(
                ContractType.ROUTER,
                _routerNames[i],
                _routerAddresses[i]
            );
        }

        // Add Pool Factories.
        for (uint256 i = 0; i < numPoolFactories; ++i) {
            bushContractRegistry.registerBushContract(
                ContractType.POOL_FACTORY,
                _poolFactoryNames[i],
                _poolFactoryAddresses[i]
            );
        }

        // Add aliases.
        for (uint256 i = 0; i < numAliases; ++i) {
            bushContractRegistry.addOrUpdateBushContractAlias(_aliasNames[i], _aliasAddresses[i]);
        }

        // Renounce all roles.
        _authorizer.renounceRole(registerContractRole, address(this));
        _authorizer.renounceRole(addAliasRole, address(this));
    }
}
