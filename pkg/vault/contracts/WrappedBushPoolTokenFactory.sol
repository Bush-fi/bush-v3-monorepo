// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import { IERC20Metadata } from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import {
    IWrappedBushPoolTokenFactory
} from "@bush/v3-interfaces/contracts/vault/IWrappedBushPoolTokenFactory.sol";
import { IVault } from "@bush/v3-interfaces/contracts/vault/IVault.sol";

import { WrappedBushPoolToken } from "./WrappedBushPoolToken.sol";

/// @notice Factory contract for creating wrapped Bush pool tokens.
contract WrappedBushPoolTokenFactory is IWrappedBushPoolTokenFactory {
    IVault internal immutable _vault;

    // Maintain a mapping between the raw BPT and the wrapped version.
    mapping(address poolToken => address wrappedPoolToken) internal _wrappedTokens;

    constructor(IVault vault) {
        _vault = vault;
    }

    /// @inheritdoc IWrappedBushPoolTokenFactory
    function getVault() external view returns (IVault) {
        return _vault;
    }

    /// @inheritdoc IWrappedBushPoolTokenFactory
    function createWrappedToken(address bushPoolToken) external returns (address) {
        address wrappedToken = _wrappedTokens[bushPoolToken];
        if (wrappedToken != address(0)) {
            revert WrappedBPTAlreadyExists(wrappedToken);
        }

        if (_vault.isPoolRegistered(address(bushPoolToken)) == false) {
            revert BushPoolTokenNotRegistered();
        }

        string memory name = string(abi.encodePacked("Wrapped ", IERC20Metadata(bushPoolToken).name()));
        string memory symbol = string(abi.encodePacked("w", IERC20Metadata(bushPoolToken).symbol()));
        wrappedToken = address(new WrappedBushPoolToken(_vault, IERC20(bushPoolToken), name, symbol));

        _wrappedTokens[address(bushPoolToken)] = wrappedToken;
        emit WrappedTokenCreated(bushPoolToken, wrappedToken);

        return address(wrappedToken);
    }

    /// @inheritdoc IWrappedBushPoolTokenFactory
    function getWrappedToken(address bushPoolToken) external view returns (address) {
        return _wrappedTokens[bushPoolToken];
    }
}
