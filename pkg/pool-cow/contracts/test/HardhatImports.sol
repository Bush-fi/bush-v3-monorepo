// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

// This file is needed to compile artifacts from another repository using Hardhat.
import { ProtocolFeeControllerMock } from "@bush.fi/v3-vault/contracts/test/ProtocolFeeControllerMock.sol";
import { BasicAuthorizerMock } from "@bush.fi/v3-vault/contracts/test/BasicAuthorizerMock.sol";
import { VaultExtensionMock } from "@bush.fi/v3-vault/contracts/test/VaultExtensionMock.sol";
import { WETHTestToken } from "@bush.fi/v3-solidity-utils/contracts/test/WETHTestToken.sol";
import { BufferRouterMock } from "@bush.fi/v3-vault/contracts/test/BufferRouterMock.sol";
import { RateProviderMock } from "@bush.fi/v3-vault/contracts/test/RateProviderMock.sol";
import { BatchRouterMock } from "@bush.fi/v3-vault/contracts/test/BatchRouterMock.sol";
import { VaultAdminMock } from "@bush.fi/v3-vault/contracts/test/VaultAdminMock.sol";
import { PoolHooksMock } from "@bush.fi/v3-vault/contracts/test/PoolHooksMock.sol";
import { RouterMock } from "@bush.fi/v3-vault/contracts/test/RouterMock.sol";
import { VaultMock } from "@bush.fi/v3-vault/contracts/test/VaultMock.sol";
import { CompositeLiquidityRouterMock } from "@bush.fi/v3-vault/contracts/test/CompositeLiquidityRouterMock.sol";
