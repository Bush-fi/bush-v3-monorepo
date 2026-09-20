// SPDX-License-Identifier: GPL-2.0-or-later

pragma solidity ^0.8.24;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

import { IAuthentication } from "@bush/v3-interfaces/contracts/solidity-utils/helpers/IAuthentication.sol";
import { IVersion } from "@bush/v3-interfaces/contracts/solidity-utils/helpers/IVersion.sol";
import {
    IChainlinkRateProviderFactory
} from "@bush/v3-interfaces/contracts/standalone-utils/IChainlinkRateProviderFactory.sol";
import { IChainlinkRateProvider } from "@bush/v3-interfaces/contracts/standalone-utils/IChainlinkRateProvider.sol";

import { BaseVaultTest } from "@bush/v3-vault/test/foundry/utils/BaseVaultTest.sol";

import { ChainlinkRateProviderFactory } from "../../contracts/ChainlinkRateProviderFactory.sol";
import { ChainlinkFeedMock } from "../../contracts/test/ChainlinkFeedMock.sol";

contract ChainlinkRateProviderFactoryTest is BaseVaultTest {
    string constant RATE_PROVIDER_FACTORY_VERSION = "Factory v1";
    uint256 constant RATE_PROVIDER_VERSION = 1;

    uint256 private constant _MAX_STALENESS = 1 days;

    IChainlinkRateProviderFactory internal _factory;
    AggregatorV3Interface internal _feed;

    function setUp() public virtual override {
        BaseVaultTest.setUp();

        _factory = _createRateProviderFactory();

        authorizer.grantRole(
            IAuthentication(address(_factory)).getActionId(IChainlinkRateProviderFactory.disable.selector),
            admin
        );

        ChainlinkFeedMock feedMock = new ChainlinkFeedMock(8);
        feedMock.setAnswer(2000e8, block.timestamp);
        _feed = AggregatorV3Interface(address(feedMock));
    }

    function testRateProviderFactoryVersion() public view {
        assertEq(
            IVersion(address(_factory)).version(),
            RATE_PROVIDER_FACTORY_VERSION,
            "Wrong rate provider factory version"
        );
    }

    function testRateProviderVersion() public view {
        assertEq(_factory.getRateProviderVersion(), RATE_PROVIDER_VERSION, "Wrong rate provider version");
    }

    function testCreateRateProvider() external {
        IChainlinkRateProvider rateProvider;

        uint256 snapId = vm.snapshotState();
        rateProvider = _factory.create(_feed, _MAX_STALENESS);
        address rateProviderAddress = address(rateProvider);
        vm.revertToState(snapId);

        vm.expectEmit();
        emit IChainlinkRateProviderFactory.RateProviderCreated(_feed, _MAX_STALENESS, rateProviderAddress);
        rateProvider = _factory.create(_feed, _MAX_STALENESS);

        assertEq(
            address(rateProvider),
            address(_factory.getRateProvider(_feed, _MAX_STALENESS)),
            "Rate provider address mismatch"
        );
        assertTrue(_factory.isRateProviderFromFactory(rateProvider), "Rate provider should be from factory");
        assertEq(address(rateProvider.getFeed()), address(_feed), "Wrong feed");
        assertEq(rateProvider.getMaxStaleness(), _MAX_STALENESS, "Wrong max staleness");
    }

    function testGetNonExistentRateProvider() external {
        vm.expectRevert(
            abi.encodeWithSelector(IChainlinkRateProviderFactory.RateProviderNotFound.selector, _feed, _MAX_STALENESS)
        );
        _factory.getRateProvider(_feed, _MAX_STALENESS);
    }

    function testCreateRateProviderDifferentFeedAndStaleness() external {
        IChainlinkRateProvider rateProvider = _factory.create(_feed, _MAX_STALENESS);

        assertEq(
            address(rateProvider),
            address(_factory.getRateProvider(_feed, _MAX_STALENESS)),
            "Rate provider address mismatch"
        );
        assertTrue(_factory.isRateProviderFromFactory(rateProvider), "Rate provider should be from factory");

        IChainlinkRateProvider rateProvider2 = _factory.create(_feed, _MAX_STALENESS * 2);

        assertEq(
            address(rateProvider2),
            address(_factory.getRateProvider(_feed, _MAX_STALENESS * 2)),
            "Rate provider address mismatch"
        );
        assertTrue(_factory.isRateProviderFromFactory(rateProvider2), "Rate provider should be from factory");
    }

    function testCreateRateProviderRevertsWhenRateProviderAlreadyExists() external {
        IChainlinkRateProvider rateProvider = _factory.create(_feed, _MAX_STALENESS);

        vm.expectRevert(
            abi.encodeWithSelector(
                IChainlinkRateProviderFactory.RateProviderAlreadyExists.selector,
                _feed,
                _MAX_STALENESS,
                address(rateProvider)
            )
        );
        _factory.create(_feed, _MAX_STALENESS);
    }

    function testDisable() public {
        vm.prank(admin);
        _factory.disable();

        vm.expectRevert(IChainlinkRateProviderFactory.RateProviderFactoryIsDisabled.selector);
        _factory.create(_feed, _MAX_STALENESS);

        // Revert the second time
        vm.prank(admin);
        vm.expectRevert(IChainlinkRateProviderFactory.RateProviderFactoryIsDisabled.selector);
        _factory.disable();
    }

    function testDisableIsAuthenticated() public {
        vm.expectRevert(IAuthentication.SenderNotAllowed.selector);
        _factory.disable();
    }

    function _createRateProviderFactory() internal returns (IChainlinkRateProviderFactory) {
        return new ChainlinkRateProviderFactory(vault, RATE_PROVIDER_FACTORY_VERSION, RATE_PROVIDER_VERSION);
    }
}
