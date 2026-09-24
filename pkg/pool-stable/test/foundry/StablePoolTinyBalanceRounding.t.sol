// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import "forge-std/Test.sol";

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import { IRateProvider } from "@bush.fi/v3-interfaces/contracts/solidity-utils/helpers/IRateProvider.sol";
import { IVault } from "@bush.fi/v3-interfaces/contracts/vault/IVault.sol";
import { SwapPathExactAmountIn, SwapPathStep } from "@bush.fi/v3-interfaces/contracts/vault/BatchRouterTypes.sol";
import "@bush.fi/v3-interfaces/contracts/vault/VaultTypes.sol";

import { CastingHelpers } from "@bush.fi/v3-solidity-utils/contracts/helpers/CastingHelpers.sol";
import { InputHelpers } from "@bush.fi/v3-solidity-utils/contracts/helpers/InputHelpers.sol";
import { ArrayHelpers } from "@bush.fi/v3-solidity-utils/contracts/test/ArrayHelpers.sol";
import { StableMath } from "@bush.fi/v3-solidity-utils/contracts/math/StableMath.sol";
import { RateProviderMock } from "@bush.fi/v3-vault/contracts/test/RateProviderMock.sol";
import { BaseVaultTest } from "@bush.fi/v3-vault/test/foundry/utils/BaseVaultTest.sol";

import { StablePoolContractsDeployer } from "./utils/StablePoolContractsDeployer.sol";
import { StablePoolFactory } from "../../contracts/StablePoolFactory.sol";
import { StablePool } from "../../contracts/StablePool.sol";

/**
 * @notice Adversarial rounding tests for stable pools driven into tiny-balance states.
 * @dev Models the class of attack used against Balancer V2 composable stable pools (Nov 2025): push one balance as
 * close to zero as the pool allows, then chain many tiny swaps (optionally inside a single batch) so that per-swap
 * rounding errors accumulate and lower the invariant. The pools here are configured for the worst case: zero swap
 * fee, zero minimum trade amount (the BaseVaultTest default), high amplification, and a token with a non-round rate
 * so that scaling rounding is exercised as well.
 *
 * Properties checked:
 * - The live invariant never decreases after any swap (BPT supply is constant during swaps).
 * - A sequence of swaps followed by an unwind never leaves the attacker with a net profit.
 * - A multi-hop batch that round-trips through the same pool never returns more than it takes.
 */
