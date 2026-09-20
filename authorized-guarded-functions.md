# Authorization-Guarded Functions

Generated 2026-08-01. Lists every non-test, non-mock function in `pkg/` that is
gated by an access-control check. Two distinct mechanisms are in use:

- **`authenticate`** — defined in
  [Authentication.sol](pkg/solidity-utils/contracts/helpers/Authentication.sol#L32).
  Resolves `getActionId(msg.sig)` and checks it against whatever `IAuthorizer`
  is configured (in this repo, that's the `TimelockAuthorizer` — see prior
  discussion). Permission is per-(contract, selector, account) and may carry a
  timelock delay.
- **`onlyOwner`** — standard OpenZeppelin `Ownable`. A single owner address,
  no delay, no per-action granularity.

One function (`enableRecoveryMode`) does a conditional authenticate call
rather than using the modifier — noted separately below.

---

## `authenticate`-guarded (TimelockAuthorizer-governed)

### Vault core — `pkg/vault/contracts/VaultAdmin.sol`
| Function | Line |
|---|---|
| `pauseVault()` | [165](pkg/vault/contracts/VaultAdmin.sol#L165) |
| `unpauseVault()` | [170](pkg/vault/contracts/VaultAdmin.sol#L170) |
| `setProtocolFeeController(IProtocolFeeController)` | [333](pkg/vault/contracts/VaultAdmin.sol#L333) |
| `disableRecoveryMode(address pool)` | [359](pkg/vault/contracts/VaultAdmin.sol#L359) |
| `disableQuery()` | [408](pkg/vault/contracts/VaultAdmin.sol#L408) |
| `disableQueryPermanently()` | [413](pkg/vault/contracts/VaultAdmin.sol#L413) |
| `enableQuery()` | [427](pkg/vault/contracts/VaultAdmin.sol#L427) |
| `pauseVaultBuffers()` | [449](pkg/vault/contracts/VaultAdmin.sol#L449) |
| `unpauseVaultBuffers()` | [454](pkg/vault/contracts/VaultAdmin.sol#L454) |
| `setAuthorizer(IAuthorizer newAuthorizer)` | [780](pkg/vault/contracts/VaultAdmin.sol#L780) |

*Conditional, not modifier-based:* `enableRecoveryMode(address pool)` ([VaultAdmin.sol:345](pkg/vault/contracts/VaultAdmin.sol#L345)) only calls `_authenticateCaller()` if the pool/Vault is **not** already paused — recovery mode is permissionless once something is broken, authenticated otherwise.

### Protocol fees — `pkg/vault/contracts/ProtocolFeeController.sol`
| Function | Line |
|---|---|
| `setGlobalProtocolSwapFeePercentage(uint256)` | [525](pkg/vault/contracts/ProtocolFeeController.sol#L525) |
| `setGlobalProtocolYieldFeePercentage(uint256)` | [538](pkg/vault/contracts/ProtocolFeeController.sol#L538) |
| `setProtocolSwapFeePercentage(address pool, uint256)` | [554](pkg/vault/contracts/ProtocolFeeController.sol#L554) |
| `setProtocolYieldFeePercentage(address pool, uint256)` | [562](pkg/vault/contracts/ProtocolFeeController.sol#L562) |
| `withdrawProtocolFees(address pool, address recipient)` | [606](pkg/vault/contracts/ProtocolFeeController.sol#L606) |
| `withdrawProtocolFeesForToken(address pool, address recipient, IERC20)` | [617](pkg/vault/contracts/ProtocolFeeController.sol#L617) |

### `pkg/standalone-utils/contracts/ProtocolFeePercentagesProvider.sol`
| Function | Line |
|---|---|
| `setFeeAmounts(pool, protocolSwapFeePercentage, protocolYieldFeePercentage)` | [87](pkg/standalone-utils/contracts/ProtocolFeePercentagesProvider.sol#L87) |

### `pkg/standalone-utils/contracts/BushContractRegistry.sol`
| Function | Line |
|---|---|
| `registerBushContract(ContractType, string name, address)` | [121](pkg/standalone-utils/contracts/BushContractRegistry.sol#L121) |
| `deregisterBushContract(string contractName)` | [167](pkg/standalone-utils/contracts/BushContractRegistry.sol#L167) |
| `deprecateBushContract(address contractAddress)` | [193](pkg/standalone-utils/contracts/BushContractRegistry.sol#L193) |
| `addOrUpdateBushContractAlias(string alias, address)` | [223](pkg/standalone-utils/contracts/BushContractRegistry.sol#L223) |

### `pkg/standalone-utils/contracts/TokenPairRegistry.sol`
| Function | Line |
|---|---|
| `addPath(address tokenIn, SwapPathStep[])` | [51](pkg/standalone-utils/contracts/TokenPairRegistry.sol#L51) |
| `addSimplePath(address poolOrBuffer)` | [81](pkg/standalone-utils/contracts/TokenPairRegistry.sol#L81) |
| `removePathAtIndex(tokenIn, tokenOut, index)` | [92](pkg/standalone-utils/contracts/TokenPairRegistry.sol#L92) |
| `removeSimplePath(address poolOrBuffer)` | [111](pkg/standalone-utils/contracts/TokenPairRegistry.sol#L111) |

### `pkg/standalone-utils/contracts/PoolHelperCommon.sol`
| Function | Line |
|---|---|
| `createPoolSet(address initialManager)` | [59](pkg/standalone-utils/contracts/PoolHelperCommon.sol#L59) |
| `createPoolSet(address initialManager, address[] newPools)` | [67](pkg/standalone-utils/contracts/PoolHelperCommon.sol#L67) |
| `destroyPoolSet(uint256 poolSetId)` | [87](pkg/standalone-utils/contracts/PoolHelperCommon.sol#L87) |
| `addPoolsToSet(uint256 poolSetId, address[] newPools)` | [137](pkg/standalone-utils/contracts/PoolHelperCommon.sol#L137) |
| `removePoolsFromSet(uint256 poolSetId, address[] pools)` | [163](pkg/standalone-utils/contracts/PoolHelperCommon.sol#L163) |

### `pkg/standalone-utils/contracts/HyperEVMRateProviderFactory.sol`
| Function | Line |
|---|---|
| `disable()` | [77](pkg/standalone-utils/contracts/HyperEVMRateProviderFactory.sol#L77) |

### `pkg/standalone-utils/contracts/OwnableAuthentication.sol`
| Function | Line |
|---|---|
| `forceTransferOwnership(address newOwner)` | [51](pkg/standalone-utils/contracts/OwnableAuthentication.sol#L51) |

### `pkg/pool-utils/contracts/BasePoolFactory.sol`
| Function | Line |
|---|---|
| `disable()` | [109](pkg/pool-utils/contracts/BasePoolFactory.sol#L109) |

### `pkg/oracles/contracts/LPOracleFactoryBase.sol`
| Function | Line |
|---|---|
| `disable()` | [121](pkg/oracles/contracts/LPOracleFactoryBase.sol#L121) |

### `pkg/pool-hooks/contracts/MevCaptureHook.sol`
| Function | Line |
|---|---|
| `disableMevTax()` | [187](pkg/pool-hooks/contracts/MevCaptureHook.sol#L187) |
| `enableMevTax()` | [192](pkg/pool-hooks/contracts/MevCaptureHook.sol#L192) |
| `setMaxMevSwapFeePercentage(uint256)` | [208](pkg/pool-hooks/contracts/MevCaptureHook.sol#L208) |
| `setDefaultMevTaxMultiplier(uint256)` | [228](pkg/pool-hooks/contracts/MevCaptureHook.sol#L228) |
| `setDefaultMevTaxThreshold(uint256)` | [263](pkg/pool-hooks/contracts/MevCaptureHook.sol#L263) |
| `addMevTaxExemptSenders(address[])` | [292](pkg/pool-hooks/contracts/MevCaptureHook.sol#L292) |
| `removeMevTaxExemptSenders(address[])` | [300](pkg/pool-hooks/contracts/MevCaptureHook.sol#L300) |

### `pkg/pool-cow/contracts/CowPoolFactory.sol`
| Function | Line |
|---|---|
| `setTrustedCowRouter(address newTrustedCowRouter)` | [88](pkg/pool-cow/contracts/CowPoolFactory.sol#L88) |

### `pkg/pool-cow/contracts/CowRouter.sol`
| Function | Line |
|---|---|
| `setProtocolFeePercentage(uint256)` | [69](pkg/pool-cow/contracts/CowRouter.sol#L69) |
| `setFeeSweeper(address newFeeSweeper)` | [84](pkg/pool-cow/contracts/CowRouter.sol#L84) |
| `swapExactInAndDonateSurplus(...)` | [112](pkg/pool-cow/contracts/CowRouter.sol#L112) |
| `swapExactOutAndDonateSurplus(...)` | [147](pkg/pool-cow/contracts/CowRouter.sol#L147) |
| `donate(address pool, uint256[] donationAmounts, bytes userData)` | [172](pkg/pool-cow/contracts/CowRouter.sol#L172) |

---

## `onlyOwner`-guarded (plain OpenZeppelin Ownable, no timelock)

### `pkg/vault/contracts/VaultFactory.sol`
| Function | Line |
|---|---|
| `create(...)` (deploys the canonical Vault) | [100](pkg/vault/contracts/VaultFactory.sol#L100) |

### `pkg/pool-hooks/contracts/LotteryHookExample.sol`
| Function | Line |
|---|---|
| `setHookSwapFeePercentage(uint64)` | [179](pkg/pool-hooks/contracts/LotteryHookExample.sol#L179) |

### `pkg/pool-hooks/contracts/ExitFeeHookExample.sol`
| Function | Line |
|---|---|
| `setExitFeePercentage(uint64)` | [181](pkg/pool-hooks/contracts/ExitFeeHookExample.sol#L181) |

### `pkg/pool-hooks/contracts/FeeTakingHookExample.sol`
| Function | Line |
|---|---|
| `setHookSwapFeePercentage(uint64)` | [268](pkg/pool-hooks/contracts/FeeTakingHookExample.sol#L268) |
| `setAddLiquidityHookFeePercentage(uint64)` | [279](pkg/pool-hooks/contracts/FeeTakingHookExample.sol#L279) |
| `setRemoveLiquidityHookFeePercentage(uint64)` | [290](pkg/pool-hooks/contracts/FeeTakingHookExample.sol#L290) |

---

## Not included

Everyday user-facing entry points — `Router.addLiquidity*`, `removeLiquidity*`,
`swap*`, `Vault.addLiquidity`/`removeLiquidity`/`swap`, and
`VaultExtension.registerPool` — are deliberately permissionless (see prior
discussion) and are excluded here. Test/mock contracts under `test/` and
`*Mock*` files are also excluded since they exist only for the test suite,
not production access control.
