// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

import {
    IChainlinkRateProviderFactory
} from "@bush/v3-interfaces/contracts/standalone-utils/IChainlinkRateProviderFactory.sol";
import { IChainlinkRateProvider } from "@bush/v3-interfaces/contracts/standalone-utils/IChainlinkRateProvider.sol";
import { IVault } from "@bush/v3-interfaces/contracts/vault/IVault.sol";

import { SingletonAuthentication } from "@bush/v3-vault/contracts/SingletonAuthentication.sol";
import { Version } from "@bush/v3-solidity-utils/contracts/helpers/Version.sol";

import { ChainlinkRateProvider } from "./ChainlinkRateProvider.sol";

/// @notice Factory for deploying and managing Chainlink rate providers.
contract ChainlinkRateProviderFactory is IChainlinkRateProviderFactory, SingletonAuthentication, Version {
    uint256 internal immutable _rateProviderVersion;
    bool internal _isDisabled;

    mapping(bytes32 rateProviderId => IChainlinkRateProvider rateProvider) internal _rateProviders;
    mapping(IChainlinkRateProvider rateProvider => bool creationFlag) internal _isRateProviderFromFactory;

    constructor(
        IVault vault,
        string memory factoryVersion,
        uint256 rateProviderVersion
    ) SingletonAuthentication(vault) Version(factoryVersion) {
        _rateProviderVersion = rateProviderVersion;
    }

    /// @inheritdoc IChainlinkRateProviderFactory
    function getRateProviderVersion() external view returns (uint256) {
        return _rateProviderVersion;
    }

    /// @inheritdoc IChainlinkRateProviderFactory
    function create(
        AggregatorV3Interface feed,
        uint256 maxStaleness
    ) external returns (IChainlinkRateProvider rateProvider) {
        _ensureEnabled();

        bytes32 rateProviderId = _computeRateProviderId(feed, maxStaleness);

        address existingRateProvider = address(_rateProviders[rateProviderId]);

        if (existingRateProvider != address(0)) {
            revert RateProviderAlreadyExists(feed, maxStaleness, existingRateProvider);
        }

        rateProvider = IChainlinkRateProvider(address(new ChainlinkRateProvider(feed, maxStaleness)));
        _rateProviders[rateProviderId] = rateProvider;
        _isRateProviderFromFactory[rateProvider] = true;

        emit RateProviderCreated(feed, maxStaleness, address(rateProvider));
    }

    /// @inheritdoc IChainlinkRateProviderFactory
    function getRateProvider(
        AggregatorV3Interface feed,
        uint256 maxStaleness
    ) external view returns (IChainlinkRateProvider rateProvider) {
        bytes32 rateProviderId = _computeRateProviderId(feed, maxStaleness);
        rateProvider = _rateProviders[rateProviderId];
        if (address(rateProvider) == address(0)) {
            revert RateProviderNotFound(feed, maxStaleness);
        }
        return rateProvider;
    }

    /// @inheritdoc IChainlinkRateProviderFactory
    function isRateProviderFromFactory(IChainlinkRateProvider rateProvider) external view returns (bool) {
        return _isRateProviderFromFactory[rateProvider];
    }

    /// @inheritdoc IChainlinkRateProviderFactory
    function disable() external authenticate {
        _ensureEnabled();

        _isDisabled = true;
        emit RateProviderFactoryDisabled();
    }

    function _computeRateProviderId(AggregatorV3Interface feed, uint256 maxStaleness) internal pure returns (bytes32) {
        return keccak256(abi.encode(feed, maxStaleness));
    }

    function _ensureEnabled() internal view {
        if (_isDisabled) {
            revert RateProviderFactoryIsDisabled();
        }
    }
}
