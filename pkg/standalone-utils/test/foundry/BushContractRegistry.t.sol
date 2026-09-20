// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IAuthentication } from "@bush.fi/v3-interfaces/contracts/solidity-utils/helpers/IAuthentication.sol";
import {
    IBushContractRegistry,
    ContractType
} from "@bush.fi/v3-interfaces/contracts/standalone-utils/IBushContractRegistry.sol";

import { BaseVaultTest } from "@bush.fi/v3-vault/test/foundry/utils/BaseVaultTest.sol";

import { BushContractRegistry } from "../../contracts/BushContractRegistry.sol";

contract BushContractRegistryTest is BaseVaultTest {
    address private constant ANY_ADDRESS = 0x388C818CA8B9251b393131C08a736A67ccB19297;
    address private constant SECOND_ADDRESS = 0x26c212f06675a0149909030D15dc46DAEE9A1f8a;
    string private constant DEFAULT_NAME = "Contract name";
    string private constant DEFAULT_ALIAS = "Alias name";

    BushContractRegistry private registry;

    function setUp() public override {
        BaseVaultTest.setUp();

        registry = new BushContractRegistry(vault);

        // Grant permissions.
        authorizer.grantRole(registry.getActionId(BushContractRegistry.registerBushContract.selector), admin);
        authorizer.grantRole(registry.getActionId(BushContractRegistry.deregisterBushContract.selector), admin);
        authorizer.grantRole(registry.getActionId(BushContractRegistry.deprecateBushContract.selector), admin);
        authorizer.grantRole(
            registry.getActionId(BushContractRegistry.addOrUpdateBushContractAlias.selector),
            admin
        );
    }

    function testGetVault() public view {
        assertEq(address(registry.getVault()), address(vault), "Wrong Vault address");
    }

    function testRegisterWithoutPermission() public {
        vm.expectRevert(IAuthentication.SenderNotAllowed.selector);
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, ANY_ADDRESS);
    }

    function testRegisterWithBadAddress() public {
        vm.prank(admin);

        vm.expectRevert(IBushContractRegistry.ZeroContractAddress.selector);
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, ZERO_ADDRESS);
    }

    function testRegisterWithBadName() public {
        vm.prank(admin);

        vm.expectRevert(IBushContractRegistry.InvalidContractName.selector);
        registry.registerBushContract(ContractType.POOL_FACTORY, "", ANY_ADDRESS);
    }

    function testDuplicateRegistrationName() public {
        vm.startPrank(admin);
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, ANY_ADDRESS);

        // Try to register the same address under a different name (must use aliases for this).
        vm.expectRevert(
            abi.encodeWithSelector(
                IBushContractRegistry.ContractAddressAlreadyRegistered.selector,
                ContractType.POOL_FACTORY,
                ANY_ADDRESS
            )
        );
        registry.registerBushContract(ContractType.POOL_FACTORY, "Different Name", ANY_ADDRESS);
        vm.stopPrank();
    }

    function testDuplicateRegistrationAddress() public {
        vm.startPrank(admin);
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, ANY_ADDRESS);

        vm.expectRevert(
            abi.encodeWithSelector(
                IBushContractRegistry.ContractNameAlreadyRegistered.selector,
                ContractType.POOL_FACTORY,
                DEFAULT_NAME
            )
        );
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, SECOND_ADDRESS);
        vm.stopPrank();
    }

    function testRegistrationUsingAliasName() public {
        vm.startPrank(admin);
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, ANY_ADDRESS);
        registry.addOrUpdateBushContractAlias(DEFAULT_ALIAS, ANY_ADDRESS);

        // Try to register a new address with a contract name that is already used as an alias.
        vm.expectRevert(
            abi.encodeWithSelector(
                IBushContractRegistry.ContractNameInUseAsAlias.selector,
                DEFAULT_ALIAS,
                ANY_ADDRESS
            )
        );
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_ALIAS, SECOND_ADDRESS);
        vm.stopPrank();
    }

    function testValidRegistration() public {
        vm.prank(admin);
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, ANY_ADDRESS);

        // Should return the registered contract as active.
        assertTrue(
            registry.isActiveBushContract(ContractType.POOL_FACTORY, ANY_ADDRESS),
            "ANY_ADDRESS is not active"
        );
        // Zero address should not be active.
        assertFalse(
            registry.isActiveBushContract(ContractType.POOL_FACTORY, ZERO_ADDRESS),
            "ZERO_ADDRESS is active"
        );
        // Random address should not be active.
        assertFalse(
            registry.isActiveBushContract(ContractType.POOL_FACTORY, SECOND_ADDRESS),
            "SECOND_ADDRESS is active"
        );
        // Only active with the correct type.
        assertFalse(
            registry.isActiveBushContract(ContractType.ROUTER, ANY_ADDRESS),
            "Address is active as a Router"
        );
    }

    function testContractGetters() public {
        vm.prank(admin);
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, ANY_ADDRESS);

        (address contractAddress, bool active) = registry.getBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME);
        assertEq(contractAddress, ANY_ADDRESS, "Wrong contract address");
        assertTrue(active, "Contract not active");

        IBushContractRegistry.ContractInfo memory info = registry.getBushContractInfo(ANY_ADDRESS);
        assertEq(uint8(info.contractType), uint8(ContractType.POOL_FACTORY), "Wrong contract type");
        assertTrue(info.isRegistered, "Contract not registered");
        assertTrue(info.isActive, "Contract not active");

        // Random address will have no data.
        info = registry.getBushContractInfo(SECOND_ADDRESS);
        // 0 will be "Other".
        assertEq(uint8(info.contractType), uint8(ContractType.OTHER), "Wrong contract type");
        assertFalse(info.isRegistered, "Contract registered");
        assertFalse(info.isActive, "Contract active");
    }

    function testStaleAliasGetter() public {
        vm.startPrank(admin);
        // Register a contract and add an alias.
        registry.registerBushContract(ContractType.ROUTER, DEFAULT_NAME, ANY_ADDRESS);
        registry.addOrUpdateBushContractAlias(DEFAULT_ALIAS, ANY_ADDRESS);

        // Deregister the contract - but the alias will still be there.
        registry.deregisterBushContract(DEFAULT_NAME);
        vm.stopPrank();

        // Getting it using the primary name should return 0.
        (address contractAddress, bool active) = registry.getBushContract(ContractType.ROUTER, DEFAULT_NAME);
        assertEq(contractAddress, ZERO_ADDRESS, "Wrong primary contract address");
        assertFalse(active, "Contract is active using primary name");

        // Getting it using the alias should also return 0, even though there's a record there.
        (contractAddress, active) = registry.getBushContract(ContractType.ROUTER, DEFAULT_ALIAS);
        assertEq(contractAddress, ZERO_ADDRESS, "Wrong alias contract address");
        assertFalse(active, "Contract is active using alias");
    }

    function testWrongTypeGetter() public {
        vm.startPrank(admin);
        // Register a contract and add an alias.
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, ANY_ADDRESS);
        registry.addOrUpdateBushContractAlias(DEFAULT_ALIAS, ANY_ADDRESS);

        // Getting a valid entry with the wrong type should return 0.
        (address contractAddress, bool active) = registry.getBushContract(ContractType.ROUTER, DEFAULT_NAME);
        assertEq(contractAddress, ZERO_ADDRESS, "Wrong primary contract address");
        assertFalse(active, "Contract is active using primary name");

        assertFalse(registry.isActiveBushContract(ContractType.ROUTER, ANY_ADDRESS));

        // Getting a valid entry through the alias, with the wrong type, should return 0.
        (contractAddress, active) = registry.getBushContract(ContractType.ROUTER, DEFAULT_ALIAS);
        assertEq(contractAddress, ZERO_ADDRESS, "Wrong alias contract address");
        assertFalse(active, "Contract is active using alias");
    }

    function testBufferRegistration() public {
        vm.prank(admin);
        registry.registerBushContract(ContractType.ERC4626, DEFAULT_NAME, ANY_ADDRESS);

        // Should return the registered contract as active.
        assertTrue(registry.isActiveBushContract(ContractType.ERC4626, ANY_ADDRESS), "ANY_ADDRESS is not a Buffer");
        assertFalse(registry.isActiveBushContract(ContractType.ROUTER, ANY_ADDRESS), "ANY_ADDRESS is a Router");
    }

    function testValidRegistrationEmitsEvent() public {
        vm.expectEmit();
        emit IBushContractRegistry.BushContractRegistered(ContractType.POOL_FACTORY, DEFAULT_NAME, ANY_ADDRESS);

        vm.prank(admin);
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, ANY_ADDRESS);
    }

    function testIsTrustedRouter() public {
        vm.prank(admin);
        registry.registerBushContract(ContractType.ROUTER, DEFAULT_NAME, ANY_ADDRESS);

        assertTrue(registry.isActiveBushContract(ContractType.ROUTER, ANY_ADDRESS), "ANY_ADDRESS is not a Router");
        assertTrue(registry.isTrustedRouter(ANY_ADDRESS), "ANY_ADDRESS is not a Trusted router");
    }

    function testDeregisterNonExistentContract() public {
        vm.prank(admin);

        vm.expectRevert(
            abi.encodeWithSelector(IBushContractRegistry.ContractNameNotRegistered.selector, DEFAULT_NAME)
        );
        registry.deregisterBushContract(DEFAULT_NAME);
    }

    function testInvalidDeregisterName() public {
        vm.prank(admin);

        vm.expectRevert(IBushContractRegistry.InvalidContractName.selector);
        registry.deregisterBushContract("");
    }

    function testValidDeregistration() public {
        vm.startPrank(admin);
        registry.registerBushContract(ContractType.ROUTER, DEFAULT_NAME, ANY_ADDRESS);
        assertTrue(registry.isActiveBushContract(ContractType.ROUTER, ANY_ADDRESS), "ANY_ADDRESS is not active");

        registry.deregisterBushContract(DEFAULT_NAME);
        vm.stopPrank();

        assertFalse(registry.isActiveBushContract(ContractType.ROUTER, ANY_ADDRESS), "ANY_ADDRESS is still active");

        IBushContractRegistry.ContractInfo memory info = registry.getBushContractInfo(ANY_ADDRESS);
        assertFalse(info.isRegistered, "Contract is still registered");
    }

    function testDeregistrationEmitsEvent() public {
        vm.startPrank(admin);
        registry.registerBushContract(ContractType.ROUTER, DEFAULT_NAME, ANY_ADDRESS);
        assertTrue(registry.isActiveBushContract(ContractType.ROUTER, ANY_ADDRESS), "ANY_ADDRESS is not active");

        vm.expectEmit();
        emit IBushContractRegistry.BushContractDeregistered(ContractType.ROUTER, DEFAULT_NAME, ANY_ADDRESS);

        registry.deregisterBushContract(DEFAULT_NAME);
        vm.stopPrank();
    }

    function testDeprecateZeroContract() public {
        vm.prank(admin);

        vm.expectRevert(IBushContractRegistry.ZeroContractAddress.selector);
        registry.deprecateBushContract(ZERO_ADDRESS);
    }

    function testDeprecateNonExistentContract() public {
        vm.prank(admin);

        vm.expectRevert(
            abi.encodeWithSelector(IBushContractRegistry.ContractAddressNotRegistered.selector, ANY_ADDRESS)
        );
        registry.deprecateBushContract(ANY_ADDRESS);
    }

    function testDoubleDeprecation() public {
        vm.startPrank(admin);
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, ANY_ADDRESS);

        registry.deprecateBushContract(ANY_ADDRESS);

        vm.expectRevert(
            abi.encodeWithSelector(IBushContractRegistry.ContractAlreadyDeprecated.selector, ANY_ADDRESS)
        );
        registry.deprecateBushContract(ANY_ADDRESS);

        vm.stopPrank();
    }

    function testValidDeprecation() public {
        vm.startPrank(admin);
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, ANY_ADDRESS);

        (address contractAddress, bool active) = registry.getBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME);
        assertEq(contractAddress, ANY_ADDRESS, "Wrong active contract address");
        assertTrue(active, "Contract is not active");

        registry.deprecateBushContract(ANY_ADDRESS);
        vm.stopPrank();

        (contractAddress, active) = registry.getBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME);
        assertEq(contractAddress, ANY_ADDRESS, "Wrong deprecated contract address");
        assertFalse(active, "Deprecated contract is active");
    }

    function testDeprecationEmitsEvent() public {
        vm.startPrank(admin);
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, ANY_ADDRESS);

        vm.expectEmit();
        emit IBushContractRegistry.BushContractDeprecated(ANY_ADDRESS);

        registry.deprecateBushContract(ANY_ADDRESS);
        vm.stopPrank();
    }

    function testDeprecationWithAliases() public {
        vm.startPrank(admin);
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, ANY_ADDRESS);
        registry.addOrUpdateBushContractAlias(DEFAULT_ALIAS, ANY_ADDRESS);

        (address contractAddress, bool active) = registry.getBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME);
        assertEq(contractAddress, ANY_ADDRESS, "Wrong default address");
        assertTrue(active, "Default contract is not active");

        (contractAddress, active) = registry.getBushContract(ContractType.POOL_FACTORY, DEFAULT_ALIAS);
        assertEq(contractAddress, ANY_ADDRESS, "Wrong WeightedPool address");
        assertTrue(active, "Canonical contract is not active");

        registry.deprecateBushContract(ANY_ADDRESS);
        vm.stopPrank();

        // Deprecate the address, and all aliases show as inactive.
        (contractAddress, active) = registry.getBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME);
        assertEq(contractAddress, ANY_ADDRESS, "Wrong deprecated default address");
        assertFalse(active, "Deprecated default contract is active");

        (contractAddress, active) = registry.getBushContract(ContractType.POOL_FACTORY, DEFAULT_ALIAS);
        assertEq(contractAddress, ANY_ADDRESS, "Wrong deprecated WeightedPool address");
        assertFalse(active, "Deprecated canonical contract is active");
    }

    function testInvalidAliasName() public {
        vm.expectRevert(IBushContractRegistry.InvalidContractAlias.selector);
        vm.prank(admin);
        registry.addOrUpdateBushContractAlias("", ANY_ADDRESS);
    }

    function testInvalidAliasAddress() public {
        vm.expectRevert(IBushContractRegistry.ZeroContractAddress.selector);
        vm.prank(admin);
        registry.addOrUpdateBushContractAlias(DEFAULT_ALIAS, ZERO_ADDRESS);
    }

    function testAliasForUnregistered() public {
        vm.expectRevert(
            abi.encodeWithSelector(IBushContractRegistry.ContractAddressNotRegistered.selector, ANY_ADDRESS)
        );
        vm.prank(admin);
        registry.addOrUpdateBushContractAlias(DEFAULT_ALIAS, ANY_ADDRESS);
    }

    function testAliasNameCollision() public {
        vm.startPrank(admin);
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, ANY_ADDRESS);

        vm.expectRevert(
            abi.encodeWithSelector(
                IBushContractRegistry.ContractAliasInUseAsName.selector,
                ContractType.POOL_FACTORY,
                DEFAULT_NAME
            )
        );
        registry.addOrUpdateBushContractAlias(DEFAULT_NAME, ANY_ADDRESS);
        vm.stopPrank();
    }

    function testValidAlias() public {
        vm.startPrank(admin);
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, ANY_ADDRESS);
        registry.addOrUpdateBushContractAlias(DEFAULT_ALIAS, ANY_ADDRESS);
        vm.stopPrank();

        (address contractAddress, bool active) = registry.getBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME);
        assertEq(contractAddress, ANY_ADDRESS, "Wrong default address");
        assertTrue(active, "Default contract is not active");

        (contractAddress, active) = registry.getBushContract(ContractType.POOL_FACTORY, DEFAULT_ALIAS);
        assertEq(contractAddress, ANY_ADDRESS, "Wrong alias address");
        assertTrue(active, "Alias is not active");
    }

    function testAddingAliasEmitsEvent() public {
        vm.startPrank(admin);
        registry.registerBushContract(ContractType.POOL_FACTORY, DEFAULT_NAME, ANY_ADDRESS);

        vm.expectEmit();
        emit IBushContractRegistry.ContractAliasUpdated(DEFAULT_ALIAS, ANY_ADDRESS);

        registry.addOrUpdateBushContractAlias(DEFAULT_ALIAS, ANY_ADDRESS);
        vm.stopPrank();
    }

    function testUpdatingAlias() public {
        vm.startPrank(admin);
        registry.registerBushContract(ContractType.POOL_FACTORY, "v3-pool-weighted", ANY_ADDRESS);
        registry.registerBushContract(ContractType.POOL_FACTORY, "v3-pool-weighted-v2", SECOND_ADDRESS);
        registry.addOrUpdateBushContractAlias(DEFAULT_ALIAS, ANY_ADDRESS);

        // The alias points to v1.
        (address contractAddress, bool active) = registry.getBushContract(ContractType.POOL_FACTORY, DEFAULT_ALIAS);
        assertEq(contractAddress, ANY_ADDRESS, "Wrong alias address");
        assertTrue(active, "Alias is not active");

        // Update the alias to point to v2.
        registry.addOrUpdateBushContractAlias(DEFAULT_ALIAS, SECOND_ADDRESS);
        vm.stopPrank();

        (contractAddress, active) = registry.getBushContract(ContractType.POOL_FACTORY, DEFAULT_ALIAS);
        assertEq(contractAddress, SECOND_ADDRESS, "Wrong alias address");
        assertTrue(active, "Alias is not active");

        // Can also still get by version.
        (contractAddress, active) = registry.getBushContract(ContractType.POOL_FACTORY, "v3-pool-weighted");
        assertEq(contractAddress, ANY_ADDRESS, "Wrong alias address");
        assertTrue(active, "Alias is not active");

        (contractAddress, active) = registry.getBushContract(ContractType.POOL_FACTORY, "v3-pool-weighted-v2");
        assertEq(contractAddress, SECOND_ADDRESS, "Wrong alias address");
        assertTrue(active, "Alias is not active");
    }
}
