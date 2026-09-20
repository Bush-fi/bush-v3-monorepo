// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import { SafeERC20 } from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { Address } from "@openzeppelin/contracts/utils/Address.sol";
import { IPermit2 } from "permit2/src/interfaces/IPermit2.sol";

import { ILiquidityZapper } from "@bush.fi/v3-interfaces/contracts/standalone-utils/ILiquidityZapper.sol";
import { IRouter } from "@bush.fi/v3-interfaces/contracts/vault/IRouter.sol";
import { IVault } from "@bush.fi/v3-interfaces/contracts/vault/IVault.sol";
import { TokenConfig, PoolRoleAccounts } from "@bush.fi/v3-interfaces/contracts/vault/VaultTypes.sol";

import { SingletonAuthentication } from "@bush.fi/v3-vault/contracts/SingletonAuthentication.sol";
import {
    ReentrancyGuardTransient
} from "@bush.fi/v3-solidity-utils/contracts/openzeppelin/ReentrancyGuardTransient.sol";

import { WeightedPoolFactory } from "@bush.fi/v3-pool-weighted/contracts/WeightedPoolFactory.sol";

/**
 * @notice Buys a set of tokens through the Umbra aggregator (umbra.finance) and deposits them as liquidity
 * into a Bush pool, in a single transaction. See {ILiquidityZapper}.
 * @dev Never carries a standing balance across transactions: every token this contract can end up holding
 * (swap outputs, minted BPT) is swept to `recipient` before `zap` returns.
 *
 * Approval design: every swap's `callData` is sent to the single governance-set `_umbraRouter`, a trusted,
 * fixed contract (unlike the pool/factory addresses below, which are caller-chosen). Because it's trusted,
 * ERC20 input funding uses one upfront approval sized to the zap's total input (see `_executeSwaps`) rather
 * than a per-call exact-and-revoke pattern. The only OTHER standing approvals this contract ever holds are to
 * Permit2 and, through it, the immutable `_router` (also fixed at deployment) for post-swap pool
 * tokens ahead of the liquidity join. `pool` and `newPool.factory` are caller-chosen and never granted an
 * approval, so a bad choice there can only misroute the caller's own zap, exactly as if they had called the
 * Router directly.
 */
