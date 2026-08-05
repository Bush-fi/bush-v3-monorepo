// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

// This file is needed to compile artifacts from another repository using Hardhat.
import { VaultMock } from "@bush/v3-vault/contracts/test/VaultMock.sol";
import { BasicAuthorizerMock } from "@bush/v3-vault/contracts/test/BasicAuthorizerMock.sol";
import { VaultAdminMock } from "@bush/v3-vault/contracts/test/VaultAdminMock.sol";
import { VaultExtensionMock } from "@bush/v3-vault/contracts/test/VaultExtensionMock.sol";
import { ProtocolFeeControllerMock } from "@bush/v3-vault/contracts/test/ProtocolFeeControllerMock.sol";
import { RouterMock } from "@bush/v3-vault/contracts/test/RouterMock.sol";
import { BatchRouterMock } from "@bush/v3-vault/contracts/test/BatchRouterMock.sol";
import { BufferRouterMock } from "@bush/v3-vault/contracts/test/BufferRouterMock.sol";
import { PoolHooksMock } from "@bush/v3-vault/contracts/test/PoolHooksMock.sol";
import { RateProviderMock } from "@bush/v3-vault/contracts/test/RateProviderMock.sol";
import { CompositeLiquidityRouterMock } from "@bush/v3-vault/contracts/test/CompositeLiquidityRouterMock.sol";

import { WETHTestToken } from "@bush/v3-solidity-utils/contracts/test/WETHTestToken.sol";

import { WeightedPool } from "@bush/v3-pool-weighted/contracts/WeightedPool.sol";
import { WeightedPoolFactory } from "@bush/v3-pool-weighted/contracts/WeightedPoolFactory.sol";

import { StablePool } from "@bush/v3-pool-stable/contracts/StablePool.sol";
import { StablePoolFactory } from "@bush/v3-pool-stable/contracts/StablePoolFactory.sol";
