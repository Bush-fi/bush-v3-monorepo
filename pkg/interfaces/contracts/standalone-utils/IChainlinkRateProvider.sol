// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

interface IChainlinkRateProvider {
    /**
     * @notice The Chainlink price answer was not positive.
     * @param answer The invalid answer returned by the feed
     */
    error InvalidRate(int256 answer);

    /**
     * @notice The Chainlink feed has not been updated within the allowed staleness window.
     * @param updatedAt The timestamp of the feed's last update
     * @param maxStaleness The maximum allowed staleness, in seconds
     */
    error StaleRate(uint256 updatedAt, uint256 maxStaleness);

    /**
     * @notice The Chainlink feed used to compute the rate.
     * @return feed The Chainlink feed
     */
    function getFeed() external view returns (AggregatorV3Interface feed);

    /**
     * @notice The maximum time, in seconds, that can elapse since the feed's last update before `getRate` reverts.
     * @return maxStaleness The maximum staleness, in seconds
     */
    function getMaxStaleness() external view returns (uint256 maxStaleness);

    /**
     * @notice The scaling factor applied to the feed's answer to convert it to 18 decimals.
     * @dev Chainlink feeds are not necessarily 18 decimals (most USD feeds are 8 decimals), so this contract needs
     * to scale the feed's answer to 18 decimals to be compatible with the Vault.
     * @return scalingFactor The scaling factor
     */
    function getScalingFactor() external view returns (uint256 scalingFactor);
}