contract LiquidityZapper is ILiquidityZapper, SingletonAuthentication, ReentrancyGuardTransient {
    using SafeERC20 for IERC20;
    using Address for address;

    IRouter private immutable _router;
    IPermit2 private immutable _permit2;

    address private _umbraRouter;

    constructor(
        IVault vault,
        IRouter router,
        IPermit2 permit2,
        address umbraRouter
    ) SingletonAuthentication(vault) {
        _router = router;
        _permit2 = permit2;
        _setUmbraRouter(umbraRouter);
    }

    /// @inheritdoc ILiquidityZapper
    function zap(
        ZapParams calldata p
    ) external payable nonReentrant returns (address pool, uint256 bptAmountOut) {
        if (block.timestamp > p.deadline) revert ZapExpired();
        if (p.recipient == address(0)) revert ZeroRecipient();
        if (p.swaps.length == 0) revert NoSwaps();

        _executeSwaps(p.tokenIn, p.swaps);

        bool isNewPool = p.pool == address(0);
        IERC20[] memory tokens;
        uint256[] memory amounts;

        if (isNewPool) {
            (pool, tokens, amounts) = _createAndFundNewPool(p.newPool);
            _router.initialize(pool, tokens, amounts, p.minBptAmountOut, false, "");
        } else {
            pool = p.pool;
            (tokens, amounts) = _fundExistingPool(pool);
            _router.addLiquidityUnbalanced(pool, amounts, p.minBptAmountOut, false, "");
        }

        IERC20 bpt = IERC20(pool);
        bptAmountOut = bpt.balanceOf(address(this));
        if (bptAmountOut > 0) {
            bpt.safeTransfer(p.recipient, bptAmountOut);
        }

        // Refund any token dust left over from an unbalanced join (or from a swap that overshot its share).
        for (uint256 i = 0; i < tokens.length; ++i) {
            uint256 dust = tokens[i].balanceOf(address(this));
            if (dust > 0) {
                tokens[i].safeTransfer(p.recipient, dust);
            }
        }

        emit Zapped(msg.sender, p.recipient, pool, isNewPool, bptAmountOut);
    }

    /// @inheritdoc ILiquidityZapper
    function getRouter() external view returns (IRouter) {
        return _router;
    }

    /// @inheritdoc ILiquidityZapper
    function getUmbraRouter() external view returns (address) {
        return _umbraRouter;
    }

    /// @inheritdoc ILiquidityZapper
    function setUmbraRouter(address newUmbraRouter) external authenticate {
        _setUmbraRouter(newUmbraRouter);
    }

    /// @inheritdoc ILiquidityZapper
    function rescue(IERC20 token, address to, uint256 amount) external authenticate nonReentrant {
        if (address(token) == address(0)) {
            Address.sendValue(payable(to), amount);
        } else {
            token.safeTransfer(to, amount);
        }
    }

    function _setUmbraRouter(address newUmbraRouter) private {
        _umbraRouter = newUmbraRouter;
        emit UmbraRouterSet(newUmbraRouter);
    }

    /// Fund and run every swap against the single trusted `_umbraRouter`. For an ERC20 `tokenIn`, the total of
    /// every swap's `amountIn` is pulled from the caller once and approved to the router once upfront (safe as
    /// a standing amount because the router is fixed/trusted, not caller-supplied); for native `tokenIn`, that
    /// same total must match `msg.value`. Each call is checked to have actually moved its declared `tokenOut`.
    function _executeSwaps(IERC20 tokenIn, SwapCall[] calldata swaps) private {
        address umbraRouter = _umbraRouter;
        bool isNative = address(tokenIn) == address(0);

        uint256 totalAmountIn;
        for (uint256 i = 0; i < swaps.length; ++i) {
            totalAmountIn += swaps[i].amountIn;
        }

        if (isNative) {
            if (totalAmountIn != msg.value) revert InputAmountMismatch();
        } else {
            if (msg.value != 0) revert InputAmountMismatch();
            tokenIn.safeTransferFrom(msg.sender, address(this), totalAmountIn);
            tokenIn.forceApprove(umbraRouter, totalAmountIn);
        }

        for (uint256 i = 0; i < swaps.length; ++i) {
            SwapCall calldata sc = swaps[i];

            uint256 outBefore = sc.tokenOut.balanceOf(address(this));
            umbraRouter.functionCallWithValue(sc.callData, sc.value);
            if (sc.tokenOut.balanceOf(address(this)) <= outBefore) revert SwapProducedNoOutput(i);
        }

        if (!isNative) {
            // Revoke any leftover so no stale allowance survives this zap.
            if (tokenIn.allowance(address(this), umbraRouter) != 0) {
                tokenIn.forceApprove(umbraRouter, 0);
            }
        }
    }

    /// Collect this contract's balance of each token the existing pool holds, approving what's needed for the
    /// upcoming Router join along the way.
    function _fundExistingPool(
        address pool
    ) private returns (IERC20[] memory tokens, uint256[] memory amounts) {
        tokens = getVault().getPoolTokens(pool);
        amounts = new uint256[](tokens.length);

        for (uint256 i = 0; i < tokens.length; ++i) {
            uint256 balance = tokens[i].balanceOf(address(this));
            amounts[i] = balance;
            if (balance > 0) {
                _ensurePermit2Allowance(tokens[i], balance);
            }
        }
    }

    /// Deploy a new weighted pool from the caller-chosen factory, sized to this contract's balance of each
    /// configured token, approving what's needed for the upcoming Router initialize along the way.
    function _createAndFundNewPool(
        NewPoolParams calldata newPool
    ) private returns (address pool, IERC20[] memory tokens, uint256[] memory amounts) {
        (tokens, amounts) = _fundTokens(newPool.tokenConfigs);

        pool = WeightedPoolFactory(newPool.factory).create(
            newPool.name,
            newPool.symbol,
            newPool.tokenConfigs,
            newPool.normalizedWeights,
            newPool.roleAccounts,
            newPool.swapFeePercentage,
            newPool.poolHooksContract,
            newPool.enableDonation,
            newPool.disableUnbalancedLiquidity,
            newPool.salt
        );
    }

    function _fundTokens(
        TokenConfig[] calldata tokenConfigs
    ) private returns (IERC20[] memory tokens, uint256[] memory amounts) {
        uint256 count = tokenConfigs.length;
        tokens = new IERC20[](count);
        amounts = new uint256[](count);

        for (uint256 i = 0; i < count; ++i) {
            IERC20 token = tokenConfigs[i].token;
            tokens[i] = token;

            uint256 balance = token.balanceOf(address(this));
            amounts[i] = balance;
            if (balance > 0) {
                _ensurePermit2Allowance(token, balance);
            }
        }
    }

    /// Two-step Permit2 approval for the immutable, trusted Router (ERC20 -> Permit2, then
    /// Permit2 -> Router), each step lazily skipped once already sufficient. Unlike `_executeSwaps`'s
    /// per-swap approvals, a standing max-approve here is safe because both spenders are fixed at deployment,
    /// never caller-supplied.
    function _ensurePermit2Allowance(IERC20 token, uint256 amount) private {
        if (token.allowance(address(this), address(_permit2)) < amount) {
            token.forceApprove(address(_permit2), type(uint256).max);
        }

        (uint160 currentAllowance, , ) = _permit2.allowance(address(this), address(token), address(_router));
        if (currentAllowance < amount) {
            _permit2.approve(address(token), address(_router), type(uint160).max, type(uint48).max);
        }
    }
}
