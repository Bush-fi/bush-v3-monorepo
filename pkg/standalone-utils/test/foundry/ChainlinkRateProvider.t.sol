// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

import { IChainlinkRateProvider } from "@bush.fi/v3-interfaces/contracts/standalone-utils/IChainlinkRateProvider.sol";

import { ChainlinkRateProvider } from "../../contracts/ChainlinkRateProvider.sol";
import { ChainlinkFeedMock } from "../../contracts/test/ChainlinkFeedMock.sol";

contract ChainlinkRateProviderTest is Test {
    uint256 private constant _MAX_STALENESS = 1 days;
    int256 private constant _ANSWER = 2000e8;

    ChainlinkFeedMock private _feed;
    ChainlinkRateProvider private _rateProvider;

    function setUp() public {
        _feed = new ChainlinkFeedMock(8);
        _feed.setAnswer(_ANSWER, block.timestamp);

        _rateProvider = new ChainlinkRateProvider(AggregatorV3Interface(address(_feed)), _MAX_STALENESS);
    }

    function testGetFeed() public view {
        assertEq(address(_rateProvider.getFeed()), address(_feed), "Wrong feed");
    }

    function testGetMaxStaleness() public view {
        assertEq(_rateProvider.getMaxStaleness(), _MAX_STALENESS, "Wrong max staleness");
    }

    function testGetScalingFactor() public view {
        assertEq(_rateProvider.getScalingFactor(), 1e10, "Wrong scaling factor");
    }

    function testGetRate() public view {
        assertEq(_rateProvider.getRate(), uint256(_ANSWER) * 1e10, "Wrong rate");
    }

    function testGetRateWith18DecimalFeed() public {
        ChainlinkFeedMock feed18 = new ChainlinkFeedMock(18);
        feed18.setAnswer(1.5e18, block.timestamp);
        ChainlinkRateProvider rateProvider18 = new ChainlinkRateProvider(
            AggregatorV3Interface(address(feed18)),
            _MAX_STALENESS
        );

        assertEq(rateProvider18.getScalingFactor(), 1, "Wrong scaling factor");
        assertEq(rateProvider18.getRate(), 1.5e18, "Wrong rate");
    }

    function testGetRateRevertsWithZeroAnswer() public {
        _feed.setAnswer(0, block.timestamp);

        vm.expectRevert(abi.encodeWithSelector(IChainlinkRateProvider.InvalidRate.selector, int256(0)));
        _rateProvider.getRate();
    }

    function testGetRateRevertsWithNegativeAnswer() public {
        _feed.setAnswer(-1, block.timestamp);

        vm.expectRevert(abi.encodeWithSelector(IChainlinkRateProvider.InvalidRate.selector, int256(-1)));
        _rateProvider.getRate();
    }

    function testGetRateRevertsWithStaleRate() public {
        uint256 updatedAt = block.timestamp;
        _feed.setAnswer(_ANSWER, updatedAt);

        vm.warp(block.timestamp + _MAX_STALENESS + 1);

        vm.expectRevert(abi.encodeWithSelector(IChainlinkRateProvider.StaleRate.selector, updatedAt, _MAX_STALENESS));
        _rateProvider.getRate();
    }

    function testGetRateAtStalenessBoundary() public {
        uint256 updatedAt = block.timestamp;
        _feed.setAnswer(_ANSWER, updatedAt);

        vm.warp(block.timestamp + _MAX_STALENESS);

        // Should not revert exactly at the boundary.
        assertEq(_rateProvider.getRate(), uint256(_ANSWER) * 1e10, "Wrong rate");
    }
}
