// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.24;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

import { IChainlinkRateProvider } from "@bush.fi/v3-interfaces/contracts/standalone-utils/IChainlinkRateProvider.sol";
import { IRateProvider } from "@bush.fi/v3-interfaces/contracts/solidity-utils/helpers/IRateProvider.sol";

/**
 * @notice A rate provider backed by a Chainlink price feed.
 * @dev Chainlink feeds are not necessarily 18 decimals (most USD feeds are 8 decimals), so this contract scales
 * the feed's answer to 18 decimals to be compatible with the Vault. It also reverts if the feed's answer is not
 * positive, or if the feed has not been updated within `maxStaleness` seconds.
 */
contract ChainlinkRateProvider is IRateProvider, IChainlinkRateProvider {
    AggregatorV3Interface private immutable _feed;
    uint256 private immutable _maxStaleness;
    uint256 private immutable _scalingFactor;

    constructor(AggregatorV3Interface feed, uint256 maxStaleness) {
        _feed = feed;
        _maxStaleness = maxStaleness;
        // Reverts if the feed has more than 18 decimals, since a rate provider cannot scale down.
        _scalingFactor = 10 ** (18 - feed.decimals());
    }

    /// @inheritdoc IChainlinkRateProvider
    function getFeed() external view returns (AggregatorV3Interface) {
        return _feed;
    }

    /// @inheritdoc IChainlinkRateProvider
    function getMaxStaleness() external view returns (uint256) {
        return _maxStaleness;
    }

    /// @inheritdoc IChainlinkRateProvider
    function getScalingFactor() external view returns (uint256) {
        return _scalingFactor;
    }

    /// @inheritdoc IRateProvider
    function getRate() external view returns (uint256) {
        (, int256 answer, , uint256 updatedAt, ) = _feed.latestRoundData();

        if (answer <= 0) {
            revert InvalidRate(answer);
        }

        // solhint-disable-next-line not-rely-on-time
        if (block.timestamp - updatedAt > _maxStaleness) {
            revert StaleRate(updatedAt, _maxStaleness);
        }

        return uint256(answer) * _scalingFactor;
    }
}
