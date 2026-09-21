# @bush.fi/v3-vault

## 1.0.2

### Patch Changes

- Republished with resolved `@bush.fi` workspace dependency versions. The previous release was published with unresolved `workspace:*` ranges in its `dependencies`, which made it uninstallable outside this monorepo.

## 1.0.1

### Patch Changes

- 4c716b3: Fix ETH locked in CompositeLiquidityRouter when removeLiquidityProportionalFromERC4626Pool is called with msg.value. The remove-liquidity hook was missing a
- 6d56efe: Fix BatchRouter revert in ExactOut batch swap paths where addLiquidity is the final step. Multi-step paths ending with a join operation would underflow due to a unit mismatch in BPT settlement tracking.
