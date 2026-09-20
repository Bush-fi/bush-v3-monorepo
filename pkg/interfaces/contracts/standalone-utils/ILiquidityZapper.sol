// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import { IRouter } from "../vault/IRouter.sol";
import { TokenConfig, PoolRoleAccounts } from "../vault/VaultTypes.sol";

/**
 * @notice Buys a set of tokens through the Umbra aggregator (umbra.finance) and deposits them as liquidity
 * into a Bush pool, in a single transaction.
 * @dev The caller supplies one pre-built swap call per token to acquire, sourced from Umbra's
 * `POST /api/rh/build` off-chain quoting API (`calldata`/`value`/`amount`/`tokenOut` in the API response map
 * onto `SwapCall.callData`/`value`/`amountIn`/`tokenOut`). Every swap is sent to the single governance-set
 * `_umbraRouter` and funded from one shared input token (`ZapParams.tokenIn`, address(0) for native) pulled
 * once upfront for the sum of every swap's `amountIn`. The API request's `recipient` must be set to this
 * contract's address so the swap outputs land here. The resulting tokens are then either added to an existing
 * pool (`pool != address(0)`) or used to seed a brand-new `WeightedPoolFactory` pool (`pool == address(0)`,
 * using `newPool`). Any token dust left over after the join, and the minted BPT, are forwarded to `recipient`.
 */
interface ILiquidityZapper {
    /// @notice One pre-built Umbra swap, exactly as returned by `POST /api/rh/build`.
    struct SwapCall {
        // The API response's `calldata`, sent to the Umbra router unmodified.
        bytes callData;
        // The API response's `value`: the native amount to forward with this specific call (0 for an
        // ERC20-funded zap).
        uint256 value;
        // This leg's share of `ZapParams.tokenIn` (the API response's `amount`). Summed across every swap to
        // determine the total input to pull/require from the caller, and to size the upfront router approval.
        uint256 amountIn;
        // The token this swap is expected to deliver, from the API response. Used only for a post-call
        // sanity check (the swap must produce a positive balance delta) — the actual pool-funding amounts are
        // read from this contract's real balances of the pool's tokens after every swap has run.
        IERC20 tokenOut;
    }

    /// @notice Parameters for deploying and initializing a new weighted pool as the join target.
    struct NewPoolParams {
        // Address of a WeightedPoolFactory-compatible factory. Caller-chosen, like `pool` for the existing-pool
        // path: this contract never grants it a token approval, so a bad choice only risks the caller's own funds.
        address factory;
        string name;
        string symbol;
        // Must be sorted ascending by token address, as required by pool registration.
        TokenConfig[] tokenConfigs;
        uint256[] normalizedWeights;
        PoolRoleAccounts roleAccounts;
        uint256 swapFeePercentage;
        address poolHooksContract;
        bool enableDonation;
        bool disableUnbalancedLiquidity;
        bytes32 salt;
    }

    struct ZapParams {
        // Single input token shared by every swap (address(0) for native). Pulled once upfront for the sum of
        // every swap's `amountIn`.
        IERC20 tokenIn;
        // One Umbra swap per token to acquire; see `SwapCall`. Every request built for this call's swaps must
        // use this contract's address as the `recipient` when calling Umbra's build API.
        SwapCall[] swaps;
        // Existing pool to join. Set to address(0) to deploy a new pool via `newPool` instead.
        address pool;
        NewPoolParams newPool;
        uint256 minBptAmountOut;
        address recipient;
        uint256 deadline;
    }

    /**
     * @notice A zap completed: the input swaps were executed and the resulting tokens joined a pool.
     * @param sender The caller of `zap`
     * @param recipient The address that received the minted BPT and any leftover token dust
     * @param pool The pool that was joined (existing or newly created)
     * @param isNewPool True if `pool` was deployed by this call
     * @param bptAmountOut The amount of BPT minted
     */
    event Zapped(
        address indexed sender,
        address indexed recipient,
        address indexed pool,
        bool isNewPool,
        uint256 bptAmountOut
    );

    /// @notice The Umbra router every swap is sent to was updated.
    event UmbraRouterSet(address indexed umbraRouter);

    /// @notice `zap` was called with an empty `swaps` array.
    error NoSwaps();

    /// @notice `zap`'s deadline has passed.
    error ZapExpired();

    /// @notice `recipient` cannot be the zero address.
    error ZeroRecipient();

    /// @notice The sum of every swap's `amountIn` didn't match the native value/balance actually provided.
    error InputAmountMismatch();

    /// @notice A swap's `callData` ran but delivered none of its declared `tokenOut`.
    error SwapProducedNoOutput(uint256 swapIndex);

    /**
     * @notice Buy a set of tokens via Umbra and deposit them as liquidity into a Bush pool.
     * @param params The swaps to execute and the join target (existing pool or new-pool spec)
     * @return pool The pool that was joined (existing or newly created)
     * @return bptAmountOut The amount of BPT minted to `params.recipient`
     */
    function zap(ZapParams calldata params) external payable returns (address pool, uint256 bptAmountOut);

    /// @notice Returns the Router used to join/initialize pools.
    function getRouter() external view returns (IRouter);

    /// @notice Returns the Umbra router every swap's `callData` is currently sent to.
    function getUmbraRouter() external view returns (address);

    /**
     * @notice Set the Umbra router every swap's `callData` is sent to. Permissioned.
     * @param newUmbraRouter The new Umbra router address
     */
    function setUmbraRouter(address newUmbraRouter) external;

    /**
     * @notice Recover a token mistakenly stuck in this contract (e.g. force-sent, or a swap whose `recipient`
     * wasn't set to this contract). Permissioned. This contract holds no funds outside a `zap` call, so this
     * only ever moves stray/dust balances, never a live user's in-flight zap.
     * @param token The token to rescue (address(0) for native)
     * @param to The recipient of the rescued balance
     * @param amount The amount to rescue
     */
    function rescue(IERC20 token, address to, uint256 amount) external;
}
