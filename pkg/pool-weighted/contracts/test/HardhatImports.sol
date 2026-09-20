// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

// This file is needed to compile artifacts from another repository using Hardhat.
import { VaultMock } from "@bush.fi/v3-vault/contracts/test/VaultMock.sol";
import { BasicAuthorizerMock } from "@bush.fi/v3-vault/contracts/test/BasicAuthorizerMock.sol";
import { VaultAdminMock } from "@bush.fi/v3-vault/contracts/test/VaultAdminMock.sol";
import { VaultExtensionMock } from "@bush.fi/v3-vault/contracts/test/VaultExtensionMock.sol";
import { ProtocolFeeControllerMock } from "@bush.fi/v3-vault/contracts/test/ProtocolFeeControllerMock.sol";
import { RouterMock } from "@bush.fi/v3-vault/contracts/test/RouterMock.sol";
import { BatchRouterMock } from "@bush.fi/v3-vault/contracts/test/BatchRouterMock.sol";
import { BufferRouterMock } from "@bush.fi/v3-vault/contracts/test/BufferRouterMock.sol";
import { PoolHooksMock } from "@bush.fi/v3-vault/contracts/test/PoolHooksMock.sol";
import { RateProviderMock } from "@bush.fi/v3-vault/contracts/test/RateProviderMock.sol";
import { CompositeLiquidityRouterMock } from "@bush.fi/v3-vault/contracts/test/CompositeLiquidityRouterMock.sol";
