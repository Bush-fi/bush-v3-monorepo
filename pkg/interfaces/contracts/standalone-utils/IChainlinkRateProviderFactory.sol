// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

import { IChainlinkRateProvider } from "./IChainlinkRateProvider.sol";

interface IChainlinkRateProviderFactory {
    /**
     * @notice A new Chainlink Rate Provider was created.
     * @param feed The Chainlink feed used by the rate provider
     * @param maxStaleness The maximum allowed staleness of the feed, in seconds
     * @param rateProvider The address of the deployed rate provider
     */
    event RateProviderCreated(
        AggregatorV3Interface indexed feed,
        uint256 indexed maxStaleness,
        address indexed rateProvider
    );

    /// @notice Emitted when the factory is disabled.
    event RateProviderFactoryDisabled();

    /**
     * @notice A rate provider already exists for the given feed and staleness window.
     * @param feed The Chainlink feed used by the rate provider
     * @param maxStaleness The maximum allowed staleness of the feed, in seconds
     * @param rateProvider The address of the deployed rate provider
     */
    error RateProviderAlreadyExists(AggregatorV3Interface feed, uint256 maxStaleness, address rateProvider);

    /**
     * @notice The rate provider was not found for the given feed and staleness window.
     * @param feed The Chainlink feed used by the rate provider
     * @param maxStaleness The maximum allowed staleness of the feed, in seconds
     */
    error RateProviderNotFound(AggregatorV3Interface feed, uint256 maxStaleness);

    /// @notice The factory is disabled.
    error RateProviderFactoryIsDisabled();

    /**
     * @notice Returns a number representing the rate provider version.
     * @return rateProviderVersion The rate provider version number
     */
    function getRateProviderVersion() external view returns (uint256 rateProviderVersion);

    /**
     * @notice Creates a new Chainlink Rate Provider for the given feed and staleness window.
     * @param feed The Chainlink feed to use for the rate provider
     * @param maxStaleness The maximum time, in seconds, that can elapse since the feed's last update
     * @return rateProvider The address of the deployed rate provider
     */
    function create(
        AggregatorV3Interface feed,
        uint256 maxStaleness
    ) external returns (IChainlinkRateProvider rateProvider);

    /**
     * @notice Gets the rate provider for the given feed and staleness window.
     * @dev Reverts if the rate provider was not found for the given feed and staleness window.
     * @param feed The Chainlink feed used by the rate provider
     * @param maxStaleness The maximum allowed staleness of the feed, in seconds
     * @return rateProvider The address of the rate provider for the given feed and staleness window
     */
    function getRateProvider(
        AggregatorV3Interface feed,
        uint256 maxStaleness
    ) external view returns (IChainlinkRateProvider rateProvider);

    /**
     * @notice Checks whether the given rate provider was created by this factory.
     * @param rateProvider The rate provider to check
     * @return success True if the rate provider was created by this factory; false otherwise
     */
    function isRateProviderFromFactory(IChainlinkRateProvider rateProvider) external view returns (bool success);

    /**
     * @notice Disables the rate provider factory.
     * @dev A disabled rate provider factory cannot create new rate providers and cannot be re-enabled. However,
     * already created rate providers are still usable. This is a permissioned function.
     */
    function disable() external;
}
