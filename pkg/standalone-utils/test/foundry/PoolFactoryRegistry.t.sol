// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IAuthentication } from "@bush.fi/v3-interfaces/contracts/solidity-utils/helpers/IAuthentication.sol";
import {
    IPoolFactoryRegistry,
    HookMode
} from "@bush.fi/v3-interfaces/contracts/standalone-utils/IPoolFactoryRegistry.sol";
import { IPoolVersion } from "@bush.fi/v3-interfaces/contracts/solidity-utils/helpers/IPoolVersion.sol";
import { IVersion } from "@bush.fi/v3-interfaces/contracts/solidity-utils/helpers/IVersion.sol";
import { IVault } from "@bush.fi/v3-interfaces/contracts/vault/IVault.sol";

import { PoolFactoryMock } from "@bush.fi/v3-vault/contracts/test/PoolFactoryMock.sol";
import { BaseVaultTest } from "@bush.fi/v3-vault/test/foundry/utils/BaseVaultTest.sol";

import { PoolFactoryRegistry } from "../../contracts/PoolFactoryRegistry.sol";

contract PoolFactoryRegistryTest is BaseVaultTest {
    // Addresses with no code, for negative tests.
    address private constant EOA = 0x388C818CA8B9251b393131C08a736A67ccB19297;
    address private constant EOA_HOOK = 0x2222222222222222222222222222222222222222;
    uint32 private constant PAUSE_WINDOW_DURATION = 365 days;

    string private constant DEFAULT_NAME = "20241205-v3-weighted-pool";
    string private constant SECOND_NAME = "20250120-v3-stable-surge";
    string private constant THIRD_NAME = "20241205-v3-weighted-pool-8020";
    string private constant WEIGHTED = "WEIGHTED";
    string private constant STABLE = "STABLE";
    string private constant COW = "COW";
    string private constant FACTORY_VERSION =
        '{"name":"WeightedPoolFactory","version":1,"deployment":"20241205-v3-weighted-pool"}';
    string private constant POOL_VERSION =
        '{"name":"WeightedPool","version":1,"deployment":"20241205-v3-weighted-pool"}';

    PoolFactoryRegistry private registry;

    // Real factory mocks (so that registration validation and pool lookups work).
    address private anyFactory;
    address private secondFactory;
    address private thirdFactory;
    // A contract address to use as a `SPECIFIC` hook.
    address private anyHook;

    function setUp() public override {
        BaseVaultTest.setUp();

        registry = new PoolFactoryRegistry(vault);

        // `poolFactory` (and `pool`) come from BaseVaultTest.
        anyFactory = poolFactory;
        secondFactory = address(new PoolFactoryMock(IVault(address(vault)), PAUSE_WINDOW_DURATION));
        thirdFactory = address(new PoolFactoryMock(IVault(address(vault)), PAUSE_WINDOW_DURATION));
        anyHook = poolHooksContract;

        // Grant permissions.
        authorizer.grantRole(registry.getActionId(PoolFactoryRegistry.registerPoolFactory.selector), admin);
        authorizer.grantRole(registry.getActionId(PoolFactoryRegistry.deregisterPoolFactory.selector), admin);
        authorizer.grantRole(registry.getActionId(PoolFactoryRegistry.deprecatePoolFactory.selector), admin);
    }

    function testGetVault() public view {
        assertEq(address(registry.getVault()), address(vault), "Wrong Vault address");
    }

    /***************************************************************************
                                    Register
    ***************************************************************************/

    function testRegisterWithoutPermission() public {
        vm.expectRevert(IAuthentication.SenderNotAllowed.selector);
        registry.registerPoolFactory(DEFAULT_NAME, anyFactory, WEIGHTED, HookMode.OPTIONAL, ZERO_ADDRESS);
    }

    function testRegisterWithBadAddress() public {
        vm.prank(admin);
        vm.expectRevert(IPoolFactoryRegistry.ZeroFactoryAddress.selector);
        registry.registerPoolFactory(DEFAULT_NAME, ZERO_ADDRESS, WEIGHTED, HookMode.OPTIONAL, ZERO_ADDRESS);
    }

    function testRegisterWithBadName() public {
        vm.prank(admin);
        vm.expectRevert(IPoolFactoryRegistry.InvalidFactoryName.selector);
        registry.registerPoolFactory("", anyFactory, WEIGHTED, HookMode.OPTIONAL, ZERO_ADDRESS);
    }

    function testRegisterWithBadPoolType() public {
        vm.prank(admin);
        vm.expectRevert(IPoolFactoryRegistry.InvalidPoolType.selector);
        registry.registerPoolFactory(DEFAULT_NAME, anyFactory, "", HookMode.OPTIONAL, ZERO_ADDRESS);
    }

    function testRegisterNonContractFactory() public {
        vm.prank(admin);
        vm.expectRevert(abi.encodeWithSelector(IPoolFactoryRegistry.FactoryNotAContract.selector, EOA));
        registry.registerPoolFactory(DEFAULT_NAME, EOA, WEIGHTED, HookMode.OPTIONAL, ZERO_ADDRESS);
    }

    function testRegisterFactoryForWrongVault() public {
        address otherVault = makeAddr("otherVault");
        address wrongVaultFactory = address(new PoolFactoryMock(IVault(otherVault), PAUSE_WINDOW_DURATION));

        vm.prank(admin);
        vm.expectRevert(
            abi.encodeWithSelector(IPoolFactoryRegistry.FactoryVaultMismatch.selector, wrongVaultFactory, otherVault)
        );
        registry.registerPoolFactory(DEFAULT_NAME, wrongVaultFactory, WEIGHTED, HookMode.OPTIONAL, ZERO_ADDRESS);
    }

    function testRegisterContractWithoutGetVault() public {
        // A contract that is not a Bush factory (no `getVault` at all): an ERC20 from the test setup.
        address notAFactory = address(dai);

        vm.prank(admin);
        vm.expectRevert(
            abi.encodeWithSelector(IPoolFactoryRegistry.FactoryVaultMismatch.selector, notAFactory, ZERO_ADDRESS)
        );
        registry.registerPoolFactory(DEFAULT_NAME, notAFactory, WEIGHTED, HookMode.OPTIONAL, ZERO_ADDRESS);
    }

    function testRegisterNewPoolType() public {
        // Pool types are free-form, so a type unknown at deployment time can still be registered and queried.
        vm.prank(admin);
        registry.registerPoolFactory("20260101-v3-reclamm", thirdFactory, "RECLAMM", HookMode.NONE, ZERO_ADDRESS);

        assertTrue(registry.isActivePoolFactoryOfType("RECLAMM", thirdFactory), "New type not active");
        assertFalse(registry.isActivePoolFactoryOfType("reclamm", thirdFactory), "Type match is not exact");

        address[] memory factories = registry.getPoolFactoriesByType("RECLAMM", true);
        assertEq(factories.length, 1, "Wrong number of factories");
        assertEq(factories[0], thirdFactory, "Wrong factory");
    }

    function testRegisterSpecificHookWithZeroHook() public {
        vm.prank(admin);
        vm.expectRevert(IPoolFactoryRegistry.ZeroHookAddress.selector);
        registry.registerPoolFactory(DEFAULT_NAME, anyFactory, STABLE, HookMode.SPECIFIC, ZERO_ADDRESS);
    }

    function testRegisterSpecificHookWithNonContractHook() public {
        vm.prank(admin);
        vm.expectRevert(abi.encodeWithSelector(IPoolFactoryRegistry.HookNotAContract.selector, EOA_HOOK));
        registry.registerPoolFactory(DEFAULT_NAME, anyFactory, STABLE, HookMode.SPECIFIC, EOA_HOOK);
    }

    function testRegisterNoHookWithHookAddress() public {
        vm.prank(admin);
        vm.expectRevert(
            abi.encodeWithSelector(IPoolFactoryRegistry.UnexpectedHookAddress.selector, HookMode.NONE, anyHook)
        );
        registry.registerPoolFactory(DEFAULT_NAME, anyFactory, WEIGHTED, HookMode.NONE, anyHook);
    }

    function testRegisterOptionalHookWithHookAddress() public {
        vm.prank(admin);
        vm.expectRevert(
            abi.encodeWithSelector(IPoolFactoryRegistry.UnexpectedHookAddress.selector, HookMode.OPTIONAL, anyHook)
        );
        registry.registerPoolFactory(DEFAULT_NAME, anyFactory, WEIGHTED, HookMode.OPTIONAL, anyHook);
    }

    function testDuplicateRegistrationAddress() public {
        vm.startPrank(admin);
        registry.registerPoolFactory(DEFAULT_NAME, anyFactory, WEIGHTED, HookMode.OPTIONAL, ZERO_ADDRESS);

        // Try to register the same address under a different name.
        vm.expectRevert(
            abi.encodeWithSelector(
                IPoolFactoryRegistry.FactoryAddressAlreadyRegistered.selector,
                anyFactory,
                DEFAULT_NAME
            )
        );
        registry.registerPoolFactory(SECOND_NAME, anyFactory, STABLE, HookMode.NONE, ZERO_ADDRESS);
        vm.stopPrank();
    }

    function testDuplicateRegistrationName() public {
        vm.startPrank(admin);
        registry.registerPoolFactory(DEFAULT_NAME, anyFactory, WEIGHTED, HookMode.OPTIONAL, ZERO_ADDRESS);

        // Try to register a different address under the same name.
        vm.expectRevert(
            abi.encodeWithSelector(IPoolFactoryRegistry.FactoryNameAlreadyRegistered.selector, DEFAULT_NAME, anyFactory)
        );
        registry.registerPoolFactory(DEFAULT_NAME, secondFactory, STABLE, HookMode.NONE, ZERO_ADDRESS);
        vm.stopPrank();
    }

    function testValidRegistrationOptionalHook() public {
        vm.prank(admin);
        registry.registerPoolFactory(DEFAULT_NAME, anyFactory, WEIGHTED, HookMode.OPTIONAL, ZERO_ADDRESS);

        assertTrue(registry.isActivePoolFactory(anyFactory), "Factory is not active");
        assertTrue(registry.isRegisteredPoolFactory(anyFactory), "Factory is not registered");
        assertTrue(registry.isActivePoolFactoryOfType(WEIGHTED, anyFactory), "Wrong type");
        assertFalse(registry.isActivePoolFactoryOfType(STABLE, anyFactory), "Matched wrong type");
        assertFalse(registry.isActivePoolFactory(secondFactory), "Unregistered factory is active");
        assertFalse(registry.isRegisteredPoolFactory(secondFactory), "Unregistered factory is registered");
        assertFalse(registry.isActivePoolFactory(ZERO_ADDRESS), "Zero address is active");

        IPoolFactoryRegistry.FactoryInfo memory info = registry.getPoolFactoryInfo(anyFactory);
        assertEq(info.name, DEFAULT_NAME, "Wrong name");
        assertEq(info.poolType, WEIGHTED, "Wrong pool type");
        assertEq(uint8(info.hookMode), uint8(HookMode.OPTIONAL), "Wrong hook mode");
        assertEq(info.hook, ZERO_ADDRESS, "Wrong hook");
        assertTrue(info.isRegistered, "Not registered");
        assertTrue(info.isActive, "Not active");
        assertEq(info.registeredAt, uint32(block.timestamp), "Wrong registeredAt");
        assertEq(info.deprecatedAt, 0, "Unexpected deprecatedAt");

        assertEq(registry.getPoolFactoryHook(anyFactory), ZERO_ADDRESS, "Optional hook should be zero");
        assertEq(registry.getPoolFactoryCount(), 1, "Wrong count");
        assertEq(registry.getPoolFactoryAt(0), anyFactory, "Wrong factory at index 0");
    }

    function testValidRegistrationSpecificHook() public {
        vm.prank(admin);
        registry.registerPoolFactory(SECOND_NAME, secondFactory, STABLE, HookMode.SPECIFIC, anyHook);

        IPoolFactoryRegistry.FactoryInfo memory info = registry.getPoolFactoryInfo(secondFactory);
        assertEq(info.name, SECOND_NAME, "Wrong name");
        assertEq(info.poolType, STABLE, "Wrong pool type");
        assertEq(uint8(info.hookMode), uint8(HookMode.SPECIFIC), "Wrong hook mode");
        assertEq(info.hook, anyHook, "Wrong hook");
        assertTrue(info.isRegistered, "Not registered");
        assertTrue(info.isActive, "Not active");

        assertEq(registry.getPoolFactoryHook(secondFactory), anyHook, "Wrong specific hook");
    }

    function testValidRegistrationNoHook() public {
        vm.prank(admin);
        registry.registerPoolFactory(DEFAULT_NAME, anyFactory, WEIGHTED, HookMode.NONE, ZERO_ADDRESS);

        IPoolFactoryRegistry.FactoryInfo memory info = registry.getPoolFactoryInfo(anyFactory);
        assertEq(uint8(info.hookMode), uint8(HookMode.NONE), "Wrong hook mode");
        assertEq(info.hook, ZERO_ADDRESS, "Wrong hook");
    }

    function testValidRegistrationEmitsEvent() public {
        vm.expectEmit();
        emit IPoolFactoryRegistry.PoolFactoryRegistered(secondFactory, SECOND_NAME, STABLE, HookMode.SPECIFIC, anyHook);

        vm.prank(admin);
        registry.registerPoolFactory(SECOND_NAME, secondFactory, STABLE, HookMode.SPECIFIC, anyHook);
    }

    /***************************************************************************
                                    Getters
    ***************************************************************************/

    function testGetByName() public {
        vm.prank(admin);
        registry.registerPoolFactory(SECOND_NAME, secondFactory, STABLE, HookMode.SPECIFIC, anyHook);

        (address factory, IPoolFactoryRegistry.FactoryInfo memory info) = registry.getPoolFactory(SECOND_NAME);
        assertEq(factory, secondFactory, "Wrong factory address");
        assertEq(info.name, SECOND_NAME, "Wrong name");
        assertEq(info.poolType, STABLE, "Wrong pool type");
        assertEq(uint8(info.hookMode), uint8(HookMode.SPECIFIC), "Wrong hook mode");
        assertEq(info.hook, anyHook, "Wrong hook");
        assertTrue(info.isActive, "Not active");
    }

    function testGetByUnknownName() public view {
        (address factory, IPoolFactoryRegistry.FactoryInfo memory info) = registry.getPoolFactory("unknown");
        assertEq(factory, ZERO_ADDRESS, "Unknown name resolved");
        assertFalse(info.isRegistered, "Unknown name is registered");
        assertFalse(info.isActive, "Unknown name is active");
        assertEq(bytes(info.poolType).length, 0, "Unknown name has type");
        assertEq(uint8(info.hookMode), uint8(HookMode.NONE), "Unknown name has hook mode");
        assertEq(info.registeredAt, 0, "Unknown name has registeredAt");
    }

    function testGetUnknownInfo() public view {
        IPoolFactoryRegistry.FactoryInfo memory info = registry.getPoolFactoryInfo(anyFactory);
        assertFalse(info.isRegistered, "Unknown factory is registered");
        assertEq(bytes(info.name).length, 0, "Unknown factory has name");
        assertEq(registry.getPoolFactoryHook(anyFactory), ZERO_ADDRESS, "Unknown factory has hook");
    }

    function testEnumeration() public {
        _registerThree();

        assertEq(registry.getPoolFactoryCount(), 3, "Wrong count");

        address[] memory factories = registry.getPoolFactories();
        assertEq(factories.length, 3, "Wrong number of factories");
        assertEq(factories[0], anyFactory, "Wrong factory 0");
        assertEq(factories[1], secondFactory, "Wrong factory 1");
        assertEq(factories[2], thirdFactory, "Wrong factory 2");
    }

    function testGetAllPoolFactories() public {
        _registerThree();

        vm.prank(admin);
        registry.deprecatePoolFactory(secondFactory);

        (address[] memory factories, IPoolFactoryRegistry.FactoryInfo[] memory infos) = registry.getAllPoolFactories();

        assertEq(factories.length, 3, "Wrong number of factories");
        assertEq(infos.length, 3, "Wrong number of infos");

        assertEq(factories[0], anyFactory, "Wrong factory 0");
        assertEq(infos[0].name, DEFAULT_NAME, "Wrong name 0");
        assertEq(infos[0].poolType, WEIGHTED, "Wrong type 0");
        assertTrue(infos[0].isActive, "Factory 0 not active");

        assertEq(factories[1], secondFactory, "Wrong factory 1");
        assertEq(infos[1].name, SECOND_NAME, "Wrong name 1");
        assertEq(infos[1].poolType, STABLE, "Wrong type 1");
        assertEq(infos[1].hook, anyHook, "Wrong hook 1");
        assertFalse(infos[1].isActive, "Factory 1 still active");
        assertTrue(infos[1].isRegistered, "Factory 1 not registered");

        assertEq(factories[2], thirdFactory, "Wrong factory 2");
        assertEq(infos[2].name, THIRD_NAME, "Wrong name 2");
        assertEq(uint8(infos[2].hookMode), uint8(HookMode.NONE), "Wrong hook mode 2");
    }

    function testGetAllPoolFactoriesEmpty() public view {
        (address[] memory factories, IPoolFactoryRegistry.FactoryInfo[] memory infos) = registry.getAllPoolFactories();

        assertEq(factories.length, 0, "Unexpected factories");
        assertEq(infos.length, 0, "Unexpected infos");
    }

    function testGetByType() public {
        _registerThree();

        // Deprecate one of the weighted factories.
        vm.prank(admin);
        registry.deprecatePoolFactory(anyFactory);

        address[] memory weighted = registry.getPoolFactoriesByType(WEIGHTED, false);
        assertEq(weighted.length, 2, "Wrong number of weighted factories");
        assertEq(weighted[0], anyFactory, "Wrong weighted factory 0");
        assertEq(weighted[1], thirdFactory, "Wrong weighted factory 1");

        address[] memory activeWeighted = registry.getPoolFactoriesByType(WEIGHTED, true);
        assertEq(activeWeighted.length, 1, "Wrong number of active weighted factories");
        assertEq(activeWeighted[0], thirdFactory, "Wrong active weighted factory");

        address[] memory stable = registry.getPoolFactoriesByType(STABLE, true);
        assertEq(stable.length, 1, "Wrong number of stable factories");
        assertEq(stable[0], secondFactory, "Wrong stable factory");

        address[] memory cow = registry.getPoolFactoriesByType(COW, false);
        assertEq(cow.length, 0, "Unexpected cow factories");
    }

    /***************************************************************************
                                  Pool lookups
    ***************************************************************************/

    function testGetFactoryForPool() public {
        _registerThree();

        // `pool` was created by `anyFactory` (the BaseVaultTest factory).
        (address factory, IPoolFactoryRegistry.FactoryInfo memory info) = registry.getFactoryForPool(pool);
        assertEq(factory, anyFactory, "Wrong factory for pool");
        assertEq(info.name, DEFAULT_NAME, "Wrong name for pool");
        assertEq(info.poolType, WEIGHTED, "Wrong type for pool");
        assertEq(uint8(info.hookMode), uint8(HookMode.OPTIONAL), "Wrong hook mode for pool");

        // A pool from the second factory resolves to it, with its `SPECIFIC` hook.
        address stablePool = PoolFactoryMock(secondFactory).createPool("Stable", "STB");
        (factory, info) = registry.getFactoryForPool(stablePool);
        assertEq(factory, secondFactory, "Wrong factory for stable pool");
        assertEq(info.poolType, STABLE, "Wrong type for stable pool");
        assertEq(info.hook, anyHook, "Wrong hook for stable pool");

        assertTrue(registry.isPoolFromRegisteredFactory(pool), "Pool not from registered factory");
        assertTrue(registry.isPoolFromRegisteredFactory(stablePool), "Stable pool not from registered factory");
        assertTrue(registry.isPoolOfType(WEIGHTED, pool), "Pool not weighted");
        assertFalse(registry.isPoolOfType(STABLE, pool), "Pool matched wrong type");
        assertTrue(registry.isPoolOfType(STABLE, stablePool), "Stable pool not stable");
        assertFalse(registry.isPoolOfType("stable", stablePool), "Type match is not exact");
    }

    function testGetFactoryForUnknownPool() public {
        _registerThree();

        // A pool from a factory that is not registered.
        address rogueFactory = address(new PoolFactoryMock(IVault(address(vault)), PAUSE_WINDOW_DURATION));
        address roguePool = PoolFactoryMock(rogueFactory).createPool("Rogue", "RGE");

        (address factory, IPoolFactoryRegistry.FactoryInfo memory info) = registry.getFactoryForPool(roguePool);
        assertEq(factory, ZERO_ADDRESS, "Rogue pool resolved to a factory");
        assertFalse(info.isRegistered, "Rogue pool info is registered");
        assertEq(bytes(info.poolType).length, 0, "Rogue pool has type");

        assertFalse(registry.isPoolFromRegisteredFactory(roguePool), "Rogue pool is from registered factory");
        assertFalse(registry.isPoolOfType(WEIGHTED, roguePool), "Rogue pool has a type");

        // Non-pool addresses (EOA, zero) also don't resolve.
        assertFalse(registry.isPoolFromRegisteredFactory(EOA), "EOA is a pool");
        assertFalse(registry.isPoolFromRegisteredFactory(ZERO_ADDRESS), "Zero address is a pool");
    }

    function testGetFactoryForPoolEmptyRegistry() public view {
        (address factory, ) = registry.getFactoryForPool(pool);
        assertEq(factory, ZERO_ADDRESS, "Pool resolved with empty registry");
        assertFalse(registry.isPoolFromRegisteredFactory(pool), "Pool from registered factory with empty registry");
    }

    function testGetFactoryForPoolFromDeprecatedFactory() public {
        _registerThree();

        // Deprecation does not affect the status of existing pools.
        vm.prank(admin);
        registry.deprecatePoolFactory(anyFactory);

        (address factory, IPoolFactoryRegistry.FactoryInfo memory info) = registry.getFactoryForPool(pool);
        assertEq(factory, anyFactory, "Pool from deprecated factory no longer resolves");
        assertFalse(info.isActive, "Deprecated factory active");
        assertTrue(registry.isPoolFromRegisteredFactory(pool), "Pool from deprecated factory not registered");
        assertTrue(registry.isPoolOfType(WEIGHTED, pool), "Pool from deprecated factory lost its type");
    }

    function testGetFactoryForPoolFromDeregisteredFactory() public {
        _registerThree();

        // Deregistration revokes trust in the factory's pools.
        vm.prank(admin);
        registry.deregisterPoolFactory(DEFAULT_NAME);

        (address factory, ) = registry.getFactoryForPool(pool);
        assertEq(factory, ZERO_ADDRESS, "Pool from deregistered factory still resolves");
        assertFalse(registry.isPoolFromRegisteredFactory(pool), "Pool from deregistered factory still registered");
    }

    function testGetFactoryForPoolSkipsRevertingFactory() public {
        _registerThree();

        // Simulate a registered factory that reverts on `isPoolFromFactory`: the lookup should skip it and still
        // find the pool via the other factories.
        vm.mockCallRevert(
            secondFactory,
            abi.encodeWithSelector(PoolFactoryMock.isPoolFromFactory.selector, pool),
            "boom"
        );

        (address factory, ) = registry.getFactoryForPool(pool);
        assertEq(factory, anyFactory, "Reverting factory broke the lookup");
    }

    /***************************************************************************
                                  Factory details
    ***************************************************************************/

    function testGetPoolFactoryDetails() public {
        _registerThree();
        _mockVersions(anyFactory, FACTORY_VERSION, POOL_VERSION);

        IPoolFactoryRegistry.FactoryDetails memory details = registry.getPoolFactoryDetails(anyFactory);
        assertEq(details.factory, anyFactory, "Wrong factory");
        assertEq(details.info.name, DEFAULT_NAME, "Wrong name");
        assertEq(details.info.poolType, WEIGHTED, "Wrong pool type");
        assertTrue(details.info.isActive, "Not active");
        assertEq(details.factoryVersion, FACTORY_VERSION, "Wrong factory version");
        assertEq(details.poolVersion, POOL_VERSION, "Wrong pool version");
        assertFalse(details.isDisabled, "Factory disabled");
        assertEq(details.poolCount, PoolFactoryMock(anyFactory).getPoolCount(), "Wrong pool count");
    }

    function testGetPoolFactoryDetailsWithoutVersion() public {
        // `PoolFactoryMock` doesn't implement `IVersion` / `IPoolVersion`; the details should still resolve.
        _registerThree();

        IPoolFactoryRegistry.FactoryDetails memory details = registry.getPoolFactoryDetails(secondFactory);
        assertEq(details.factory, secondFactory, "Wrong factory");
        assertEq(details.info.name, SECOND_NAME, "Wrong name");
        assertEq(details.info.hook, anyHook, "Wrong hook");
        assertEq(bytes(details.factoryVersion).length, 0, "Unexpected factory version");
        assertEq(bytes(details.poolVersion).length, 0, "Unexpected pool version");
        assertFalse(details.isDisabled, "Factory disabled");
    }

    function testGetPoolFactoryDetailsDisabled() public {
        _registerThree();

        // Disabling the factory on-chain is reflected live, independently of registry deprecation.
        authorizer.grantRole(PoolFactoryMock(thirdFactory).getActionId(PoolFactoryMock.disable.selector), admin);
        vm.prank(admin);
        PoolFactoryMock(thirdFactory).disable();

        IPoolFactoryRegistry.FactoryDetails memory details = registry.getPoolFactoryDetails(thirdFactory);
        assertTrue(details.isDisabled, "Factory not disabled");
        assertTrue(details.info.isActive, "Registry status changed by on-chain disable");
    }

    function testGetPoolFactoryDetailsUnregistered() public {
        _registerThree();
        _mockVersions(EOA, FACTORY_VERSION, POOL_VERSION);

        // Unregistered addresses return blank details, and are never called.
        IPoolFactoryRegistry.FactoryDetails memory details = registry.getPoolFactoryDetails(EOA);
        assertEq(details.factory, ZERO_ADDRESS, "Unregistered factory resolved");
        assertFalse(details.info.isRegistered, "Unregistered factory registered");
        assertEq(bytes(details.factoryVersion).length, 0, "Unregistered factory has version");
        assertEq(details.poolCount, 0, "Unregistered factory has pool count");
    }

    function testGetFactoryDetailsForPool() public {
        _registerThree();
        _mockVersions(anyFactory, FACTORY_VERSION, POOL_VERSION);

        IPoolFactoryRegistry.FactoryDetails memory details = registry.getFactoryDetailsForPool(pool);
        assertEq(details.factory, anyFactory, "Wrong factory for pool");
        assertEq(details.info.poolType, WEIGHTED, "Wrong type for pool");
        assertEq(details.factoryVersion, FACTORY_VERSION, "Wrong factory version for pool");
        assertEq(details.poolVersion, POOL_VERSION, "Wrong pool version for pool");

        details = registry.getFactoryDetailsForPool(EOA);
        assertEq(details.factory, ZERO_ADDRESS, "Unknown pool resolved");
    }

    function testGetAllPoolFactoryDetails() public {
        _registerThree();
        _mockVersions(secondFactory, FACTORY_VERSION, POOL_VERSION);

        vm.prank(admin);
        registry.deprecatePoolFactory(anyFactory);

        IPoolFactoryRegistry.FactoryDetails[] memory details = registry.getAllPoolFactoryDetails();
        assertEq(details.length, 3, "Wrong number of details");

        assertEq(details[0].factory, anyFactory, "Wrong factory 0");
        assertFalse(details[0].info.isActive, "Factory 0 still active");

        assertEq(details[1].factory, secondFactory, "Wrong factory 1");
        assertEq(details[1].info.poolType, STABLE, "Wrong type 1");
        assertEq(details[1].factoryVersion, FACTORY_VERSION, "Wrong factory version 1");
        assertEq(details[1].poolVersion, POOL_VERSION, "Wrong pool version 1");

        assertEq(details[2].factory, thirdFactory, "Wrong factory 2");
        assertEq(details[2].info.name, THIRD_NAME, "Wrong name 2");
        assertEq(bytes(details[2].factoryVersion).length, 0, "Unexpected factory version 2");
    }

    /***************************************************************************
                                    Deregister
    ***************************************************************************/

    function testDeregisterWithoutPermission() public {
        vm.expectRevert(IAuthentication.SenderNotAllowed.selector);
        registry.deregisterPoolFactory(DEFAULT_NAME);
    }

    function testDeregisterNonExistent() public {
        vm.prank(admin);
        vm.expectRevert(abi.encodeWithSelector(IPoolFactoryRegistry.FactoryNameNotRegistered.selector, DEFAULT_NAME));
        registry.deregisterPoolFactory(DEFAULT_NAME);
    }

    function testInvalidDeregisterName() public {
        vm.prank(admin);
        vm.expectRevert(IPoolFactoryRegistry.InvalidFactoryName.selector);
        registry.deregisterPoolFactory("");
    }

    function testValidDeregistration() public {
        vm.startPrank(admin);
        registry.registerPoolFactory(SECOND_NAME, secondFactory, STABLE, HookMode.SPECIFIC, anyHook);
        assertTrue(registry.isActivePoolFactory(secondFactory), "Factory not active");

        registry.deregisterPoolFactory(SECOND_NAME);
        vm.stopPrank();

        assertFalse(registry.isActivePoolFactory(secondFactory), "Factory still active");
        assertFalse(registry.isRegisteredPoolFactory(secondFactory), "Factory still registered");
        assertEq(registry.getPoolFactoryCount(), 0, "Factory still enumerated");

        IPoolFactoryRegistry.FactoryInfo memory info = registry.getPoolFactoryInfo(secondFactory);
        assertFalse(info.isRegistered, "Factory still registered");
        assertEq(info.hook, ZERO_ADDRESS, "Hook not cleared");
        assertEq(bytes(info.name).length, 0, "Name not cleared");
        assertEq(info.registeredAt, 0, "registeredAt not cleared");

        (address factory, ) = registry.getPoolFactory(SECOND_NAME);
        assertEq(factory, ZERO_ADDRESS, "Name still resolves");

        // Name and address should both be reusable after deregistration.
        vm.prank(admin);
        registry.registerPoolFactory(SECOND_NAME, secondFactory, STABLE, HookMode.NONE, ZERO_ADDRESS);
        assertTrue(registry.isActivePoolFactory(secondFactory), "Factory not re-registered");
    }

    function testDeregistrationEmitsEvent() public {
        vm.startPrank(admin);
        registry.registerPoolFactory(DEFAULT_NAME, anyFactory, WEIGHTED, HookMode.OPTIONAL, ZERO_ADDRESS);

        vm.expectEmit();
        emit IPoolFactoryRegistry.PoolFactoryDeregistered(anyFactory, DEFAULT_NAME);

        registry.deregisterPoolFactory(DEFAULT_NAME);
        vm.stopPrank();
    }

    /***************************************************************************
                                    Deprecate
    ***************************************************************************/

    function testDeprecateWithoutPermission() public {
        vm.expectRevert(IAuthentication.SenderNotAllowed.selector);
        registry.deprecatePoolFactory(anyFactory);
    }

    function testDeprecateZeroAddress() public {
        vm.prank(admin);
        vm.expectRevert(IPoolFactoryRegistry.ZeroFactoryAddress.selector);
        registry.deprecatePoolFactory(ZERO_ADDRESS);
    }

    function testDeprecateNonExistent() public {
        vm.prank(admin);
        vm.expectRevert(abi.encodeWithSelector(IPoolFactoryRegistry.FactoryAddressNotRegistered.selector, anyFactory));
        registry.deprecatePoolFactory(anyFactory);
    }

    function testDoubleDeprecation() public {
        vm.startPrank(admin);
        registry.registerPoolFactory(DEFAULT_NAME, anyFactory, WEIGHTED, HookMode.OPTIONAL, ZERO_ADDRESS);
        registry.deprecatePoolFactory(anyFactory);

        vm.expectRevert(abi.encodeWithSelector(IPoolFactoryRegistry.FactoryAlreadyDeprecated.selector, anyFactory));
        registry.deprecatePoolFactory(anyFactory);
        vm.stopPrank();
    }

    function testValidDeprecation() public {
        vm.startPrank(admin);
        registry.registerPoolFactory(SECOND_NAME, secondFactory, STABLE, HookMode.SPECIFIC, anyHook);
        assertTrue(registry.isActivePoolFactory(secondFactory), "Factory not active");
        uint32 registeredAt = uint32(block.timestamp);

        skip(1 days);
        registry.deprecatePoolFactory(secondFactory);
        vm.stopPrank();

        assertFalse(registry.isActivePoolFactory(secondFactory), "Factory still active");
        assertTrue(registry.isRegisteredPoolFactory(secondFactory), "Deprecated factory not registered");
        assertFalse(registry.isActivePoolFactoryOfType(STABLE, secondFactory), "Still active by type");

        // Still registered and resolvable by name, just inactive; metadata is preserved.
        (address factory, IPoolFactoryRegistry.FactoryInfo memory info) = registry.getPoolFactory(SECOND_NAME);
        assertEq(factory, secondFactory, "Deprecated factory no longer resolves");
        assertTrue(info.isRegistered, "Deprecated factory not registered");
        assertFalse(info.isActive, "Deprecated factory active");
        assertEq(info.hook, anyHook, "Hook lost on deprecation");
        assertEq(info.registeredAt, registeredAt, "registeredAt changed on deprecation");
        assertEq(info.deprecatedAt, uint32(block.timestamp), "Wrong deprecatedAt");
        assertEq(registry.getPoolFactoryCount(), 1, "Deprecated factory removed from enumeration");
    }

    function testDeprecationEmitsEvent() public {
        vm.startPrank(admin);
        registry.registerPoolFactory(DEFAULT_NAME, anyFactory, WEIGHTED, HookMode.OPTIONAL, ZERO_ADDRESS);

        vm.expectEmit();
        emit IPoolFactoryRegistry.PoolFactoryDeprecated(anyFactory);

        registry.deprecatePoolFactory(anyFactory);
        vm.stopPrank();
    }

    /***************************************************************************
                                     Helpers
    ***************************************************************************/

    function _mockVersions(address factory, string memory factoryVersion, string memory poolVersion) private {
        vm.mockCall(factory, abi.encodeWithSelector(IVersion.version.selector), abi.encode(factoryVersion));
        vm.mockCall(factory, abi.encodeWithSelector(IPoolVersion.getPoolVersion.selector), abi.encode(poolVersion));
    }

    function _registerThree() private {
        vm.startPrank(admin);
        registry.registerPoolFactory(DEFAULT_NAME, anyFactory, WEIGHTED, HookMode.OPTIONAL, ZERO_ADDRESS);
        registry.registerPoolFactory(SECOND_NAME, secondFactory, STABLE, HookMode.SPECIFIC, anyHook);
        registry.registerPoolFactory(THIRD_NAME, thirdFactory, WEIGHTED, HookMode.NONE, ZERO_ADDRESS);
        vm.stopPrank();
    }
}