contract StablePoolTinyBalanceRoundingTest is StablePoolContractsDeployer, BaseVaultTest {
    using CastingHelpers for address[];
    using ArrayHelpers for *;

    uint256 internal constant NUM_TINY_SWAPS = 40;
    uint256 internal constant BATCH_HOPS = 20;
    uint256 internal constant MIN_SWAP_FEE = 1e12;

    StablePoolFactory internal stableFactory;
    uint256 internal poolNonce;

    function setUp() public virtual override {
        BaseVaultTest.setUp();
        stableFactory = deployStablePoolFactory(IVault(address(vault)), 365 days, "Factory v1", "Pool v1");
    }

    /***************************************************************************
                                      Tests
    ***************************************************************************/

    function testTinySwapSequenceNeverDecreasesInvariant__Fuzz(
        uint256 ampRaw,
        uint256 rateRaw,
        uint256 poolSizeRaw,
        bool useOddDecimals,
        uint256 seed
    ) public {
        (address stablePool, IERC20[] memory poolTokens) = _createAttackedPool(
            ampRaw,
            rateRaw,
            poolSizeRaw,
            useOddDecimals
        );
        uint256[] memory aliceStart = _aliceBalances(poolTokens);

        uint256 lastInvariant = _liveInvariant(stablePool);

        for (uint256 i = 0; i < NUM_TINY_SWAPS; i++) {
            seed = uint256(keccak256(abi.encode(seed, i)));
            uint256 tokenIn = seed % 2;
            bool exactIn = (seed >> 8) % 2 == 0;
            // Tiny amounts: 1 wei up to ~1e6 raw units, capped by what the pool can provide.
            uint256 amount = 1 + ((seed >> 16) % 1e6);

            if (_trySwap(stablePool, poolTokens, tokenIn, 1 - tokenIn, amount, exactIn)) {
                uint256 invariant = _liveInvariant(stablePool);
                assertGe(invariant, lastInvariant, "Invariant decreased after tiny swap");
                lastInvariant = invariant;
            }
        }

        _assertNoProfitAfterUnwind(stablePool, poolTokens, aliceStart);
    }

    function testBatchRoundTripThroughTinyBalancePool__Fuzz(
        uint256 ampRaw,
        uint256 rateRaw,
        uint256 poolSizeRaw,
        bool useOddDecimals,
        uint256 amountRaw,
        bool startWithTinyToken
    ) public {
        (address stablePool, IERC20[] memory poolTokens) = _createAttackedPool(
            ampRaw,
            rateRaw,
            poolSizeRaw,
            useOddDecimals
        );
        uint256 invariantBefore = _liveInvariant(stablePool);

        (, , uint256[] memory balancesRaw, uint256[] memory balancesLiveScaled18) = vault.getPoolTokenInfo(stablePool);
        uint256 tinyIndex = _minIndex(balancesLiveScaled18);
        uint256 tokenInIndex = startWithTinyToken ? tinyIndex : 1 - tinyIndex;
        uint256 exactAmountIn = bound(amountRaw, 1, balancesRaw[tokenInIndex] / 10 + 1);

        // Build a path that bounces A -> B -> A -> ... through the same pool, ending in the starting token.
        SwapPathStep[] memory steps = new SwapPathStep[](BATCH_HOPS);
        for (uint256 i = 0; i < BATCH_HOPS; i++) {
            steps[i] = SwapPathStep({
                pool: stablePool,
                tokenOut: poolTokens[i % 2 == 0 ? 1 - tokenInIndex : tokenInIndex],
                isBuffer: false
            });
        }
        SwapPathExactAmountIn[] memory paths = new SwapPathExactAmountIn[](1);
        paths[0] = SwapPathExactAmountIn({
            tokenIn: poolTokens[tokenInIndex],
            steps: steps,
            exactAmountIn: exactAmountIn,
            minAmountOut: 0
        });

        vm.prank(alice);
        try batchRouter.swapExactIn(paths, MAX_UINT256, false, bytes("")) returns (
            uint256[] memory pathAmountsOut,
            address[] memory,
            uint256[] memory
        ) {
            assertLe(pathAmountsOut[0], exactAmountIn, "Batch round trip returned more than it took");
            assertGe(_liveInvariant(stablePool), invariantBefore, "Invariant decreased after batch round trip");
        } catch {
            // Some hop hit a limit (zero output, imbalance cap). Nothing was executed, so nothing to check.
            vm.assume(false);
        }
    }

    /**
     * @notice Documents current behavior found by `testTinySwapSequenceNeverDecreasesInvariant__Fuzz`.
     * @dev `StablePool.onSwap` enforces the max imbalance ratio on its own (unrounded) scaled18 amounts, but the Vault
     * then rounds the amount in up to a whole raw unit of the token in. For a 6-decimal token that unit is 1e12
     * scaled18, so an exact-out swap on a tiny pool can credit far more than the pool accounted for and leave the
     * pool beyond the cap. Value is not lost (the swapper overpays and the invariant grows), but while the pool is
     * past the cap, every swap reverts (`onSwap` checks the pre-swap min/max), and so does `StablePool.computeInvariant`,
     * which blocks unbalanced liquidity operations and the StableLPOracle TVL. Only proportional exits still work, and
     * they keep the ratio unchanged, so the pool stays stuck.
     */
    function testExactOutRoundUpCanExceedMaxImbalanceRatio() public {
        // Counterexample found by the fuzzer: amp 44,042-ish range, rate ~2.68, USDC-6 vs WSTETH, tiny pool.
        (address stablePool, IERC20[] memory poolTokens) = _createAttackedPool(
            1992335,
            17196698706774679304112430704010396044400734312343218473662684851771569538609,
            41437279961839,
            true
        );

        uint256 seed = 0;
        bool exceeded;
        for (uint256 i = 0; i < NUM_TINY_SWAPS && !exceeded; i++) {
            seed = uint256(keccak256(abi.encode(seed, i)));
            uint256 tokenIn = seed % 2;
            _trySwap(stablePool, poolTokens, tokenIn, 1 - tokenIn, 1 + ((seed >> 16) % 1e6), (seed >> 8) % 2 == 0);
            exceeded = _imbalanceRatio(stablePool) >= 10_000;
        }
        assertTrue(exceeded, "Expected a swap to push the pool past the max imbalance ratio");

        uint256[] memory live = vault.getCurrentLiveBalances(stablePool);
        vm.expectRevert(StableMath.MaxImbalanceRatioExceeded.selector);
        StablePool(stablePool).computeInvariant(live, Rounding.ROUND_DOWN);

        // Once past the cap, `onSwap` checks the pre-swap min/max, so every swap reverts, including ones that
        // would move the pool back toward balance.
        (, , uint256[] memory balancesRaw, ) = vault.getPoolTokenInfo(stablePool);
        for (uint256 tokenIn = 0; tokenIn < 2; tokenIn++) {
            uint256 smallAmount = balancesRaw[tokenIn] / 1000 + 1;
            assertFalse(_trySwap(stablePool, poolTokens, tokenIn, 1 - tokenIn, smallAmount, true), "ExactIn swap ok");
            assertFalse(_trySwap(stablePool, poolTokens, tokenIn, 1 - tokenIn, 1, false), "ExactOut swap ok");
        }

        // Unbalanced liquidity also goes through `computeInvariant`, so it cannot be used to rebalance either.
        uint256[] memory exactAmountsIn = new uint256[](2);
        exactAmountsIn[_minIndex(live)] = balancesRaw[_minIndex(live)];
        vm.prank(alice);
        vm.expectRevert(StableMath.MaxImbalanceRatioExceeded.selector);
        router.addLiquidityUnbalanced(stablePool, exactAmountsIn, 0, false, bytes(""));

        // Proportional exits remain available to LPs.
        uint256 lpBpt = IERC20(stablePool).balanceOf(lp);
        vm.startPrank(lp);
        IERC20(stablePool).approve(address(router), MAX_UINT256);
        router.removeLiquidityProportional(stablePool, lpBpt / 2, new uint256[](2), false, bytes(""));
        vm.stopPrank();
        assertGe(_imbalanceRatio(stablePool), 10_000, "Proportional exit should not fix the imbalance");
    }

    /**
     * @notice Documents current behavior: no swap is needed to get stuck. A pool parked near the imbalance cap whose
     * large-side token has a rate provider crosses the cap as soon as that rate rises slightly (e.g. yield accrual),
     * and from then on every swap reverts, as in `testExactOutRoundUpCanExceedMaxImbalanceRatio`.
     */
    function testRateIncreaseCanPushPoolPastMaxImbalanceRatio() public {
        address stablePool;
        IERC20[] memory poolTokens;
        uint256 rateTokenIndex;
        // Try both drain directions; keep the one where the rate token (WSTETH) ends up as the large side.
        for (uint256 parity = 0; parity < 2; parity++) {
            (stablePool, poolTokens) = _createAttackedPool(5000, 1.2e18, 1e21 + parity, false);
            rateTokenIndex = poolTokens[0] == IERC20(address(wsteth)) ? 0 : 1;
            uint256[] memory live = vault.getCurrentLiveBalances(stablePool);
            if (live[rateTokenIndex] > live[1 - rateTokenIndex]) break;
        }
        assertLt(_imbalanceRatio(stablePool), 10_000, "Pool should start within the cap");

        (, TokenInfo[] memory tokenInfo, , ) = vault.getPoolTokenInfo(stablePool);
        RateProviderMock rateProviderMock = RateProviderMock(address(tokenInfo[rateTokenIndex].rateProvider));

        // Accrue yield in 0.01% steps until the cap is crossed.
        uint256 rate = rateProviderMock.getRate();
        uint256 steps;
        while (_imbalanceRatio(stablePool) < 10_000 && steps < 1000) {
            rate = (rate * 10001) / 10000;
            rateProviderMock.mockRate(rate);
            steps++;
        }
        assertGe(_imbalanceRatio(stablePool), 10_000, "Rate increase did not cross the cap");
        emit log_named_uint("Rate increase needed (bps)", steps);

        (, , uint256[] memory balancesRaw, ) = vault.getPoolTokenInfo(stablePool);
        for (uint256 tokenIn = 0; tokenIn < 2; tokenIn++) {
            uint256 smallAmount = balancesRaw[tokenIn] / 1000 + 1;
            assertFalse(_trySwap(stablePool, poolTokens, tokenIn, 1 - tokenIn, smallAmount, true), "ExactIn swap ok");
        }
    }

    /***************************************************************************
                                     Helpers
    ***************************************************************************/

    /**
     * @dev Creates a 2-token stable pool (one token with a non-round rate), sets its fee to zero, and pushes one
     * balance as far toward zero as the max imbalance ratio allows, checking the invariant along the way.
     */
    function _createAttackedPool(
        uint256 ampRaw,
        uint256 rateRaw,
        uint256 poolSizeRaw,
        bool useOddDecimals
    ) internal returns (address stablePool, IERC20[] memory poolTokens) {
        // Bias toward high amplification, where the curve is flattest and precision is most stressed.
        uint256 amp = bound(ampRaw, 1000, StableMath.MAX_AMP);
        // Non-round rate so upscaling/downscaling rounds on every swap.
        uint256 rate = bound(rateRaw, 1e18 + 1, 3e18) | 1;
        // Pool size in scaled18 units: from dust (1e7) to large (1e24).
        uint256 poolSizeScaled18 = bound(poolSizeRaw, 1e7, 1e24);

        IERC20 plainToken = useOddDecimals ? IERC20(address(usdc6Decimals)) : IERC20(address(dai));
        uint256 plainDecimals = useOddDecimals ? 6 : 18;

        stablePool = _createStablePool(plainToken, amp, rate);
        (poolTokens, , , ) = vault.getPoolTokenInfo(stablePool);

        uint256[] memory initAmounts = new uint256[](2);
        for (uint256 i = 0; i < 2; i++) {
            if (poolTokens[i] == plainToken) {
                initAmounts[i] = poolSizeScaled18 / (10 ** (18 - plainDecimals));
            } else {
                initAmounts[i] = (poolSizeScaled18 * 1e18) / rate;
            }
            vm.assume(initAmounts[i] > 0);
        }

        vm.prank(lp);
        try router.initialize(stablePool, poolTokens, initAmounts, 0, false, bytes("")) {} catch {
            // Below the minimum BPT supply or otherwise uninitializable; not an interesting state.
            vm.assume(false);
        }

        vault.manualUnsafeSetStaticSwapFeePercentage(stablePool, 0);

        _pushTowardTinyBalance(stablePool, poolTokens, poolSizeRaw % 2);
    }

    function _createStablePool(IERC20 plainToken, uint256 amp, uint256 rate) internal returns (address newPool) {
        RateProviderMock rateProviderMock = new RateProviderMock();
        rateProviderMock.mockRate(rate);

        IERC20[] memory sortedTokens = InputHelpers.sortTokens(
            [address(plainToken), address(wsteth)].toMemoryArray().asIERC20()
        );
        TokenConfig[] memory tokenConfigs = new TokenConfig[](2);
        for (uint256 i = 0; i < 2; i++) {
            tokenConfigs[i].token = sortedTokens[i];
            if (sortedTokens[i] == IERC20(address(wsteth))) {
                tokenConfigs[i].tokenType = TokenType.WITH_RATE;
                tokenConfigs[i].rateProvider = IRateProvider(address(rateProviderMock));
            }
        }

        PoolRoleAccounts memory roleAccounts;
        newPool = stableFactory.create(
            "Tiny Stable",
            "TINY",
            tokenConfigs,
            amp,
            roleAccounts,
            MIN_SWAP_FEE, // Forced to zero after initialization.
            address(0),
            false,
            false,
            bytes32(poolNonce++)
        );
    }

    /// @dev Repeatedly drains `drainIndex` with exact-out swaps until the imbalance cap (or zero) stops it.
    /**
     * @dev Drains `drainIndex` with exact-out swaps of shrinking size (1/2, 1/16, ... of its balance) until even the
     * smallest step is rejected, leaving the pool within ~0.01% of the imbalance cap.
     */
    function _pushTowardTinyBalance(address stablePool, IERC20[] memory poolTokens, uint256 drainIndex) internal {
        uint256 lastInvariant = _liveInvariant(stablePool);

        for (uint256 divisor = 2; divisor <= 65536; divisor *= 8) {
            for (uint256 i = 0; i < 32; i++) {
                (, , uint256[] memory balancesRaw, ) = vault.getPoolTokenInfo(stablePool);
                uint256 amountOut = balancesRaw[drainIndex] / divisor;
                if (amountOut == 0 || !_trySwap(stablePool, poolTokens, 1 - drainIndex, drainIndex, amountOut, false)) {
                    break;
                }

                uint256 invariant = _liveInvariant(stablePool);
                assertGe(invariant, lastInvariant, "Invariant decreased while draining");
                lastInvariant = invariant;
            }
        }
    }

    function _trySwap(
        address stablePool,
        IERC20[] memory poolTokens,
        uint256 tokenIn,
        uint256 tokenOut,
        uint256 amount,
        bool exactIn
    ) internal returns (bool success) {
        vm.startPrank(alice);
        if (exactIn) {
            try
                router.swapSingleTokenExactIn(
                    stablePool,
                    poolTokens[tokenIn],
                    poolTokens[tokenOut],
                    amount,
                    0,
                    MAX_UINT256,
                    false,
                    bytes("")
                )
            {
                success = true;
            } catch {}
        } else {
            try
                router.swapSingleTokenExactOut(
                    stablePool,
                    poolTokens[tokenIn],
                    poolTokens[tokenOut],
                    amount,
                    MAX_UINT256,
                    MAX_UINT256,
                    false,
                    bytes("")
                )
            {
                success = true;
            } catch {}
        }
        vm.stopPrank();
    }

    /**
     * @dev Sells Alice's surplus token back into the token she is short of. After that she holds exactly her starting
     * amount of the surplus token, so any gain in the other token would be pure profit extracted from the pool.
     */
    function _assertNoProfitAfterUnwind(
        address stablePool,
        IERC20[] memory poolTokens,
        uint256[] memory aliceStart
    ) internal {
        uint256[] memory aliceNow = _aliceBalances(poolTokens);

        if (aliceNow[0] >= aliceStart[0] && aliceNow[1] >= aliceStart[1]) {
            assertTrue(aliceNow[0] == aliceStart[0] && aliceNow[1] == aliceStart[1], "Attacker profited from swaps");
            return;
        }

        uint256 surplusIndex = aliceNow[0] > aliceStart[0] ? 0 : 1;
        uint256 shortIndex = 1 - surplusIndex;
        if (aliceNow[surplusIndex] <= aliceStart[surplusIndex]) {
            // Down in both tokens: the attacker lost, which is fine.
            return;
        }

        uint256 surplus = aliceNow[surplusIndex] - aliceStart[surplusIndex];
        if (!_trySwap(stablePool, poolTokens, surplusIndex, shortIndex, surplus, true)) {
            // The unwind itself is blocked (e.g. output rounds to zero), so the surplus cannot be realized as profit.
            return;
        }

        uint256[] memory aliceEnd = _aliceBalances(poolTokens);
        assertEq(aliceEnd[surplusIndex], aliceStart[surplusIndex], "Unwind did not restore surplus token");
        assertLe(aliceEnd[shortIndex], aliceStart[shortIndex], "Attacker profited after unwind");
    }

    /**
     * @dev Uses StableMath directly rather than `StablePool.computeInvariant`, because the latter enforces the max
     * imbalance ratio, and swaps can leave the pool slightly beyond it (see
     * `testExactOutRoundUpCanExceedMaxImbalanceRatio`).
     */
    function _liveInvariant(address stablePool) internal view returns (uint256) {
        (uint256 amp, , ) = StablePool(stablePool).getAmplificationParameter();
        return StableMath.computeInvariant(amp, vault.getCurrentLiveBalances(stablePool));
    }

    function _imbalanceRatio(address stablePool) internal view returns (uint256) {
        uint256[] memory live = vault.getCurrentLiveBalances(stablePool);
        (uint256 minBalance, uint256 maxBalance) = StableMath.getMinAndMaxBalances(live);
        return maxBalance / minBalance;
    }

    function _aliceBalances(IERC20[] memory poolTokens) internal view returns (uint256[] memory balances) {
        balances = new uint256[](poolTokens.length);
        for (uint256 i = 0; i < poolTokens.length; i++) {
            balances[i] = poolTokens[i].balanceOf(alice);
        }
    }

    function _minIndex(uint256[] memory values) internal pure returns (uint256) {
        return values[0] <= values[1] ? 0 : 1;
    }
}
