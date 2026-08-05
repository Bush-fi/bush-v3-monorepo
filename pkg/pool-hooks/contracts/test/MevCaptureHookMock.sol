// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import {
    IBushContractRegistry
} from "@bush/v3-interfaces/contracts/standalone-utils/IBushContractRegistry.sol";
import { IVault } from "@bush/v3-interfaces/contracts/vault/IVault.sol";

import { MevCaptureHook } from "../MevCaptureHook.sol";

contract MevCaptureHookMock is MevCaptureHook {
    constructor(
        IVault vault,
        IBushContractRegistry registry,
        uint256 defaultMevTaxMultiplier,
        uint256 defaultMevTaxThreshold
    ) MevCaptureHook(vault, registry, defaultMevTaxMultiplier, defaultMevTaxThreshold) {
        // solhint-disable-previous-line no-empty-blocks
    }

    function calculateSwapFeePercentageExternal(
        uint256 staticSwapFeePercentage,
        uint256 multiplier,
        uint256 threshold
    ) external view returns (uint256 feePercentage) {
        return _calculateSwapFeePercentage(staticSwapFeePercentage, multiplier, threshold);
    }
}
