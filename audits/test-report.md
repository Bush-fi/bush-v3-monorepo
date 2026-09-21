The following is the output of a complete test run, made on upstream Balancer V3 commit [`992898f`](https://github.com/balancer/balancer-v3-monorepo/commit/992898f30f87c224f59e1f3dcc43e9c7010c8cd4), from July 20th, 2025. 

## Test Methodology

The output reflects the general best practices for unit test creation:

```
describe("Contract under test")
  describe("Feature")
    context("Configuration for a set of tests - this can be nested as needed, for complex cases")
      it("individual tests within a given configuration (e.g., 'caller is owner', 'caller is not owner', etc.)")
```
      
It is important that the text description accurately reflects the content of the test, and that *only* the feature described is tested. Ideally, the concatenation of descriptive texts for any given test forms a clear, understandable narrative.

```
[@bush.fi/v3-pool-cow]: Process started
[@bush.fi/v3-pool-gyro]: Process started
[@bush.fi/v3-pool-hooks]: Process started
[@bush.fi/v3-pool-stable]: Process started
[@bush.fi/v3-pool-utils]: Process started
[@bush.fi/v3-pool-weighted]: Process started
[@bush.fi/v3-solidity-utils]: Process started
[@bush.fi/v3-standalone-utils]: Process started
[@bush.fi/v3-vault]: Process started
[@bush.fi/v3-benchmarks]: Process started
[@bush.fi/v3-pool-utils]: 
[@bush.fi/v3-pool-utils]: 
[@bush.fi/v3-pool-utils]:   0 passing (0ms)
[@bush.fi/v3-pool-utils]: 
[@bush.fi/v3-pool-utils]: No files changed, compilation skipped
[@bush.fi/v3-pool-utils]: 
[@bush.fi/v3-pool-utils]: Ran 5 tests for test/foundry/PoolInfo.t.sol:PoolInfoTest
[@bush.fi/v3-pool-utils]: [PASS] testGetAggregateFeePercentages() (gas: 45544)
[@bush.fi/v3-pool-utils]: [PASS] testGetCurrentLiveBalances() (gas: 120961)
[@bush.fi/v3-pool-utils]: [PASS] testGetStaticSwapFeePercentage() (gas: 27708)
[@bush.fi/v3-pool-utils]: [PASS] testGetTokenInfo() (gas: 159487)
[@bush.fi/v3-pool-utils]: [PASS] testGetTokens() (gas: 34370)
[@bush.fi/v3-pool-utils]: Suite result: ok. 5 passed; 0 failed; 0 skipped; finished in 33.47ms (10.99ms CPU time)
[@bush.fi/v3-pool-utils]: 
[@bush.fi/v3-pool-utils]: Ran 14 tests for test/foundry/BasePoolFactory.t.sol:BasePoolFactoryTest
[@bush.fi/v3-pool-utils]: [PASS] testConstructor() (gas: 3301810)
[@bush.fi/v3-pool-utils]: [PASS] testCreate() (gas: 2057571)
[@bush.fi/v3-pool-utils]: [PASS] testDisable() (gas: 77760)
[@bush.fi/v3-pool-utils]: [PASS] testDisableNoAuthentication() (gas: 25145)
[@bush.fi/v3-pool-utils]: [PASS] testEnsureEnabled() (gas: 78240)
[@bush.fi/v3-pool-utils]: [PASS] testGetDefaultLiquidityManagement() (gas: 11348)
[@bush.fi/v3-pool-utils]: [PASS] testGetDefaultPoolHooksContract() (gas: 8817)
[@bush.fi/v3-pool-utils]: [PASS] testGetDeploymentAddress() (gas: 2078985)
[@bush.fi/v3-pool-utils]: [PASS] testGetPoolsFullList() (gas: 60390828)
[@bush.fi/v3-pool-utils]: [PASS] testGetPoolsOutOfRange() (gas: 60351511)
[@bush.fi/v3-pool-utils]: [PASS] testRegisterMultiplePools() (gas: 60619005)
[@bush.fi/v3-pool-utils]: [PASS] testRegisterPoolWithFactory() (gas: 2053128)
[@bush.fi/v3-pool-utils]: [PASS] testRegisterPoolWithFactoryDisabled() (gas: 2042773)
[@bush.fi/v3-pool-utils]: [PASS] testRegisterPoolWithVault() (gas: 2212492)
[@bush.fi/v3-pool-utils]: Suite result: ok. 14 passed; 0 failed; 0 skipped; finished in 56.71ms (30.13ms CPU time)
[@bush.fi/v3-pool-utils]: 
[@bush.fi/v3-pool-utils]: Ran 2 test suites in 510.36ms (90.18ms CPU time): 19 tests passed, 0 failed, 0 skipped (19 total tests)
[@bush.fi/v3-pool-utils]: Process exited (exit code 0), completed in 9s 581ms
[@bush.fi/v3-pool-cow]: 
[@bush.fi/v3-pool-cow]: 
[@bush.fi/v3-pool-cow]:   CoWPool
[@bush.fi/v3-pool-cow]:     ✔ should have correct versions
[@bush.fi/v3-pool-cow]:     ✔ pool and protocol fee preconditions
[@bush.fi/v3-pool-cow]:     ✔ has the correct pool tokens and balances
[@bush.fi/v3-pool-cow]:     ✔ cannot be initialized twice
[@bush.fi/v3-pool-cow]:     ✔ is registered in the factory
[@bush.fi/v3-pool-cow]:     LM flags
[@bush.fi/v3-pool-cow]:       ✔ allows donation
[@bush.fi/v3-pool-cow]:       ✔ does not allow unbalanced liquidity
[@bush.fi/v3-pool-cow]: 
[@bush.fi/v3-pool-cow]: 
[@bush.fi/v3-pool-cow]:   7 passing (2s)
[@bush.fi/v3-pool-cow]: 
[@bush.fi/v3-pool-cow]: Nothing to compile
[@bush.fi/v3-pool-cow]: No need to generate any newer typings.
[@bush.fi/v3-pool-cow]: No files changed, compilation skipped
[@bush.fi/v3-pool-cow]: 
[@bush.fi/v3-pool-cow]: Ran 8 tests for test/foundry/CowPoolFactory.t.sol:CowPoolFactoryTest
[@bush.fi/v3-pool-cow]: [PASS] testCreateDonationAndUnbalancedLiquidity() (gas: 4072233)
[@bush.fi/v3-pool-cow]: [PASS] testCreateTrustedCowRouter() (gas: 4088347)
[@bush.fi/v3-pool-cow]: [PASS] testCreateWithPoolCreator() (gas: 38138)
[@bush.fi/v3-pool-cow]: [PASS] testGetPoolVersion() (gas: 12064)
[@bush.fi/v3-pool-cow]: [PASS] testGetTrustedRouter() (gas: 13054)
[@bush.fi/v3-pool-cow]: [PASS] testSetTrustedRouter() (gas: 45102)
[@bush.fi/v3-pool-cow]: [PASS] testSetTrustedRouterInvalidAddress() (gas: 30292)
[@bush.fi/v3-pool-cow]: [PASS] testSetTrustedRouterIsPermissioned() (gas: 29624)
[@bush.fi/v3-pool-cow]: Suite result: ok. 8 passed; 0 failed; 0 skipped; finished in 121.44ms (11.66ms CPU time)
[@bush.fi/v3-pool-cow]: 
[@bush.fi/v3-pool-cow]: Ran 33 tests for test/foundry/CowRouter.t.sol:CowRouterTest
[@bush.fi/v3-pool-cow]: [PASS] testDonateIsPermissioned() (gas: 31564)
[@bush.fi/v3-pool-cow]: [PASS] testDonateMissingToken(uint256,uint256,uint256) (runs: 10000, μ: 325184, ~: 325184)
[@bush.fi/v3-pool-cow]: [PASS] testDonateTransferAmountHintSurplus(uint256,uint256,uint256) (runs: 10000, μ: 575667, ~: 575667)
[@bush.fi/v3-pool-cow]: [PASS] testDonate__Fuzz(uint256,uint256,uint256) (runs: 10000, μ: 585277, ~: 586269)
[@bush.fi/v3-pool-cow]: [PASS] testGetFeeSweeper() (gas: 40983)
[@bush.fi/v3-pool-cow]: [PASS] testGetProtocolFeePercentage() (gas: 38929)
[@bush.fi/v3-pool-cow]: [PASS] testSetFeeSweeper() (gas: 38650)
[@bush.fi/v3-pool-cow]: [PASS] testSetFeeSweeperInvalidAddress() (gas: 30195)
[@bush.fi/v3-pool-cow]: [PASS] testSetFeeSweeperIsPermissioned() (gas: 27360)
[@bush.fi/v3-pool-cow]: [PASS] testSetProtocolFeePercentage() (gas: 38890)
[@bush.fi/v3-pool-cow]: [PASS] testSetProtocolFeePercentageCappedAtMax() (gas: 32267)
[@bush.fi/v3-pool-cow]: [PASS] testSetProtocolFeePercentageIsPermissioned() (gas: 27630)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactInAndDonateHintBiggerThanTransfer() (gas: 398566)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactInAndDonateSurplusBelowMinSwap() (gas: 130720)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactInAndDonateSurplusDeadline() (gas: 98700)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactInAndDonateSurplusEmptyDonation() (gas: 489816)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactInAndDonateSurplusEmptySwap() (gas: 103937)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactInAndDonateSurplusIsPermissioned() (gas: 36630)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactInAndDonateSurplusLimit() (gas: 149153)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactInAndDonateSurplusMissingToken() (gas: 290137)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactInAndDonateSurplusTransferAmountHintSurplus() (gas: 647974)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactInAndDonateSurplus__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 651770, ~: 653003)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactOutAndDonateHintBiggerThanTransfer() (gas: 399146)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactOutAndDonateSurplusBelowMinSwap() (gas: 130721)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactOutAndDonateSurplusDeadline() (gas: 98759)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactOutAndDonateSurplusEmptyDonation() (gas: 490253)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactOutAndDonateSurplusEmptySwap() (gas: 103979)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactOutAndDonateSurplusIsPermissioned() (gas: 36702)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactOutAndDonateSurplusLimit() (gas: 149695)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactOutAndDonateSurplusMissingToken() (gas: 301426)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactOutAndDonateSurplus__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 652263, ~: 653500)
[@bush.fi/v3-pool-cow]: [PASS] testSwapExactOutAndDonateTransferAmountHintSurplus() (gas: 645791)
[@bush.fi/v3-pool-cow]: [PASS] testWithdrawCollectedProtocolFees() (gas: 604105)
[@bush.fi/v3-pool-cow]: Suite result: ok. 33 passed; 0 failed; 0 skipped; finished in 18.80s (75.24s CPU time)
[@bush.fi/v3-pool-cow]: 
[@bush.fi/v3-pool-cow]: Ran 14 tests for test/foundry/CowPool.t.sol:CowPoolTest
[@bush.fi/v3-pool-cow]: [PASS] testGetCowPoolDynamicData() (gas: 163502)
[@bush.fi/v3-pool-cow]: [PASS] testGetCowPoolImmutableData() (gas: 70502)
[@bush.fi/v3-pool-cow]: [PASS] testGetHookFlags() (gas: 17369)
[@bush.fi/v3-pool-cow]: [PASS] testOnBeforeAddLiquidity() (gas: 16035)
[@bush.fi/v3-pool-cow]: [PASS] testOnBeforeAddLiquidityDonationWrongRouter() (gas: 13958)
[@bush.fi/v3-pool-cow]: [PASS] testOnBeforeAddLiquidityNotDonationWrongRouter() (gas: 11799)
[@bush.fi/v3-pool-cow]: [PASS] testOnBeforeSwap() (gas: 14633)
[@bush.fi/v3-pool-cow]: [PASS] testOnBeforeSwapWrongRouter() (gas: 12505)
[@bush.fi/v3-pool-cow]: [PASS] testOnRegister() (gas: 14061)
[@bush.fi/v3-pool-cow]: [PASS] testOnRegisterNoDonation() (gas: 14047)
[@bush.fi/v3-pool-cow]: [PASS] testOnRegisterUnbalancedLiquidity() (gas: 14122)
[@bush.fi/v3-pool-cow]: [PASS] testOnRegisterWrongFactory() (gas: 11905)
[@bush.fi/v3-pool-cow]: [PASS] testOnRegisterWrongPool() (gas: 11856)
[@bush.fi/v3-pool-cow]: [PASS] testRefreshTrustedCowRouter() (gas: 60523)
[@bush.fi/v3-pool-cow]: Suite result: ok. 14 passed; 0 failed; 0 skipped; finished in 18.80s (5.12ms CPU time)
[@bush.fi/v3-pool-cow]: 
[@bush.fi/v3-pool-cow]: Ran 3 test suites in 18.97s (37.72s CPU time): 55 tests passed, 0 failed, 0 skipped (55 total tests)
[@bush.fi/v3-pool-cow]: Solidity 0.8.26, 0.8.27 are not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.
[@bush.fi/v3-pool-cow]: 
[@bush.fi/v3-pool-cow]: Learn more at https://hardhat.org/hardhat-runner/docs/reference/solidity-support
[@bush.fi/v3-pool-cow]: 
[@bush.fi/v3-pool-cow]: Process exited (exit code 0), completed in 38s 931ms
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]:   MevCaptureHook
[@bush.fi/v3-pool-hooks]:     when there is no MEV tax
[@bush.fi/v3-pool-hooks]:       ✔ MEV hook disabled
[@bush.fi/v3-pool-hooks]:       ✔ low priority gas price
[@bush.fi/v3-pool-hooks]:       ✔ MEV multiplier is 0
[@bush.fi/v3-pool-hooks]:       ✔ Address is MEV tax-exempt
[@bush.fi/v3-pool-hooks]:     when there is MEV tax
[@bush.fi/v3-pool-hooks]:       ✔ MEV fee percentage bigger than default max value
[@bush.fi/v3-pool-hooks]:       ✔ Address is MEV tax-exempt but router is not trusted (41ms)
[@bush.fi/v3-pool-hooks]:       ✔ charge MEV tax proportional to priority gas price
[@bush.fi/v3-pool-hooks]:     add liquidity
[@bush.fi/v3-pool-hooks]:       when there is no MEV tax
[@bush.fi/v3-pool-hooks]:         ✔ allows proportional for any gas price
[@bush.fi/v3-pool-hooks]:         ✔ allows unbalanced for gas price below threshold
[@bush.fi/v3-pool-hooks]:       when MEV tax has to be applied
[@bush.fi/v3-pool-hooks]:         ✔ allows unbalanced for any gas price if the hook is disabled
[@bush.fi/v3-pool-hooks]:         ✔ blocks unbalanced for gas price above threshold
[@bush.fi/v3-pool-hooks]:     remove liquidity
[@bush.fi/v3-pool-hooks]:       when there is no MEV tax
[@bush.fi/v3-pool-hooks]:         ✔ allows proportional for any gas price
[@bush.fi/v3-pool-hooks]:         ✔ allows unbalanced for gas price below threshold
[@bush.fi/v3-pool-hooks]:       when MEV tax has to be applied
[@bush.fi/v3-pool-hooks]:         ✔ allows unbalanced for any gas price if the hook is disabled
[@bush.fi/v3-pool-hooks]:         ✔ blocks unbalanced for gas price above threshold
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]:   StableSurgeMedianMath
[@bush.fi/v3-pool-hooks]:     ✔ absSub (154ms)
[@bush.fi/v3-pool-hooks]:     ✔ findMedian (205ms)
[@bush.fi/v3-pool-hooks]:     ✔ calculateImbalance (295ms)
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]:   18 passing (3s)
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Nothing to compile
[@bush.fi/v3-pool-hooks]: No need to generate any newer typings.
[@bush.fi/v3-pool-hooks]: No files changed, compilation skipped
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Ran 8 tests for test/foundry/NftLiquidityPositionExample.t.sol:NftLiquidityPositionExampleTest
[@bush.fi/v3-pool-hooks]: [PASS] testAddFromExternalRouter() (gas: 86836)
[@bush.fi/v3-pool-hooks]: [PASS] testAddLiquidity() (gas: 583722)
[@bush.fi/v3-pool-hooks]: [PASS] testAfterRemoveOnlyVault() (gas: 16491)
[@bush.fi/v3-pool-hooks]: [PASS] testBeforeAddOnlyVault() (gas: 13671)
[@bush.fi/v3-pool-hooks]: [PASS] testRemoveFromExternalRouter() (gas: 116610)
[@bush.fi/v3-pool-hooks]: [PASS] testRemoveLiquidityFullDecay() (gas: 542674)
[@bush.fi/v3-pool-hooks]: [PASS] testRemoveLiquidityWithHalfDecayFee() (gas: 625327)
[@bush.fi/v3-pool-hooks]: [PASS] testRemoveWithNonOwner() (gas: 361655)
[@bush.fi/v3-pool-hooks]: Suite result: ok. 8 passed; 0 failed; 0 skipped; finished in 170.69ms (7.01ms CPU time)
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Ran 8 tests for test/foundry/VeBALFeeDiscountHookExample.t.sol:VeBALFeeDiscountHookExampleTest
[@bush.fi/v3-pool-hooks]: [PASS] testCreationWithWrongFactory() (gas: 2100099)
[@bush.fi/v3-pool-hooks]: [PASS] testQueryAndCompareWithSwapWithVeBal() (gas: 193674)
[@bush.fi/v3-pool-hooks]: [PASS] testQueryAndCompareWithSwapWithoutVeBal() (gas: 148194)
[@bush.fi/v3-pool-hooks]: [PASS] testRegistryWithWrongFactory() (gas: 5689555)
[@bush.fi/v3-pool-hooks]: [PASS] testSuccessfulRegistry() (gas: 2181586)
[@bush.fi/v3-pool-hooks]: [PASS] testSwapWithVeBal() (gas: 471186)
[@bush.fi/v3-pool-hooks]: [PASS] testSwapWithVeBalAndUntrustedRouter() (gas: 6093049)
[@bush.fi/v3-pool-hooks]: [PASS] testSwapWithoutVeBal() (gas: 425755)
[@bush.fi/v3-pool-hooks]: Suite result: ok. 8 passed; 0 failed; 0 skipped; finished in 213.68ms (24.10ms CPU time)
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Ran 4 tests for test/foundry/DirectionalFeeHookExample.t.sol:DirectionalHookExampleTest
[@bush.fi/v3-pool-hooks]: [PASS] testRegistryWithWrongFactory() (gas: 2119151)
[@bush.fi/v3-pool-hooks]: [PASS] testSuccessfulRegistry() (gas: 27778)
[@bush.fi/v3-pool-hooks]: [PASS] testSwapBalancingPoolFee() (gas: 535594)
[@bush.fi/v3-pool-hooks]: [PASS] testSwapUnbalancingPoolFee() (gas: 450781)
[@bush.fi/v3-pool-hooks]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 219.32ms (5.44ms CPU time)
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Ran 4 tests for test/foundry/ExitFeeHookExample.t.sol:ExitFeeHookExampleTest
[@bush.fi/v3-pool-hooks]: [PASS] testExitFeeReturnToLPs() (gas: 480459)
[@bush.fi/v3-pool-hooks]: [PASS] testPercentageTooHigh() (gas: 13485)
[@bush.fi/v3-pool-hooks]: [PASS] testRegistryWithWrongDonationFlag() (gas: 2116172)
[@bush.fi/v3-pool-hooks]: [PASS] testSuccessfulRegistry() (gas: 2200258)
[@bush.fi/v3-pool-hooks]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 219.00ms (6.65ms CPU time)
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Ran 3 tests for test/foundry/LotteryHookExample.t.sol:LotteryHookExampleTest
[@bush.fi/v3-pool-hooks]: [PASS] testLotterySwapBothInAndOut() (gas: 2946290)
[@bush.fi/v3-pool-hooks]: [PASS] testLotterySwapExactIn() (gas: 2918956)
[@bush.fi/v3-pool-hooks]: [PASS] testLotterySwapExactOut() (gas: 2929742)
[@bush.fi/v3-pool-hooks]: Suite result: ok. 3 passed; 0 failed; 0 skipped; finished in 222.58ms (31.68ms CPU time)
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Ran 7 tests for test/foundry/StableSurgePoolFactory.t.sol:StableSurgePoolFactoryTest
[@bush.fi/v3-pool-hooks]: [PASS] testCreatePoolWithDonation() (gas: 3890392)
[@bush.fi/v3-pool-hooks]: [PASS] testCreatePoolWithTooManyTokens() (gas: 3184629)
[@bush.fi/v3-pool-hooks]: [PASS] testCreatePoolWithoutDonation() (gas: 3763772)
[@bush.fi/v3-pool-hooks]: [PASS] testFactoryHasHook() (gas: 3742497)
[@bush.fi/v3-pool-hooks]: [PASS] testFactoryPausedState() (gas: 8562)
[@bush.fi/v3-pool-hooks]: [PASS] testFactoryRegistration() (gas: 3736176)
[@bush.fi/v3-pool-hooks]: [PASS] testVersions() (gas: 3742159)
[@bush.fi/v3-pool-hooks]: Suite result: ok. 7 passed; 0 failed; 0 skipped; finished in 260.00ms (5.02ms CPU time)
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Ran 4 tests for test/foundry/ExitFeeHookExampleStablePool.t.sol:ExitFeeHookExampleStablePoolTest
[@bush.fi/v3-pool-hooks]: [PASS] testExitFeeReturnToLPs() (gas: 494060)
[@bush.fi/v3-pool-hooks]: [PASS] testPercentageTooHigh() (gas: 13485)
[@bush.fi/v3-pool-hooks]: [PASS] testRegistryWithWrongDonationFlag() (gas: 2116237)
[@bush.fi/v3-pool-hooks]: [PASS] testSuccessfulRegistry() (gas: 2200300)
[@bush.fi/v3-pool-hooks]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 58.68ms (8.02ms CPU time)
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Ran 4 tests for test/foundry/StableSurgeMedianMath.t.sol:StableSurgeMedianMathTest
[@bush.fi/v3-pool-hooks]: [PASS] testAbsSubWithMinAndMaxValues() (gas: 18414)
[@bush.fi/v3-pool-hooks]: [PASS] testAbsSub__Fuzz(uint256,uint256) (runs: 10000, μ: 14784, ~: 14780)
[@bush.fi/v3-pool-hooks]: [PASS] testCalculateImbalance__Fuzz(uint256,uint256[8]) (runs: 10000, μ: 36486, ~: 35909)
[@bush.fi/v3-pool-hooks]: [PASS] testFindMedian__Fuzz(uint256,uint256[8]) (runs: 10000, μ: 27052, ~: 26436)
[@bush.fi/v3-pool-hooks]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 3.59s (5.29s CPU time)
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Ran 14 tests for test/foundry/StableSurgeHookUnit.t.sol:StableSurgeHookUnitTest
[@bush.fi/v3-pool-hooks]: [PASS] testChangeSurgeThresholdPercentage() (gas: 42657)
[@bush.fi/v3-pool-hooks]: [PASS] testChangeSurgeThresholdPercentageRevertIfFeeManagerIsZero() (gas: 31667)
[@bush.fi/v3-pool-hooks]: [PASS] testChangeSurgeThresholdPercentageRevertIfSenderIsNotFeeManager() (gas: 14991)
[@bush.fi/v3-pool-hooks]: [PASS] testChangeSurgeThresholdPercentageRevertIfValueIsGreaterThanOne() (gas: 14108)
[@bush.fi/v3-pool-hooks]: [PASS] testGetDefaultSurgeThresholdPercentage() (gas: 8866)
[@bush.fi/v3-pool-hooks]: [PASS] testGetHookFlags() (gas: 12550)
[@bush.fi/v3-pool-hooks]: [PASS] testGetSurgeFeePercentageWhenNewTotalImbalanceIsZero() (gas: 66389)
[@bush.fi/v3-pool-hooks]: [PASS] testGetSurgeFeePercentageWhenNewTotalImbalanceLesOrEqOld() (gas: 74765)
[@bush.fi/v3-pool-hooks]: [PASS] testGetSurgeFeePercentageWhenNewTotalImbalanceLessOrEqThreshold() (gas: 72918)
[@bush.fi/v3-pool-hooks]: [PASS] testGetSurgeFeePercentage_MaxSurgeSmallerThanStatic() (gas: 90507)
[@bush.fi/v3-pool-hooks]: [PASS] testGetSurgeFeePercentage__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256[8]) (runs: 10000, μ: 103078, ~: 102104)
[@bush.fi/v3-pool-hooks]: [PASS] testOnComputeDynamicSwapFeePercentage__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256[8]) (runs: 10000, μ: 104682, ~: 103640)
[@bush.fi/v3-pool-hooks]: [PASS] testOnRegister() (gas: 49356)
[@bush.fi/v3-pool-hooks]: [PASS] testVersion() (gas: 14798)
[@bush.fi/v3-pool-hooks]: Suite result: ok. 14 passed; 0 failed; 0 skipped; finished in 5.05s (9.42s CPU time)
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Ran 46 tests for test/foundry/MevCaptureHook.t.sol:MevCaptureHookTest
[@bush.fi/v3-pool-hooks]: [PASS] testAddMevTaxExemptSenders() (gas: 119069)
[@bush.fi/v3-pool-hooks]: [PASS] testAddMevTaxExemptSendersIsPermissioned() (gas: 29001)
[@bush.fi/v3-pool-hooks]: [PASS] testAddMevTaxExemptSendersRevertsWithDuplicated() (gas: 117900)
[@bush.fi/v3-pool-hooks]: [PASS] testCallbackBoundaries__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 135371, ~: 135540)
[@bush.fi/v3-pool-hooks]: [PASS] testDefaultMevTaxMultiplier() (gas: 12855)
[@bush.fi/v3-pool-hooks]: [PASS] testDefaultMevTaxThreshold() (gas: 12897)
[@bush.fi/v3-pool-hooks]: [PASS] testDisableMevTax() (gas: 47824)
[@bush.fi/v3-pool-hooks]: [PASS] testDisableMevTaxIsPermissioned() (gas: 27609)
[@bush.fi/v3-pool-hooks]: [PASS] testEnableMevTax() (gas: 51283)
[@bush.fi/v3-pool-hooks]: [PASS] testEnableMevTaxIsPermissioned() (gas: 27521)
[@bush.fi/v3-pool-hooks]: [PASS] testFeePercentageAboveMaxFee__Fuzz(uint256) (runs: 10000, μ: 44277, ~: 44487)
[@bush.fi/v3-pool-hooks]: [PASS] testFeePercentageAboveThresholdLowMaxFee__Fuzz(uint256) (runs: 10000, μ: 42367, ~: 42349)
[@bush.fi/v3-pool-hooks]: [PASS] testFeePercentageBetweenThresholdAndMaxFee__Fuzz(uint256) (runs: 10000, μ: 44325, ~: 44652)
[@bush.fi/v3-pool-hooks]: [PASS] testFeePercentageMathOverflow__Fuzz(uint256) (runs: 10000, μ: 44249, ~: 44428)
[@bush.fi/v3-pool-hooks]: [PASS] testFeePercentageUnderThreshold__Fuzz(uint256) (runs: 10000, μ: 16019, ~: 16337)
[@bush.fi/v3-pool-hooks]: [PASS] testGetBalancerContractRegistry() (gas: 10924)
[@bush.fi/v3-pool-hooks]: [PASS] testGetPoolMevTaxMultiplierPoolNotRegistered() (gas: 2999532)
[@bush.fi/v3-pool-hooks]: [PASS] testGetPoolMevTaxThresholdPoolNotRegistered() (gas: 2999601)
[@bush.fi/v3-pool-hooks]: [PASS] testInvalidRegistry() (gas: 46558)
[@bush.fi/v3-pool-hooks]: [PASS] testIsMevTaxEnabledStartingState() (gas: 10833)
[@bush.fi/v3-pool-hooks]: [PASS] testIsMevTaxExemptSender() (gas: 92269)
[@bush.fi/v3-pool-hooks]: [PASS] testMultipleDisableMevTax() (gas: 56163)
[@bush.fi/v3-pool-hooks]: [PASS] testMultipleEnableMevTax() (gas: 45925)
[@bush.fi/v3-pool-hooks]: [PASS] testRemoveMevTaxExemptSenders() (gas: 102624)
[@bush.fi/v3-pool-hooks]: [PASS] testRemoveMevTaxExemptSendersIsPermissioned() (gas: 33306)
[@bush.fi/v3-pool-hooks]: [PASS] testRemoveMevTaxExemptSendersRevertsIfNotExist() (gas: 99865)
[@bush.fi/v3-pool-hooks]: [PASS] testRevertingRegistry() (gas: 46090)
[@bush.fi/v3-pool-hooks]: [PASS] testSetDefaultMevTaxMultiplier() (gas: 40185)
[@bush.fi/v3-pool-hooks]: [PASS] testSetDefaultMevTaxMultiplierIsPermissioned() (gas: 27587)
[@bush.fi/v3-pool-hooks]: [PASS] testSetDefaultMevTaxMultiplierRegisteredPool() (gas: 91071)
[@bush.fi/v3-pool-hooks]: [PASS] testSetDefaultMevTaxThreshold() (gas: 40323)
[@bush.fi/v3-pool-hooks]: [PASS] testSetDefaultMevTaxThresholdIsPermissioned() (gas: 27651)
[@bush.fi/v3-pool-hooks]: [PASS] testSetDefaultMevTaxThresholdRegisteredPool() (gas: 91225)
[@bush.fi/v3-pool-hooks]: [PASS] testSetMaxMevSwapFeePercentage() (gas: 40408)
[@bush.fi/v3-pool-hooks]: [PASS] testSetMaxMevSwapFeePercentageAboveMax() (gas: 30737)
[@bush.fi/v3-pool-hooks]: [PASS] testSetMaxMevSwapFeePercentageIsPermissioned() (gas: 27670)
[@bush.fi/v3-pool-hooks]: [PASS] testSetPoolMevTaxMultiplier() (gas: 89872)
[@bush.fi/v3-pool-hooks]: [PASS] testSetPoolMevTaxMultiplierIsPermissioned() (gas: 54119)
[@bush.fi/v3-pool-hooks]: [PASS] testSetPoolMevTaxMultiplierPoolNotRegistered() (gas: 3030593)
[@bush.fi/v3-pool-hooks]: [PASS] testSetPoolMevTaxMultiplierRevertIfSenderIsNotFeeManager() (gas: 30077)
[@bush.fi/v3-pool-hooks]: [PASS] testSetPoolMevTaxMultiplierWithSwapFeeManager() (gas: 36132)
[@bush.fi/v3-pool-hooks]: [PASS] testSetPoolMevTaxThreshold() (gas: 90039)
[@bush.fi/v3-pool-hooks]: [PASS] testSetPoolMevTaxThresholdIsPermissioned() (gas: 54164)
[@bush.fi/v3-pool-hooks]: [PASS] testSetPoolMevTaxThresholdPoolNotRegistered() (gas: 3030672)
[@bush.fi/v3-pool-hooks]: [PASS] testSetPoolMevTaxThresholdRevertIfSenderIsNotFeeManager() (gas: 30100)
[@bush.fi/v3-pool-hooks]: [PASS] testSetPoolMevTaxThresholdWithSwapFeeManager() (gas: 36241)
[@bush.fi/v3-pool-hooks]: Suite result: ok. 46 passed; 0 failed; 0 skipped; finished in 5.21s (11.60s CPU time)
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Ran 7 tests for test/foundry/StableSurgeHook.t.sol:StableSurgeHookTest
[@bush.fi/v3-pool-hooks]: [PASS] testRemoveLiquidityWhenSurging() (gas: 357882)
[@bush.fi/v3-pool-hooks]: [PASS] testSuccessfulRegistry() (gas: 13389)
[@bush.fi/v3-pool-hooks]: [PASS] testSwap__Fuzz(uint256,uint256,uint256) (runs: 10000, μ: 480364, ~: 480356)
[@bush.fi/v3-pool-hooks]: [PASS] testUnbalancedAddLiquidityWhenNotSurging() (gas: 271738)
[@bush.fi/v3-pool-hooks]: [PASS] testUnbalancedAddLiquidityWhenSurging() (gas: 399246)
[@bush.fi/v3-pool-hooks]: [PASS] testUnbalancedRemoveLiquidityWhenNotSurging() (gas: 228923)
[@bush.fi/v3-pool-hooks]: [PASS] testValidVault() (gas: 46487)
[@bush.fi/v3-pool-hooks]: Suite result: ok. 7 passed; 0 failed; 0 skipped; finished in 16.14s (15.96s CPU time)
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Ran 4 tests for test/foundry/ExitFeeHookExampleWeightedPool.t.sol:ExitFeeHookExampleWeightedPoolTest
[@bush.fi/v3-pool-hooks]: [PASS] testExitFeeReturnToLPs() (gas: 498248)
[@bush.fi/v3-pool-hooks]: [PASS] testPercentageTooHigh() (gas: 13485)
[@bush.fi/v3-pool-hooks]: [PASS] testRegistryWithWrongDonationFlag() (gas: 2116214)
[@bush.fi/v3-pool-hooks]: [PASS] testSuccessfulRegistry() (gas: 2200300)
[@bush.fi/v3-pool-hooks]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 19.62s (19.94ms CPU time)
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Ran 4 tests for test/foundry/FeeTakingHookExample.t.sol:FeeTakingHookExampleTest
[@bush.fi/v3-pool-hooks]: [PASS] testFeeSwapExactIn__Fuzz(uint256,uint64) (runs: 10000, μ: 438560, ~: 439492)
[@bush.fi/v3-pool-hooks]: [PASS] testFeeSwapExactOut__Fuzz(uint256,uint64) (runs: 10000, μ: 438895, ~: 439855)
[@bush.fi/v3-pool-hooks]: [PASS] testHookFeeAddLiquidityExactIn__Fuzz(uint256,uint64) (runs: 10000, μ: 551350, ~: 554016)
[@bush.fi/v3-pool-hooks]: [PASS] testHookFeeRemoveLiquidityExactIn__Fuzz(uint256,uint64) (runs: 10000, μ: 649516, ~: 651928)
[@bush.fi/v3-pool-hooks]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 19.62s (63.04s CPU time)
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Ran 13 test suites in 19.66s (70.59s CPU time): 117 tests passed, 0 failed, 0 skipped (117 total tests)
[@bush.fi/v3-pool-hooks]: Solidity 0.8.26, 0.8.27 are not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Learn more at https://hardhat.org/hardhat-runner/docs/reference/solidity-support
[@bush.fi/v3-pool-hooks]: 
[@bush.fi/v3-pool-hooks]: Process exited (exit code 0), completed in 43s 274ms
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]:   BasePoolCodeFactory
[@bush.fi/v3-solidity-utils]:     ✔ returns the contract creation code storage addresses (124ms)
[@bush.fi/v3-solidity-utils]:     ✔ returns the contract creation code (205ms)
[@bush.fi/v3-solidity-utils]:     ✔ creates a contract
[@bush.fi/v3-solidity-utils]:     half contracts
[@bush.fi/v3-solidity-utils]:       ✔ cannot execute the contract halves
[@bush.fi/v3-solidity-utils]:       ✔ returns the contract creation code storage addresses (89ms)
[@bush.fi/v3-solidity-utils]:     when the creation reverts
[@bush.fi/v3-solidity-utils]:       ✔ reverts and bubbles up revert reasons
[@bush.fi/v3-solidity-utils]:     with a created pool
[@bush.fi/v3-solidity-utils]:       ✔ deploys correct bytecode (74ms)
[@bush.fi/v3-solidity-utils]:       ✔ cannot deploy twice with the same salt
[@bush.fi/v3-solidity-utils]:       ✔ can deploy with a different salt
[@bush.fi/v3-solidity-utils]:       ✔ passes constructor arguments correctly
[@bush.fi/v3-solidity-utils]:       ✔ generates the same address with the same salt and a different nonce (47ms)
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]:   CodeDeployer
[@bush.fi/v3-solidity-utils]:     with no code
[@bush.fi/v3-solidity-utils]:       ✔ stores its constructor argument as its code
[@bush.fi/v3-solidity-utils]:     with some code
[@bush.fi/v3-solidity-utils]:       ✔ stores its constructor argument as its code
[@bush.fi/v3-solidity-utils]:     with code 24kB long
[@bush.fi/v3-solidity-utils]:       ✔ stores its constructor argument as its code
[@bush.fi/v3-solidity-utils]:     with code over 24kB long
[@bush.fi/v3-solidity-utils]:       ✔ reverts
[@bush.fi/v3-solidity-utils]:     CodeDeployer protection
[@bush.fi/v3-solidity-utils]:       protected selfdestruct
[@bush.fi/v3-solidity-utils]:         ✔ stores its constructor argument as its code
[@bush.fi/v3-solidity-utils]:         ✔ does not self destruct
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]:   EnumerableMap
[@bush.fi/v3-solidity-utils]:     EnumerableMap types
[@bush.fi/v3-solidity-utils]:       EnumerableIERC20ToUint256Map
[@bush.fi/v3-solidity-utils]:         ✔ starts empty (141ms)
[@bush.fi/v3-solidity-utils]:         set
[@bush.fi/v3-solidity-utils]:           ✔ returns true when adding a key
[@bush.fi/v3-solidity-utils]:           ✔ adds a key
[@bush.fi/v3-solidity-utils]:           ✔ adds several keys
[@bush.fi/v3-solidity-utils]:           ✔ returns false when adding keys already in the set
[@bush.fi/v3-solidity-utils]:           ✔ updates values for keys already in the set
[@bush.fi/v3-solidity-utils]:         get
[@bush.fi/v3-solidity-utils]:           ✔ returns the value for a key
[@bush.fi/v3-solidity-utils]:           ✔ reverts with a custom message if the key is not in the map
[@bush.fi/v3-solidity-utils]:         at
[@bush.fi/v3-solidity-utils]:           ✔ returns the value for a key
[@bush.fi/v3-solidity-utils]:           ✔ reverts with a custom message if the index is invalid
[@bush.fi/v3-solidity-utils]:         indexOf
[@bush.fi/v3-solidity-utils]:           ✔ returns the index of an added key
[@bush.fi/v3-solidity-utils]:           ✔ adding and removing keys can change the index
[@bush.fi/v3-solidity-utils]:           ✔ reverts if the key is not in the map
[@bush.fi/v3-solidity-utils]:         unchecked_indexOf
[@bush.fi/v3-solidity-utils]:           ✔ returns the index of an added key, plus one
[@bush.fi/v3-solidity-utils]:           ✔ adding and removing keys can change the index
[@bush.fi/v3-solidity-utils]:           ✔ returns a zero index if the key is not in the map
[@bush.fi/v3-solidity-utils]:         unchecked_setAt
[@bush.fi/v3-solidity-utils]:           ✔ updates a value
[@bush.fi/v3-solidity-utils]:           ✔ updates several values
[@bush.fi/v3-solidity-utils]:           ✔ does not revert when setting indexes outside of the map
[@bush.fi/v3-solidity-utils]:         unchecked_at
[@bush.fi/v3-solidity-utils]:           ✔ returns an entry at an index
[@bush.fi/v3-solidity-utils]:           ✔ does not revert when accessing indexes outside of the map
[@bush.fi/v3-solidity-utils]:         unchecked_valueAt
[@bush.fi/v3-solidity-utils]:           ✔ returns a value at an index
[@bush.fi/v3-solidity-utils]:           ✔ does not revert when accessing indexes outside of the map
[@bush.fi/v3-solidity-utils]:         remove
[@bush.fi/v3-solidity-utils]:           ✔ returns true when removing keys in the set
[@bush.fi/v3-solidity-utils]:           ✔ removes added keys
[@bush.fi/v3-solidity-utils]:           ✔ returns false when removing keys not in the set
[@bush.fi/v3-solidity-utils]:           ✔ returns false when removing keys not in the set
[@bush.fi/v3-solidity-utils]:           ✔ adds and removes multiple keys (106ms)
[@bush.fi/v3-solidity-utils]:       EnumerableIERC20ToBytes32Map
[@bush.fi/v3-solidity-utils]:         ✔ starts empty
[@bush.fi/v3-solidity-utils]:         set
[@bush.fi/v3-solidity-utils]:           ✔ returns true when adding a key
[@bush.fi/v3-solidity-utils]:           ✔ adds a key
[@bush.fi/v3-solidity-utils]:           ✔ adds several keys
[@bush.fi/v3-solidity-utils]:           ✔ returns false when adding keys already in the set
[@bush.fi/v3-solidity-utils]:           ✔ updates values for keys already in the set
[@bush.fi/v3-solidity-utils]:         get
[@bush.fi/v3-solidity-utils]:           ✔ returns the value for a key
[@bush.fi/v3-solidity-utils]:           ✔ reverts with a custom message if the key is not in the map
[@bush.fi/v3-solidity-utils]:         at
[@bush.fi/v3-solidity-utils]:           ✔ returns the value for a key
[@bush.fi/v3-solidity-utils]:           ✔ reverts with a custom message if the index is invalid
[@bush.fi/v3-solidity-utils]:         indexOf
[@bush.fi/v3-solidity-utils]:           ✔ returns the index of an added key
[@bush.fi/v3-solidity-utils]:           ✔ adding and removing keys can change the index
[@bush.fi/v3-solidity-utils]:           ✔ reverts if the key is not in the map
[@bush.fi/v3-solidity-utils]:         unchecked_indexOf
[@bush.fi/v3-solidity-utils]:           ✔ returns the index of an added key, plus one
[@bush.fi/v3-solidity-utils]:           ✔ adding and removing keys can change the index
[@bush.fi/v3-solidity-utils]:           ✔ returns a zero index if the key is not in the map
[@bush.fi/v3-solidity-utils]:         unchecked_setAt
[@bush.fi/v3-solidity-utils]:           ✔ updates a value
[@bush.fi/v3-solidity-utils]:           ✔ updates several values (53ms)
[@bush.fi/v3-solidity-utils]:           ✔ does not revert when setting indexes outside of the map
[@bush.fi/v3-solidity-utils]:         unchecked_at
[@bush.fi/v3-solidity-utils]:           ✔ returns an entry at an index
[@bush.fi/v3-solidity-utils]:           ✔ does not revert when accessing indexes outside of the map
[@bush.fi/v3-solidity-utils]:         unchecked_valueAt
[@bush.fi/v3-solidity-utils]:           ✔ returns a value at an index
[@bush.fi/v3-solidity-utils]:           ✔ does not revert when accessing indexes outside of the map
[@bush.fi/v3-solidity-utils]:         remove
[@bush.fi/v3-solidity-utils]:           ✔ returns true when removing keys in the set
[@bush.fi/v3-solidity-utils]:           ✔ removes added keys
[@bush.fi/v3-solidity-utils]:           ✔ returns false when removing keys not in the set
[@bush.fi/v3-solidity-utils]:           ✔ returns false when removing keys not in the set
[@bush.fi/v3-solidity-utils]:           ✔ adds and removes multiple keys (43ms)
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]:   EnumerableSet
[@bush.fi/v3-solidity-utils]:     EnumerableAddressSet
[@bush.fi/v3-solidity-utils]:       ✔ starts empty
[@bush.fi/v3-solidity-utils]:       add
[@bush.fi/v3-solidity-utils]:         ✔ returns true when adding a new member
[@bush.fi/v3-solidity-utils]:         ✔ adds an address
[@bush.fi/v3-solidity-utils]:         ✔ adds several addresses
[@bush.fi/v3-solidity-utils]:         ✔ returns false when adding members already in the set
[@bush.fi/v3-solidity-utils]:       at
[@bush.fi/v3-solidity-utils]:         ✔ returns the value for an address
[@bush.fi/v3-solidity-utils]:         ✔ reverts with a custom message if the index is invalid
[@bush.fi/v3-solidity-utils]:       indexOf
[@bush.fi/v3-solidity-utils]:         ✔ returns the index of an added key
[@bush.fi/v3-solidity-utils]:         ✔ adding and removing keys can change the index
[@bush.fi/v3-solidity-utils]:         ✔ reverts if the key is not in the set
[@bush.fi/v3-solidity-utils]:       unchecked_indexOf
[@bush.fi/v3-solidity-utils]:         ✔ returns the index of an added key
[@bush.fi/v3-solidity-utils]:         ✔ adding and removing keys can change the index
[@bush.fi/v3-solidity-utils]:         ✔ returns 0 if the key is not in the set
[@bush.fi/v3-solidity-utils]:       remove
[@bush.fi/v3-solidity-utils]:         ✔ returns true when removing members
[@bush.fi/v3-solidity-utils]:         ✔ removes added members
[@bush.fi/v3-solidity-utils]:         ✔ returns false when removing members that used to be in the set
[@bush.fi/v3-solidity-utils]:         ✔ returns false when removing members that were never in the set
[@bush.fi/v3-solidity-utils]:         ✔ adds and removes multiple members (96ms)
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]:   FixedPoint
[@bush.fi/v3-solidity-utils]:     powUp/powDown
[@bush.fi/v3-solidity-utils]:       non-fractional pow 1
[@bush.fi/v3-solidity-utils]:         ✔ handles 1.7e-18
[@bush.fi/v3-solidity-utils]:         ✔ handles 1.7e-15
[@bush.fi/v3-solidity-utils]:         ✔ handles 1.7e-11
[@bush.fi/v3-solidity-utils]:         ✔ handles 8e-9
[@bush.fi/v3-solidity-utils]:         ✔ handles 0.0000013
[@bush.fi/v3-solidity-utils]:         ✔ handles 0.000043
[@bush.fi/v3-solidity-utils]:         ✔ handles 0.0007
[@bush.fi/v3-solidity-utils]:         ✔ handles 0.0022
[@bush.fi/v3-solidity-utils]:         ✔ handles 0.093
[@bush.fi/v3-solidity-utils]:         ✔ handles 2.9
[@bush.fi/v3-solidity-utils]:         ✔ handles 13.3
[@bush.fi/v3-solidity-utils]:         ✔ handles 450.8
[@bush.fi/v3-solidity-utils]:         ✔ handles 1550.3339
[@bush.fi/v3-solidity-utils]:         ✔ handles 69039.11
[@bush.fi/v3-solidity-utils]:         ✔ handles 7834839.432
[@bush.fi/v3-solidity-utils]:         ✔ handles 83202933.5433
[@bush.fi/v3-solidity-utils]:         ✔ handles 9983838318.4
[@bush.fi/v3-solidity-utils]:         ✔ handles 15831567871.1
[@bush.fi/v3-solidity-utils]:         ✔ handles 8382392893832.1
[@bush.fi/v3-solidity-utils]:         ✔ handles 38859321075205.1
[@bush.fi/v3-solidity-utils]:         ✔ handles 848205610278492.2383
[@bush.fi/v3-solidity-utils]:         ✔ handles 371328129389320282.3783289
[@bush.fi/v3-solidity-utils]:         ✔ handles 7.01847104729761867823532139e+23
[@bush.fi/v3-solidity-utils]:         ✔ handles 1.75915239864219235419349070947e+26
[@bush.fi/v3-solidity-utils]:       non-fractional pow 2
[@bush.fi/v3-solidity-utils]:         ✔ handles 8e-9
[@bush.fi/v3-solidity-utils]:         ✔ handles 0.0000013
[@bush.fi/v3-solidity-utils]:         ✔ handles 0.000043
[@bush.fi/v3-solidity-utils]:         ✔ handles 0.0007
[@bush.fi/v3-solidity-utils]:         ✔ handles 0.0022
[@bush.fi/v3-solidity-utils]:         ✔ handles 0.093
[@bush.fi/v3-solidity-utils]:         ✔ handles 2.9
[@bush.fi/v3-solidity-utils]:         ✔ handles 13.3
[@bush.fi/v3-solidity-utils]:         ✔ handles 450.8
[@bush.fi/v3-solidity-utils]:         ✔ handles 1550.3339
[@bush.fi/v3-solidity-utils]:         ✔ handles 69039.11
[@bush.fi/v3-solidity-utils]:         ✔ handles 7834839.432
[@bush.fi/v3-solidity-utils]:         ✔ handles 83202933.5433
[@bush.fi/v3-solidity-utils]:         ✔ handles 9983838318.4
[@bush.fi/v3-solidity-utils]:         ✔ handles 15831567871.1
[@bush.fi/v3-solidity-utils]:         ✔ handles 8382392893832.1
[@bush.fi/v3-solidity-utils]:         ✔ handles 38859321075205.1
[@bush.fi/v3-solidity-utils]:         ✔ handles 848205610278492.2383
[@bush.fi/v3-solidity-utils]:         ✔ handles 371328129389320282.3783289
[@bush.fi/v3-solidity-utils]:       non-fractional pow 4
[@bush.fi/v3-solidity-utils]:         ✔ handles 0.0007
[@bush.fi/v3-solidity-utils]:         ✔ handles 0.0022
[@bush.fi/v3-solidity-utils]:         ✔ handles 0.093
[@bush.fi/v3-solidity-utils]:         ✔ handles 2.9
[@bush.fi/v3-solidity-utils]:         ✔ handles 13.3
[@bush.fi/v3-solidity-utils]:         ✔ handles 450.8
[@bush.fi/v3-solidity-utils]:         ✔ handles 1550.3339
[@bush.fi/v3-solidity-utils]:         ✔ handles 69039.11
[@bush.fi/v3-solidity-utils]:         ✔ handles 7834839.432
[@bush.fi/v3-solidity-utils]:         ✔ handles 83202933.5433
[@bush.fi/v3-solidity-utils]:         ✔ handles 9983838318.4
[@bush.fi/v3-solidity-utils]:         ✔ handles 15831567871.1
[@bush.fi/v3-solidity-utils]:     mulDown
[@bush.fi/v3-solidity-utils]:       ✔ multiplies 0 and 0 correctly
[@bush.fi/v3-solidity-utils]:       ✔ multiplies 1 and 1 correctly
[@bush.fi/v3-solidity-utils]:       ✔ returns product when both factors are not 0
[@bush.fi/v3-solidity-utils]:       ✔ reverts on overflow
[@bush.fi/v3-solidity-utils]:     mulUp
[@bush.fi/v3-solidity-utils]:       ✔ multiplies 0 and 0 correctly
[@bush.fi/v3-solidity-utils]:       ✔ multiplies 1 and 1 correctly
[@bush.fi/v3-solidity-utils]:       ✔ reverts on overflow
[@bush.fi/v3-solidity-utils]:       ✔ returns product when both factors are not 0
[@bush.fi/v3-solidity-utils]:     divDown
[@bush.fi/v3-solidity-utils]:       ✔ divides 0 by 1 correctly
[@bush.fi/v3-solidity-utils]:       ✔ divides 1 by 1 correctly
[@bush.fi/v3-solidity-utils]:       ✔ divides large number by itself correctly
[@bush.fi/v3-solidity-utils]:       ✔ reverts on underflow
[@bush.fi/v3-solidity-utils]:       ✔ should revert on division by zero
[@bush.fi/v3-solidity-utils]:     divUp
[@bush.fi/v3-solidity-utils]:       ✔ divides 0 by 1 correctly
[@bush.fi/v3-solidity-utils]:       ✔ divides 1 by 1 correctly
[@bush.fi/v3-solidity-utils]:       ✔ divides large number by itself correctly
[@bush.fi/v3-solidity-utils]:       ✔ returns quotient when divisor is not 0
[@bush.fi/v3-solidity-utils]:       ✔ should revert on division by zero
[@bush.fi/v3-solidity-utils]:     complement
[@bush.fi/v3-solidity-utils]:       ✔ returns the correct complement for 0
[@bush.fi/v3-solidity-utils]:       ✔ returns the correct complement for 0.3
[@bush.fi/v3-solidity-utils]:       ✔ returns the correct complement for 1
[@bush.fi/v3-solidity-utils]:       ✔ returns the correct complement for a number greater than 1
[@bush.fi/v3-solidity-utils]:     powDown
[@bush.fi/v3-solidity-utils]:       ✔ returns the correct power for base 0
[@bush.fi/v3-solidity-utils]:       ✔ returns the correct power for base 1
[@bush.fi/v3-solidity-utils]:       ✔ returns the correct power for base 2 power 2
[@bush.fi/v3-solidity-utils]:       ✔ returns the correct power for base 2 power 4
[@bush.fi/v3-solidity-utils]:       ✔ returns the correct power for large base and exponent
[@bush.fi/v3-solidity-utils]:       ✔ returns 0 when result is less than maxError
[@bush.fi/v3-solidity-utils]:     powUp
[@bush.fi/v3-solidity-utils]:       ✔ returns the correct power for base 0
[@bush.fi/v3-solidity-utils]:       ✔ returns the correct power for base 1
[@bush.fi/v3-solidity-utils]:       ✔ returns the correct power for base 2 power 2
[@bush.fi/v3-solidity-utils]:       ✔ returns the correct power for large base and exponent
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]:   ExpLog
[@bush.fi/v3-solidity-utils]:     pow
[@bush.fi/v3-solidity-utils]:       exponent zero
[@bush.fi/v3-solidity-utils]:         ✔ handles base zero
[@bush.fi/v3-solidity-utils]:         ✔ handles base one
[@bush.fi/v3-solidity-utils]:         ✔ handles base greater than one
[@bush.fi/v3-solidity-utils]:       base zero
[@bush.fi/v3-solidity-utils]:         ✔ handles exponent zero
[@bush.fi/v3-solidity-utils]:         ✔ handles exponent one
[@bush.fi/v3-solidity-utils]:         ✔ handles exponent greater than one
[@bush.fi/v3-solidity-utils]:       base one
[@bush.fi/v3-solidity-utils]:         ✔ handles exponent zero
[@bush.fi/v3-solidity-utils]:         ✔ handles exponent one
[@bush.fi/v3-solidity-utils]:         ✔ handles exponent greater than one
[@bush.fi/v3-solidity-utils]:       base and exponent greater than one
[@bush.fi/v3-solidity-utils]:         ✔ handles base and exponent greater than one
[@bush.fi/v3-solidity-utils]:       x between LN_36_LOWER_BOUND and LN_36_UPPER_BOUND
[@bush.fi/v3-solidity-utils]:         ✔ handles x in the specific range properly
[@bush.fi/v3-solidity-utils]:       exponent as decimal
[@bush.fi/v3-solidity-utils]:         ✔ handles decimals properly
[@bush.fi/v3-solidity-utils]:       decimals
[@bush.fi/v3-solidity-utils]:         ✔ handles decimals properly
[@bush.fi/v3-solidity-utils]:       max values
[@bush.fi/v3-solidity-utils]:         ✔ cannot handle a product when logx_times_y > MAX_NATURAL_EXPONENT
[@bush.fi/v3-solidity-utils]:         ✔ cannot handle a product when logx_times_y < MIN_NATURAL_EXPONENT
[@bush.fi/v3-solidity-utils]:         ✔ cannot handle a base greater than 2^255 - 1
[@bush.fi/v3-solidity-utils]:         ✔ cannot handle an exponent greater than (2^254/1e20) - 1
[@bush.fi/v3-solidity-utils]:     exp
[@bush.fi/v3-solidity-utils]:       ✔ handles zero
[@bush.fi/v3-solidity-utils]:       ✔ handles one
[@bush.fi/v3-solidity-utils]:       ✔ handles negative input
[@bush.fi/v3-solidity-utils]:       ✔ handles large positive input within the defined bounds
[@bush.fi/v3-solidity-utils]:       ✔ handles large negative input within the defined bounds
[@bush.fi/v3-solidity-utils]:       ✔ cannot handle input larger than MAX_NATURAL_EXPONENT
[@bush.fi/v3-solidity-utils]:       ✔ cannot handle input smaller than MIN_NATURAL_EXPONENT
[@bush.fi/v3-solidity-utils]:     log
[@bush.fi/v3-solidity-utils]:       ✔ handles log base e (ln)
[@bush.fi/v3-solidity-utils]:       ✔ handles log base 10
[@bush.fi/v3-solidity-utils]:       ✔ handles arg within LN_36_LOWER_BOUND bounds
[@bush.fi/v3-solidity-utils]:       ✔ handles base within LN_36_LOWER_BOUND bounds
[@bush.fi/v3-solidity-utils]:       ✔ handles arg larger than LN_36_UPPER_BOUND
[@bush.fi/v3-solidity-utils]:       ✔ handles base larger than LN_36_UPPER_BOUND
[@bush.fi/v3-solidity-utils]:     ln
[@bush.fi/v3-solidity-utils]:       ✔ handles ln of e
[@bush.fi/v3-solidity-utils]:       ✔ handles ln of 1
[@bush.fi/v3-solidity-utils]:       ✔ handles input within LN_36 bounds
[@bush.fi/v3-solidity-utils]:       ✔ handles input larger than LN_36_UPPER_BOUND
[@bush.fi/v3-solidity-utils]:       ✔ handles input equal to a3 * ONE_18
[@bush.fi/v3-solidity-utils]:       ✔ handles input equal to a1 * ONE_18
[@bush.fi/v3-solidity-utils]:       ✔ throws OutOfBounds error for zero
[@bush.fi/v3-solidity-utils]:       ✔ throws OutOfBounds error for negative number
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]:   ReentrancyGuard
[@bush.fi/v3-solidity-utils]:     ✔ nonReentrant function can be called
[@bush.fi/v3-solidity-utils]:     ✔ does not allow remote callback (71ms)
[@bush.fi/v3-solidity-utils]:     ✔ _reentrancyGuardEntered should be true when guarded
[@bush.fi/v3-solidity-utils]:     ✔ _reentrancyGuardEntered should be false when unguarded
[@bush.fi/v3-solidity-utils]:     ✔ does not allow local recursion
[@bush.fi/v3-solidity-utils]:     ✔ does not allow indirect local recursion
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]:   StableMath
[@bush.fi/v3-solidity-utils]:     invariant
[@bush.fi/v3-solidity-utils]:       ✔ still converges at extreme values (40ms)
[@bush.fi/v3-solidity-utils]:       check over a range of inputs
[@bush.fi/v3-solidity-utils]:         ✔ computes the invariant for 2 tokens (347ms)
[@bush.fi/v3-solidity-utils]:         ✔ computes the invariant for 3 tokens (235ms)
[@bush.fi/v3-solidity-utils]:         ✔ computes the invariant for 4 tokens (237ms)
[@bush.fi/v3-solidity-utils]:         ✔ computes the invariant for 5 tokens (188ms)
[@bush.fi/v3-solidity-utils]:       two tokens
[@bush.fi/v3-solidity-utils]:         ✔ invariant equals analytical solution
[@bush.fi/v3-solidity-utils]:     token balance given invariant and other balances
[@bush.fi/v3-solidity-utils]:       check over a range of inputs
[@bush.fi/v3-solidity-utils]:         ✔ computes the token balance for 2 tokens (507ms)
[@bush.fi/v3-solidity-utils]:         ✔ computes the token balance for 3 tokens (716ms)
[@bush.fi/v3-solidity-utils]:         ✔ computes the token balance for 4 tokens (718ms)
[@bush.fi/v3-solidity-utils]:         ✔ computes the token balance for 5 tokens (881ms)
[@bush.fi/v3-solidity-utils]:     in given exact out
[@bush.fi/v3-solidity-utils]:       two tokens
[@bush.fi/v3-solidity-utils]:         ✔ returns in given exact out
[@bush.fi/v3-solidity-utils]:       three tokens
[@bush.fi/v3-solidity-utils]:         ✔ returns in given exact out
[@bush.fi/v3-solidity-utils]:     out given exact in
[@bush.fi/v3-solidity-utils]:       two tokens
[@bush.fi/v3-solidity-utils]:         ✔ returns out given exact in
[@bush.fi/v3-solidity-utils]:       three tokens
[@bush.fi/v3-solidity-utils]:         ✔ returns out given exact in
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]:   WordCodec
[@bush.fi/v3-solidity-utils]:     encode
[@bush.fi/v3-solidity-utils]:       unsigned
[@bush.fi/v3-solidity-utils]:         ✔ reverts with zero bit length
[@bush.fi/v3-solidity-utils]:         ✔ reverts with 256 bit length
[@bush.fi/v3-solidity-utils]:         ✔ reverts with large offset
[@bush.fi/v3-solidity-utils]:         with offset 0
[@bush.fi/v3-solidity-utils]:           ✔ encodes small values of all bit sizes (331ms)
[@bush.fi/v3-solidity-utils]:           ✔ encodes max values of all bit sizes (310ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large values (227ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large bitsize
[@bush.fi/v3-solidity-utils]:         with offset 50
[@bush.fi/v3-solidity-utils]:           ✔ encodes small values of all bit sizes (217ms)
[@bush.fi/v3-solidity-utils]:           ✔ encodes max values of all bit sizes (299ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large values (215ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large bitsize
[@bush.fi/v3-solidity-utils]:         with offset 150
[@bush.fi/v3-solidity-utils]:           ✔ encodes small values of all bit sizes (147ms)
[@bush.fi/v3-solidity-utils]:           ✔ encodes max values of all bit sizes (115ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large values (100ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large bitsize
[@bush.fi/v3-solidity-utils]:         with offset 254
[@bush.fi/v3-solidity-utils]:           ✔ encodes small values of all bit sizes
[@bush.fi/v3-solidity-utils]:           ✔ encodes max values of all bit sizes
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large values
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large bitsize
[@bush.fi/v3-solidity-utils]:       signed
[@bush.fi/v3-solidity-utils]:         ✔ reverts with zero bit length
[@bush.fi/v3-solidity-utils]:         ✔ reverts with 256 bit length
[@bush.fi/v3-solidity-utils]:         ✔ reverts with large offset
[@bush.fi/v3-solidity-utils]:         with offset 0
[@bush.fi/v3-solidity-utils]:           ✔ encodes small positive values of all bit sizes (345ms)
[@bush.fi/v3-solidity-utils]:           ✔ encodes small negative values of all bit sizes (467ms)
[@bush.fi/v3-solidity-utils]:           ✔ encodes max values of all bit sizes (404ms)
[@bush.fi/v3-solidity-utils]:           ✔ encodes min values of all bit sizes (523ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large positive values (346ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large negative values (355ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large bitsize
[@bush.fi/v3-solidity-utils]:         with offset 50
[@bush.fi/v3-solidity-utils]:           ✔ encodes small positive values of all bit sizes (518ms)
[@bush.fi/v3-solidity-utils]:           ✔ encodes small negative values of all bit sizes (580ms)
[@bush.fi/v3-solidity-utils]:           ✔ encodes max values of all bit sizes (643ms)
[@bush.fi/v3-solidity-utils]:           ✔ encodes min values of all bit sizes (630ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large positive values (538ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large negative values (519ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large bitsize
[@bush.fi/v3-solidity-utils]:         with offset 150
[@bush.fi/v3-solidity-utils]:           ✔ encodes small positive values of all bit sizes (362ms)
[@bush.fi/v3-solidity-utils]:           ✔ encodes small negative values of all bit sizes (448ms)
[@bush.fi/v3-solidity-utils]:           ✔ encodes max values of all bit sizes (461ms)
[@bush.fi/v3-solidity-utils]:           ✔ encodes min values of all bit sizes (439ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large positive values (378ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large negative values (477ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large bitsize
[@bush.fi/v3-solidity-utils]:         with offset 254
[@bush.fi/v3-solidity-utils]:           ✔ encodes small positive values of all bit sizes
[@bush.fi/v3-solidity-utils]:           ✔ encodes small negative values of all bit sizes
[@bush.fi/v3-solidity-utils]:           ✔ encodes max values of all bit sizes
[@bush.fi/v3-solidity-utils]:           ✔ encodes min values of all bit sizes
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large positive values
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large negative values
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large bitsize
[@bush.fi/v3-solidity-utils]:     insert
[@bush.fi/v3-solidity-utils]:       unsigned
[@bush.fi/v3-solidity-utils]:         ✔ reverts with zero bit length
[@bush.fi/v3-solidity-utils]:         ✔ reverts with 256 bit length
[@bush.fi/v3-solidity-utils]:         ✔ reverts with large offset
[@bush.fi/v3-solidity-utils]:         with offset 0
[@bush.fi/v3-solidity-utils]:           ✔ inserts small values of all bit sizes (911ms)
[@bush.fi/v3-solidity-utils]:           ✔ inserts max values of all bit sizes (807ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large values (729ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large bitsize
[@bush.fi/v3-solidity-utils]:         with offset 50
[@bush.fi/v3-solidity-utils]:           ✔ inserts small values of all bit sizes (464ms)
[@bush.fi/v3-solidity-utils]:           ✔ inserts max values of all bit sizes (513ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large values (441ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large bitsize
[@bush.fi/v3-solidity-utils]:         with offset 150
[@bush.fi/v3-solidity-utils]:           ✔ inserts small values of all bit sizes (248ms)
[@bush.fi/v3-solidity-utils]:           ✔ inserts max values of all bit sizes (271ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large values (209ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large bitsize
[@bush.fi/v3-solidity-utils]:         with offset 254
[@bush.fi/v3-solidity-utils]:           ✔ inserts small values of all bit sizes
[@bush.fi/v3-solidity-utils]:           ✔ inserts max values of all bit sizes
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large values
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large bitsize
[@bush.fi/v3-solidity-utils]:       signed
[@bush.fi/v3-solidity-utils]:         ✔ reverts with zero bit length
[@bush.fi/v3-solidity-utils]:         ✔ reverts with 256 bit length
[@bush.fi/v3-solidity-utils]:         ✔ reverts with large offset
[@bush.fi/v3-solidity-utils]:         with offset 0
[@bush.fi/v3-solidity-utils]:           ✔ inserts small positive values of all bit sizes (698ms)
[@bush.fi/v3-solidity-utils]:           ✔ inserts small negative values of all bit sizes (711ms)
[@bush.fi/v3-solidity-utils]:           ✔ inserts max values of all bit sizes (679ms)
[@bush.fi/v3-solidity-utils]:           ✔ inserts min values of all bit sizes (682ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large positive values (606ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large negative values (662ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large bitsize
[@bush.fi/v3-solidity-utils]:         with offset 50
[@bush.fi/v3-solidity-utils]:           ✔ inserts small positive values of all bit sizes (561ms)
[@bush.fi/v3-solidity-utils]:           ✔ inserts small negative values of all bit sizes (572ms)
[@bush.fi/v3-solidity-utils]:           ✔ inserts max values of all bit sizes (625ms)
[@bush.fi/v3-solidity-utils]:           ✔ inserts min values of all bit sizes (1263ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large positive values (631ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large negative values (520ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large bitsize
[@bush.fi/v3-solidity-utils]:         with offset 150
[@bush.fi/v3-solidity-utils]:           ✔ inserts small positive values of all bit sizes (316ms)
[@bush.fi/v3-solidity-utils]:           ✔ inserts small negative values of all bit sizes (245ms)
[@bush.fi/v3-solidity-utils]:           ✔ inserts max values of all bit sizes (264ms)
[@bush.fi/v3-solidity-utils]:           ✔ inserts min values of all bit sizes (212ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large positive values (137ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large negative values (107ms)
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large bitsize
[@bush.fi/v3-solidity-utils]:         with offset 254
[@bush.fi/v3-solidity-utils]:           ✔ inserts small positive values of all bit sizes
[@bush.fi/v3-solidity-utils]:           ✔ inserts small negative values of all bit sizes
[@bush.fi/v3-solidity-utils]:           ✔ inserts max values of all bit sizes
[@bush.fi/v3-solidity-utils]:           ✔ inserts min values of all bit sizes
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large positive values
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large negative values
[@bush.fi/v3-solidity-utils]:           ✔ reverts with large bitsize
[@bush.fi/v3-solidity-utils]:       bool
[@bush.fi/v3-solidity-utils]:         with offset 0
[@bush.fi/v3-solidity-utils]:           ✔ inserts true
[@bush.fi/v3-solidity-utils]:           ✔ inserts false
[@bush.fi/v3-solidity-utils]:         with offset 50
[@bush.fi/v3-solidity-utils]:           ✔ inserts true
[@bush.fi/v3-solidity-utils]:           ✔ inserts false
[@bush.fi/v3-solidity-utils]:         with offset 150
[@bush.fi/v3-solidity-utils]:           ✔ inserts true
[@bush.fi/v3-solidity-utils]:           ✔ inserts false
[@bush.fi/v3-solidity-utils]:         with offset 254
[@bush.fi/v3-solidity-utils]:           ✔ inserts true
[@bush.fi/v3-solidity-utils]:           ✔ inserts false
[@bush.fi/v3-solidity-utils]:     helpers
[@bush.fi/v3-solidity-utils]:       ✔ clears word at position
[@bush.fi/v3-solidity-utils]:       ✔ ensures surrounding state unchanged
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]:   346 passing (34s)
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]: No files changed, compilation skipped
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]: Ran 1 test for test/foundry/LogExpMath.t.sol:LogExpMathTest
[@bush.fi/v3-solidity-utils]: [PASS] testPow() (gas: 5346)
[@bush.fi/v3-solidity-utils]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 418.29µs (81.04µs CPU time)
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]: Ran 5 tests for test/foundry/RevertCodec.t.sol:RevertCodecTest
[@bush.fi/v3-solidity-utils]: [PASS] testCatchEncodedResultCustomError() (gas: 3730)
[@bush.fi/v3-solidity-utils]: [PASS] testCatchEncodedResultNoSelector() (gas: 3180)
[@bush.fi/v3-solidity-utils]: [PASS] testCatchEncodedResultOk() (gas: 5294)
[@bush.fi/v3-solidity-utils]: [PASS] testParseSelector() (gas: 3610)
[@bush.fi/v3-solidity-utils]: [PASS] testParseSelectorNoData() (gas: 3158)
[@bush.fi/v3-solidity-utils]: Suite result: ok. 5 passed; 0 failed; 0 skipped; finished in 812.96µs (688.79µs CPU time)
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]: Ran 3 tests for test/foundry/ERC4626TestToken.t.sol:ERC4626TestTokenTest
[@bush.fi/v3-solidity-utils]: [PASS] testMockRateDecrease() (gas: 36928)
[@bush.fi/v3-solidity-utils]: [PASS] testMockRateIncrease() (gas: 37711)
[@bush.fi/v3-solidity-utils]: [PASS] testMockRateIncreaseDecrease() (gas: 101319)
[@bush.fi/v3-solidity-utils]: Suite result: ok. 3 passed; 0 failed; 0 skipped; finished in 8.62ms (533.00µs CPU time)
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]: Ran 4 tests for test/foundry/PackedTokenBalance.t.sol:PackedTokenBalanceTest
[@bush.fi/v3-solidity-utils]: [PASS] testOverflow__Fuzz(bytes32,uint128,uint256) (runs: 10000, μ: 7193, ~: 7422)
[@bush.fi/v3-solidity-utils]: [PASS] testPackedTokenBalanceGetters__Fuzz(uint128,uint128) (runs: 10000, μ: 4141, ~: 4141)
[@bush.fi/v3-solidity-utils]: [PASS] testPackedTokenBalanceSetters__Fuzz(bytes32,uint128) (runs: 10000, μ: 4186, ~: 4186)
[@bush.fi/v3-solidity-utils]: [PASS] testToFromPackedBalance__Fuzz(uint128,uint128) (runs: 10000, μ: 4169, ~: 4169)
[@bush.fi/v3-solidity-utils]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 1.46s (1.46s CPU time)
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]: Ran 3 tests for test/foundry/ScalingHelpers.t.sol:ScalingHelpersTest
[@bush.fi/v3-solidity-utils]: [PASS] testCopyToArrayLengthMismatch() (gas: 3391)
[@bush.fi/v3-solidity-utils]: [PASS] testCopyToArray__Fuzz(uint256[4]) (runs: 10000, μ: 13405, ~: 13405)
[@bush.fi/v3-solidity-utils]: [PASS] testCopyToArray__Fuzz(uint256[8],uint256) (runs: 10000, μ: 20007, ~: 20125)
[@bush.fi/v3-solidity-utils]: Suite result: ok. 3 passed; 0 failed; 0 skipped; finished in 1.95s (2.86s CPU time)
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]: Ran 9 tests for test/foundry/FixedPoint.t.sol:FixedPointTest
[@bush.fi/v3-solidity-utils]: [PASS] testComplementEquivalence__Fuzz(uint256) (runs: 10000, μ: 3284, ~: 3313)
[@bush.fi/v3-solidity-utils]: [PASS] testComplement__Fuzz(uint256) (runs: 10000, μ: 3313, ~: 3346)
[@bush.fi/v3-solidity-utils]: [PASS] testDivDownEquivalence__Fuzz(uint256,uint256) (runs: 10000, μ: 4254, ~: 4256)
[@bush.fi/v3-solidity-utils]: [PASS] testDivDown__Fuzz(uint256,uint256) (runs: 10000, μ: 3977, ~: 4028)
[@bush.fi/v3-solidity-utils]: [PASS] testDivUpEquivalence__Fuzz(uint256,uint256) (runs: 10000, μ: 4357, ~: 4359)
[@bush.fi/v3-solidity-utils]: [PASS] testDivUp__Fuzz(uint256,uint256) (runs: 10000, μ: 4026, ~: 4087)
[@bush.fi/v3-solidity-utils]: [PASS] testMulDown__Fuzz(uint256,uint256) (runs: 10000, μ: 3924, ~: 4015)
[@bush.fi/v3-solidity-utils]: [PASS] testMulUpEquivalence__Fuzz(uint256,uint256) (runs: 10000, μ: 3915, ~: 3917)
[@bush.fi/v3-solidity-utils]: [PASS] testMulUp__Fuzz(uint256,uint256) (runs: 10000, μ: 3869, ~: 3965)
[@bush.fi/v3-solidity-utils]: Suite result: ok. 9 passed; 0 failed; 0 skipped; finished in 7.30s (3.27s CPU time)
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]: Ran 9 tests for test/foundry/WordCodec.t.sol:WordCodecTest
[@bush.fi/v3-solidity-utils]: [PASS] testDecodeBool__Fuzz(bytes32,uint256) (runs: 10000, μ: 3241, ~: 3241)
[@bush.fi/v3-solidity-utils]: [PASS] testDecodeInt__Fuzz(bytes32,uint256,uint8) (runs: 10000, μ: 4420, ~: 4421)
[@bush.fi/v3-solidity-utils]: [PASS] testDecodeUint__Fuzz(bytes32,uint256,uint8) (runs: 10000, μ: 3785, ~: 3785)
[@bush.fi/v3-solidity-utils]: [PASS] testEncodeUint255Bits__Fuzz(uint256) (runs: 10000, μ: 3869, ~: 3869)
[@bush.fi/v3-solidity-utils]: [PASS] testEncodeUintMultiBits__Fuzz(uint256,uint8,uint256) (runs: 10000, μ: 4796, ~: 4799)
[@bush.fi/v3-solidity-utils]: [PASS] testEncodeUintOtherBitsFree__Fuzz(uint256,uint8,uint256) (runs: 10000, μ: 4908, ~: 4911)
[@bush.fi/v3-solidity-utils]: [PASS] testInsertBool__Fuzz(bytes32,bool,uint256) (runs: 10000, μ: 3394, ~: 3390)
[@bush.fi/v3-solidity-utils]: [PASS] testInsertInt__Fuzz(bytes32,int256,uint256,uint256) (runs: 10000, μ: 3392, ~: 3358)
[@bush.fi/v3-solidity-utils]: [PASS] testInsertUint__Fuzz(bytes32,uint256,uint256,uint256) (runs: 10000, μ: 3370, ~: 3336)
[@bush.fi/v3-solidity-utils]: Suite result: ok. 9 passed; 0 failed; 0 skipped; finished in 7.47s (2.93s CPU time)
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]: Ran 19 tests for test/foundry/TransientEnumerableSet.t.sol:TransientEnumerableSetTest
[@bush.fi/v3-solidity-utils]: [PASS] testAdd() (gas: 8615)
[@bush.fi/v3-solidity-utils]: [PASS] testAddAfterRemove() (gas: 10924)
[@bush.fi/v3-solidity-utils]: [PASS] testAt() (gas: 15934)
[@bush.fi/v3-solidity-utils]: [PASS] testAtRevertAfterRemove() (gas: 16525)
[@bush.fi/v3-solidity-utils]: [PASS] testAtRevertEmptyArray() (gas: 3310)
[@bush.fi/v3-solidity-utils]: [PASS] testAtRevertOutOfBounds() (gas: 8660)
[@bush.fi/v3-solidity-utils]: [PASS] testContains() (gas: 4593)
[@bush.fi/v3-solidity-utils]: [PASS] testIndexOf() (gas: 13901)
[@bush.fi/v3-solidity-utils]: [PASS] testIndexOfAfterRemove() (gas: 19714)
[@bush.fi/v3-solidity-utils]: [PASS] testIndexOfRevertEmptyArray() (gas: 3405)
[@bush.fi/v3-solidity-utils]: [PASS] testIndexOfRevertNotExistentElement() (gas: 8282)
[@bush.fi/v3-solidity-utils]: [PASS] testIndexOfRevertRemovedElement() (gas: 11038)
[@bush.fi/v3-solidity-utils]: [PASS] testLength() (gas: 21263)
[@bush.fi/v3-solidity-utils]: [PASS] testRemove() (gas: 11091)
[@bush.fi/v3-solidity-utils]: [PASS] testUncheckedAt() (gas: 14866)
[@bush.fi/v3-solidity-utils]: [PASS] testUncheckedAtOutOfBounds() (gas: 3805)
[@bush.fi/v3-solidity-utils]: [PASS] testUncheckedIndexOf() (gas: 12934)
[@bush.fi/v3-solidity-utils]: [PASS] testUncheckedIndexOfNonExistentElement() (gas: 7995)
[@bush.fi/v3-solidity-utils]: [PASS] testValues() (gas: 24130)
[@bush.fi/v3-solidity-utils]: Suite result: ok. 19 passed; 0 failed; 0 skipped; finished in 7.47s (706.46µs CPU time)
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]: Ran 9 tests for test/foundry/TransientStorageHelpers.t.sol:TransientStorageHelpersTest
[@bush.fi/v3-solidity-utils]: [PASS] testCalculateSlot() (gas: 4281)
[@bush.fi/v3-solidity-utils]: [PASS] testTransientAddressArray() (gas: 119740)
[@bush.fi/v3-solidity-utils]: [PASS] testTransientArrayFailures() (gas: 3662)
[@bush.fi/v3-solidity-utils]: [PASS] testTransientDecrementUnderflow() (gas: 3733)
[@bush.fi/v3-solidity-utils]: [PASS] testTransientIncrementOverflow() (gas: 3780)
[@bush.fi/v3-solidity-utils]: [PASS] testTransientNestedMapping__Fuzz(address,int256) (runs: 10000, μ: 28003, ~: 28003)
[@bush.fi/v3-solidity-utils]: [PASS] testTransientUintDecrement__Fuzz(uint256) (runs: 10000, μ: 28126, ~: 28126)
[@bush.fi/v3-solidity-utils]: [PASS] testTransientUintIncrement__Fuzz(uint256) (runs: 10000, μ: 28101, ~: 28101)
[@bush.fi/v3-solidity-utils]: [PASS] testTransientUint__Fuzz(uint256) (runs: 10000, μ: 27349, ~: 27349)
[@bush.fi/v3-solidity-utils]: Suite result: ok. 9 passed; 0 failed; 0 skipped; finished in 7.85s (1.95s CPU time)
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]: Ran 9 tests for test/foundry/StableMath.t.sol:StableMathTest
[@bush.fi/v3-solidity-utils]: [PASS] testCompareComputeBalancesWithSmallDiff__Fuzz(uint256,uint256[4],uint256,uint256) (runs: 10000, μ: 65910, ~: 67267)
[@bush.fi/v3-solidity-utils]: [PASS] testComputeBalanceRounding__Fuzz(uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 59250, ~: 60411)
[@bush.fi/v3-solidity-utils]: [PASS] testComputeBalanceRounding__Fuzz(uint256,uint256[4],uint256,bool[3]) (runs: 10000, μ: 78783, ~: 80356)
[@bush.fi/v3-solidity-utils]: [PASS] testComputeInGivenExactOutRounding__Fuzz(uint256,uint256[4],uint256,uint256,uint256,bool[3]) (runs: 10000, μ: 82170, ~: 82517)
[@bush.fi/v3-solidity-utils]: [PASS] testComputeInvariantLessThenInvariantWithLargeDelta__Fuzz(uint256,uint256,uint256,uint256[8],uint256[8],uint256[8]) (runs: 10000, μ: 60084, ~: 33694)
[@bush.fi/v3-solidity-utils]: [PASS] testComputeInvariantLessThenInvariantWithSmallDelta__Fuzz(uint256,uint256,uint256,uint256[8],uint256[8],uint256[8]) (runs: 10000, μ: 59232, ~: 34000)
[@bush.fi/v3-solidity-utils]: [PASS] testComputeInvariantRatioRounding__Fuzz(uint256,uint256[3],uint256[3]) (runs: 10000, μ: 84342, ~: 89735)
[@bush.fi/v3-solidity-utils]: [PASS] testComputeInvariant__Fuzz(uint256,uint256[4]) (runs: 10000, μ: 38874, ~: 39457)
[@bush.fi/v3-solidity-utils]: [PASS] testComputeOutGivenExactInRounding__Fuzz(uint256,uint256[4],uint256,uint256,uint256,bool[3]) (runs: 10000, μ: 86735, ~: 87719)
[@bush.fi/v3-solidity-utils]: Suite result: ok. 9 passed; 0 failed; 0 skipped; finished in 7.85s (47.03s CPU time)
[@bush.fi/v3-solidity-utils]: 
[@bush.fi/v3-solidity-utils]: Ran 10 test suites in 7.86s (41.37s CPU time): 71 tests passed, 0 failed, 0 skipped (71 total tests)
[@bush.fi/v3-solidity-utils]: Process exited (exit code 0), completed in 52s 193ms
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]:   0 passing (0ms)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Compiling 3 files with Solc 0.8.26
[@bush.fi/v3-standalone-utils]: Solc 0.8.26 finished in 31.75s
[@bush.fi/v3-standalone-utils]: Compiler run successful!
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 7 tests for test/foundry/ERC4626CowSwapFeeBurner.t.sol:ERC4626CowSwapFeeBurnerTest
[@bush.fi/v3-standalone-utils]: [PASS] testBurn() (gas: 259795)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnDouble() (gas: 348425)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnFeeTokenIfUnwrappedTokenBelowMin() (gas: 102105)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnFeeTokenIfUnwrappedTokenIsZero() (gas: 79000)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnFeeTokenIsTargetToken() (gas: 128569)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnFeeTokenIsTargetTokenBelowMin() (gas: 102360)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnerIfOrdersExist() (gas: 289102)
[@bush.fi/v3-standalone-utils]: Suite result: ok. 7 passed; 0 failed; 0 skipped; finished in 36.52ms (2.26ms CPU time)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 31 tests for test/foundry/BalancerContractRegistry.t.sol:BalancerContractRegistryTest
[@bush.fi/v3-standalone-utils]: [PASS] testAddingAliasEmitsEvent() (gas: 116737)
[@bush.fi/v3-standalone-utils]: [PASS] testAliasForUnregistered() (gas: 31399)
[@bush.fi/v3-standalone-utils]: [PASS] testAliasNameCollision() (gas: 90498)
[@bush.fi/v3-standalone-utils]: [PASS] testBufferRegistration() (gas: 83415)
[@bush.fi/v3-standalone-utils]: [PASS] testContractGetters() (gas: 92746)
[@bush.fi/v3-standalone-utils]: [PASS] testDeprecateNonExistentContract() (gas: 30761)
[@bush.fi/v3-standalone-utils]: [PASS] testDeprecateZeroContract() (gas: 27804)
[@bush.fi/v3-standalone-utils]: [PASS] testDeprecationEmitsEvent() (gas: 91008)
[@bush.fi/v3-standalone-utils]: [PASS] testDeprecationWithAliases() (gas: 142693)
[@bush.fi/v3-standalone-utils]: [PASS] testDeregisterNonExistentContract() (gas: 31500)
[@bush.fi/v3-standalone-utils]: [PASS] testDeregistrationEmitsEvent() (gas: 72700)
[@bush.fi/v3-standalone-utils]: [PASS] testDoubleDeprecation() (gas: 94933)
[@bush.fi/v3-standalone-utils]: [PASS] testDuplicateRegistrationAddress() (gas: 88676)
[@bush.fi/v3-standalone-utils]: [PASS] testDuplicateRegistrationName() (gas: 85256)
[@bush.fi/v3-standalone-utils]: [PASS] testGetVault() (gas: 10894)
[@bush.fi/v3-standalone-utils]: [PASS] testInvalidAliasAddress() (gas: 28482)
[@bush.fi/v3-standalone-utils]: [PASS] testInvalidAliasName() (gas: 28223)
[@bush.fi/v3-standalone-utils]: [PASS] testInvalidDeregisterName() (gas: 28029)
[@bush.fi/v3-standalone-utils]: [PASS] testIsTrustedRouter() (gas: 83221)
[@bush.fi/v3-standalone-utils]: [PASS] testRegisterWithBadAddress() (gas: 28633)
[@bush.fi/v3-standalone-utils]: [PASS] testRegisterWithBadName() (gas: 28448)
[@bush.fi/v3-standalone-utils]: [PASS] testRegisterWithoutPermission() (gas: 26123)
[@bush.fi/v3-standalone-utils]: [PASS] testRegistrationUsingAliasName() (gas: 124059)
[@bush.fi/v3-standalone-utils]: [PASS] testStaleAliasGetter() (gas: 105844)
[@bush.fi/v3-standalone-utils]: [PASS] testUpdatingAlias() (gas: 194443)
[@bush.fi/v3-standalone-utils]: [PASS] testValidAlias() (gas: 123362)
[@bush.fi/v3-standalone-utils]: [PASS] testValidDeprecation() (gas: 98015)
[@bush.fi/v3-standalone-utils]: [PASS] testValidDeregistration() (gas: 74701)
[@bush.fi/v3-standalone-utils]: [PASS] testValidRegistration() (gas: 92170)
[@bush.fi/v3-standalone-utils]: [PASS] testValidRegistrationEmitsEvent() (gas: 81027)
[@bush.fi/v3-standalone-utils]: [PASS] testWrongTypeGetter() (gas: 125080)
[@bush.fi/v3-standalone-utils]: Suite result: ok. 31 passed; 0 failed; 0 skipped; finished in 47.00ms (15.36ms CPU time)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 14 tests for test/foundry/ProtocolFeePercentagesProvider.t.sol:ProtocolFeePercentagesProviderTest
[@bush.fi/v3-standalone-utils]: [PASS] testGetBalancerContractRegistry() (gas: 10930)
[@bush.fi/v3-standalone-utils]: [PASS] testGetFactorySpecificProtocolFeePercentagesUnregisteredFactory() (gas: 11293)
[@bush.fi/v3-standalone-utils]: [PASS] testGetProtocolFeeController() (gas: 10874)
[@bush.fi/v3-standalone-utils]: [PASS] testRevertWhenSetFactorySpecificProtocolFeePercentageInvalidFactory() (gas: 117787)
[@bush.fi/v3-standalone-utils]: [PASS] testSetFactorySpecificProtocolFeePercentageBadFactory() (gas: 161557)
[@bush.fi/v3-standalone-utils]: [PASS] testSetFactorySpecificProtocolFeePercentageHighPrecisionSwap() (gas: 117682)
[@bush.fi/v3-standalone-utils]: [PASS] testSetFactorySpecificProtocolFeePercentageHighPrecisionYield() (gas: 117894)
[@bush.fi/v3-standalone-utils]: [PASS] testSetFactorySpecificProtocolFeePercentageNoPermission() (gas: 31537)
[@bush.fi/v3-standalone-utils]: [PASS] testSetFactorySpecificProtocolFeePercentageTooHighSwap() (gas: 113544)
[@bush.fi/v3-standalone-utils]: [PASS] testSetFactorySpecificProtocolFeePercentageTooHighYield() (gas: 113620)
[@bush.fi/v3-standalone-utils]: [PASS] testSetFactorySpecificProtocolFeePercentages() (gas: 147371)
[@bush.fi/v3-standalone-utils]: [PASS] testSetProtocolFeePercentagesForPools() (gas: 339505)
[@bush.fi/v3-standalone-utils]: [PASS] testSetProtocolFeePercentagesForPoolsUnknownPool() (gas: 333967)
[@bush.fi/v3-standalone-utils]: [PASS] testSetProtocolFeePercentagesForPoolsUnregisteredFactory() (gas: 16242)
[@bush.fi/v3-standalone-utils]: Suite result: ok. 14 passed; 0 failed; 0 skipped; finished in 51.59ms (10.03ms CPU time)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 5 tests for test/foundry/FeeBurnerAuthentication.t.sol:FeeBurnerAuthenticationTest
[@bush.fi/v3-standalone-utils]: [PASS] testOnlyFeeRecipient() (gas: 14107)
[@bush.fi/v3-standalone-utils]: [PASS] testOnlyFeeRecipientOrOwnerRevertIfSenderIsWrong() (gas: 16157)
[@bush.fi/v3-standalone-utils]: [PASS] testOnlyOwner() (gas: 18227)
[@bush.fi/v3-standalone-utils]: [PASS] testOnlyProtocolFeeSweeper() (gas: 10390)
[@bush.fi/v3-standalone-utils]: [PASS] testOnlyProtocolFeeSweeperRevertIfSenderIsNotSweeper() (gas: 8345)
[@bush.fi/v3-standalone-utils]: Suite result: ok. 5 passed; 0 failed; 0 skipped; finished in 52.33ms (790.29µs CPU time)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 14 tests for test/foundry/BalancerFeeBurner.t.sol:BalancerFeeBurnerTest
[@bush.fi/v3-standalone-utils]: [PASS] testBurnHookRevertIfCallerNotVault() (gas: 17957)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnRevertIfDeadlinePassed() (gas: 23861)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnRevertIfLastPathStepNotTargetToken() (gas: 106764)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnRevertIfNotAuthorized() (gas: 17412)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnRevertIfOutLessThanMinAmount() (gas: 235908)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnWithMultiHop() (gas: 495055)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnWithOneHop() (gas: 373496)
[@bush.fi/v3-standalone-utils]: [PASS] testGetBurnPathRevertIfPathNotExists() (gas: 14930)
[@bush.fi/v3-standalone-utils]: [PASS] testSetBurnPathDouble() (gas: 165520)
[@bush.fi/v3-standalone-utils]: [PASS] testSetBurnPathIfSenderIsFeeRecipient() (gas: 94830)
[@bush.fi/v3-standalone-utils]: [PASS] testSetBurnPathIfSenderIsOwner() (gas: 96929)
[@bush.fi/v3-standalone-utils]: [PASS] testSetBurnPathRevertIfNotAuthorized() (gas: 18388)
[@bush.fi/v3-standalone-utils]: [PASS] testSetPathRevertIfNotAuthorized() (gas: 18450)
[@bush.fi/v3-standalone-utils]: [PASS] testSweepAndBurn() (gas: 495594)
[@bush.fi/v3-standalone-utils]: Suite result: ok. 14 passed; 0 failed; 0 skipped; finished in 55.53ms (6.43ms CPU time)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 35 tests for test/foundry/CowSwapFeeBurner.t.sol:CowSwapFeeBurnerTest
[@bush.fi/v3-standalone-utils]: [PASS] testBurn() (gas: 217339)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnDouble() (gas: 274461)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnWhenDeadlineLessThanCurrentBlock() (gas: 18886)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnWhenFeeTokenAsTargetToken() (gas: 18689)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnWhenMinAmountOutIsZero() (gas: 20771)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnWithZeroAmount() (gas: 20744)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnWithoutPermission() (gas: 17396)
[@bush.fi/v3-standalone-utils]: [PASS] testBurnerIfOrdersExist() (gas: 231305)
[@bush.fi/v3-standalone-utils]: [PASS] testCancelOrderIfSenderIsFeeRecipient() (gas: 213742)
[@bush.fi/v3-standalone-utils]: [PASS] testCancelOrderIfSenderIsOwner() (gas: 217083)
[@bush.fi/v3-standalone-utils]: [PASS] testCancelOrderWithInvalidOrderStatus() (gas: 21596)
[@bush.fi/v3-standalone-utils]: [PASS] testCancelOrderWithoutPermission() (gas: 20276)
[@bush.fi/v3-standalone-utils]: [PASS] testEmergencyCancelWithoutPermission() (gas: 20320)
[@bush.fi/v3-standalone-utils]: [PASS] testEmergencyRevertOrderIfSenderIsFeeRecipient() (gas: 211520)
[@bush.fi/v3-standalone-utils]: [PASS] testEmergencyRevertOrderIfSenderIsOwner() (gas: 214875)
[@bush.fi/v3-standalone-utils]: [PASS] testGetOrderStatus() (gas: 185995)
[@bush.fi/v3-standalone-utils]: [PASS] testGetOrderStatusWhenOrderFailed() (gas: 186890)
[@bush.fi/v3-standalone-utils]: [PASS] testGetOrderStatusWhenOrderFilled() (gas: 184053)
[@bush.fi/v3-standalone-utils]: [PASS] testGetOrderStatusWhenOrderNonexistent() (gas: 13505)
[@bush.fi/v3-standalone-utils]: [PASS] testGetTradeableOrder() (gas: 191741)
[@bush.fi/v3-standalone-utils]: [PASS] testGetTradeableOrderWhenOrderNonexistent() (gas: 23358)
[@bush.fi/v3-standalone-utils]: [PASS] testIsValidSignature() (gas: 38455)
[@bush.fi/v3-standalone-utils]: [PASS] testRetryOrderIfSenderIsFeeRecipient() (gas: 238221)
[@bush.fi/v3-standalone-utils]: [PASS] testRetryOrderIfSenderIsOwner() (gas: 242352)
[@bush.fi/v3-standalone-utils]: [PASS] testRetryOrderWithInvalidDeadline() (gas: 202281)
[@bush.fi/v3-standalone-utils]: [PASS] testRetryOrderWithInvalidMinAmountOut() (gas: 202201)
[@bush.fi/v3-standalone-utils]: [PASS] testRetryOrderWithInvalidOrderStatus() (gas: 23595)
[@bush.fi/v3-standalone-utils]: [PASS] testRetryOrderWithoutPermission() (gas: 20253)
[@bush.fi/v3-standalone-utils]: [PASS] testSupportsInterface() (gas: 25261)
[@bush.fi/v3-standalone-utils]: [PASS] testSweepAndBurn() (gas: 351485)
[@bush.fi/v3-standalone-utils]: [PASS] testVerify() (gas: 196334)
[@bush.fi/v3-standalone-utils]: [PASS] testVerifyWhenBuyPriceMoreThanTargetPrice() (gas: 196467)
[@bush.fi/v3-standalone-utils]: [PASS] testVerifyWithDiscreteOrderWithLessBuyAmount() (gas: 197267)
[@bush.fi/v3-standalone-utils]: [PASS] testVerifyWithInvalidOrder() (gas: 28869)
[@bush.fi/v3-standalone-utils]: [PASS] testVersion() (gas: 12426)
[@bush.fi/v3-standalone-utils]: Suite result: ok. 35 passed; 0 failed; 0 skipped; finished in 62.59ms (35.67ms CPU time)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 1 test for test/foundry/PriceImpact.t.sol:PriceImpactTest
[@bush.fi/v3-standalone-utils]: [PASS] testPriceImpact() (gas: 1185707)
[@bush.fi/v3-standalone-utils]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 53.50ms (19.51ms CPU time)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 36 tests for test/foundry/ProtocolFeeSweeper.t.sol:ProtocolFeeSweeperTest
[@bush.fi/v3-standalone-utils]: [PASS] testAddApprovedBurnerNoPermission() (gas: 29528)
[@bush.fi/v3-standalone-utils]: [PASS] testAddDuplicateFeeBurner() (gas: 34735)
[@bush.fi/v3-standalone-utils]: [PASS] testAddFeeBurnerEmitsEvent() (gas: 56925)
[@bush.fi/v3-standalone-utils]: [PASS] testAddInvalidFeeBurner() (gas: 32200)
[@bush.fi/v3-standalone-utils]: [PASS] testApprovedBurnerGetter() (gas: 16896)
[@bush.fi/v3-standalone-utils]: [PASS] testDeadline() (gas: 225465)
[@bush.fi/v3-standalone-utils]: [PASS] testFallbackNoEth() (gas: 17274)
[@bush.fi/v3-standalone-utils]: [PASS] testGetFeeRecipient() (gas: 13002)
[@bush.fi/v3-standalone-utils]: [PASS] testGetProtocolFeeController() (gas: 19341)
[@bush.fi/v3-standalone-utils]: [PASS] testGetTargetToken() (gas: 10930)
[@bush.fi/v3-standalone-utils]: [PASS] testInvalidBurnerConfiguration() (gas: 41326)
[@bush.fi/v3-standalone-utils]: [PASS] testMultipleFeeBurners() (gas: 94099)
[@bush.fi/v3-standalone-utils]: [PASS] testNoEth() (gas: 19059)
[@bush.fi/v3-standalone-utils]: [PASS] testNoFallback() (gas: 10678)
[@bush.fi/v3-standalone-utils]: [PASS] testRecoverNoPermission() (gas: 11362)
[@bush.fi/v3-standalone-utils]: [PASS] testRecoverProtocolFees() (gas: 117588)
[@bush.fi/v3-standalone-utils]: [PASS] testRemoveFeeBurner() (gas: 61032)
[@bush.fi/v3-standalone-utils]: [PASS] testRemoveFeeBurnerEmitsEvent() (gas: 34894)
[@bush.fi/v3-standalone-utils]: [PASS] testRemoveFeeBurnerNoPermission() (gas: 29518)
[@bush.fi/v3-standalone-utils]: [PASS] testRemoveFeeBurnerNotAdded() (gas: 34721)
[@bush.fi/v3-standalone-utils]: [PASS] testSetFeeRecipient() (gas: 54744)
[@bush.fi/v3-standalone-utils]: [PASS] testSetFeeRecipientEmitsEvent() (gas: 37575)
[@bush.fi/v3-standalone-utils]: [PASS] testSetFeeRecipientNoPermission() (gas: 29551)
[@bush.fi/v3-standalone-utils]: [PASS] testSetInvalidFeeRecipient() (gas: 29993)
[@bush.fi/v3-standalone-utils]: [PASS] testSetTargetToken() (gas: 65501)
[@bush.fi/v3-standalone-utils]: [PASS] testSetTargetTokenEmitsEvent() (gas: 56578)
[@bush.fi/v3-standalone-utils]: [PASS] testSetTargetTokenNoPermission() (gas: 29532)
[@bush.fi/v3-standalone-utils]: [PASS] testSwapLimits() (gas: 285943)
[@bush.fi/v3-standalone-utils]: [PASS] testSweepForTokenNoPermission() (gas: 34385)
[@bush.fi/v3-standalone-utils]: [PASS] testSweepForWrappedTokenNoPermission() (gas: 34399)
[@bush.fi/v3-standalone-utils]: [PASS] testSweepProtocolFeesFallbackForToken() (gas: 363476)
[@bush.fi/v3-standalone-utils]: [PASS] testSweepProtocolFeesForTokenBurner() (gas: 427819)
[@bush.fi/v3-standalone-utils]: [PASS] testSweepProtocolFeesForWrappedToken() (gas: 351297)
[@bush.fi/v3-standalone-utils]: [PASS] testSweepProtocolFeesForWrappedTokenIfTargetTokenIsFeeToken() (gas: 200560)
[@bush.fi/v3-standalone-utils]: [PASS] testSweepProtocolFeesIfBurnerDoesNotPullTokens() (gas: 330839)
[@bush.fi/v3-standalone-utils]: [PASS] testUnsupportedFeeBurner() (gas: 39660)
[@bush.fi/v3-standalone-utils]: Suite result: ok. 36 passed; 0 failed; 0 skipped; finished in 25.77ms (8.99ms CPU time)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 7 tests for test/foundry/WeightedLPOracleFactory.t.sol:WeightedLPOracleFactoryTest
[@bush.fi/v3-standalone-utils]: [PASS] testCreateEmitsEvent() (gas: 8083280)
[@bush.fi/v3-standalone-utils]: [PASS] testCreateOracle() (gas: 6111581)
[@bush.fi/v3-standalone-utils]: [PASS] testCreateOracleDifferentFeeds() (gas: 8440816)
[@bush.fi/v3-standalone-utils]: [PASS] testCreateOracleRevertsWhenOracleAlreadyExists() (gas: 6111128)
[@bush.fi/v3-standalone-utils]: [PASS] testDisable() (gas: 58209)
[@bush.fi/v3-standalone-utils]: [PASS] testDisableIsAuthenticated() (gas: 25061)
[@bush.fi/v3-standalone-utils]: [PASS] testGetNonExistentOracle() (gas: 11767)
[@bush.fi/v3-standalone-utils]: Suite result: ok. 7 passed; 0 failed; 0 skipped; finished in 25.76ms (5.47ms CPU time)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 14 tests for test/foundry/PoolSwapFeeHelper.t.sol:PoolSwapFeeHelperTest
[@bush.fi/v3-standalone-utils]: [PASS] testAddPoolWithSwapManager() (gas: 2408574)
[@bush.fi/v3-standalone-utils]: [PASS] testAddPoolWithoutPermission() (gas: 27760)
[@bush.fi/v3-standalone-utils]: [PASS] testAddPoolsWithTwoBatches() (gas: 47699425)
[@bush.fi/v3-standalone-utils]: [PASS] testAddUnregisteredPool() (gas: 30219)
[@bush.fi/v3-standalone-utils]: [PASS] testDoubleAddOnePool() (gas: 4863201)
[@bush.fi/v3-standalone-utils]: [PASS] testGetPools() (gas: 23882652)
[@bush.fi/v3-standalone-utils]: [PASS] testGetPoolsEdgeCases() (gas: 23868769)
[@bush.fi/v3-standalone-utils]: [PASS] testGetPoolsInvalidCases() (gas: 23870267)
[@bush.fi/v3-standalone-utils]: [PASS] testRemoveNotExistingPool() (gas: 23869951)
[@bush.fi/v3-standalone-utils]: [PASS] testRemovePoolWithoutPermission() (gas: 23871532)
[@bush.fi/v3-standalone-utils]: [PASS] testRemovePools() (gas: 23516447)
[@bush.fi/v3-standalone-utils]: [PASS] testSetSwapFee() (gas: 24107812)
[@bush.fi/v3-standalone-utils]: [PASS] testSetSwapFeeIfPoolIsNotInList() (gas: 23869068)
[@bush.fi/v3-standalone-utils]: [PASS] testSetSwapFeeWithoutPermission() (gas: 2486028)
[@bush.fi/v3-standalone-utils]: Suite result: ok. 14 passed; 0 failed; 0 skipped; finished in 84.73ms (101.30ms CPU time)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 7 tests for test/foundry/StableLPOracleFactory.t.sol:StableLPOracleFactoryTest
[@bush.fi/v3-standalone-utils]: [PASS] testCreateEmitsEvent() (gas: 7565737)
[@bush.fi/v3-standalone-utils]: [PASS] testCreateOracle() (gas: 5836614)
[@bush.fi/v3-standalone-utils]: [PASS] testCreateOracleDifferentFeeds() (gas: 7923272)
[@bush.fi/v3-standalone-utils]: [PASS] testCreateOracleRevertsWhenOracleAlreadyExists() (gas: 5836139)
[@bush.fi/v3-standalone-utils]: [PASS] testDisable() (gas: 58187)
[@bush.fi/v3-standalone-utils]: [PASS] testDisableIsAuthenticated() (gas: 25061)
[@bush.fi/v3-standalone-utils]: [PASS] testGetNonExistentOracle() (gas: 11812)
[@bush.fi/v3-standalone-utils]: Suite result: ok. 7 passed; 0 failed; 0 skipped; finished in 21.49ms (5.01ms CPU time)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 14 tests for test/foundry/PoolPauseHelper.t.sol:PoolPauseHelperTest
[@bush.fi/v3-standalone-utils]: [PASS] testAddPoolWithoutPermission() (gas: 27782)
[@bush.fi/v3-standalone-utils]: [PASS] testAddPoolsWithTwoBatches() (gas: 47641328)
[@bush.fi/v3-standalone-utils]: [PASS] testDoubleAddOnePool() (gas: 4802002)
[@bush.fi/v3-standalone-utils]: [PASS] testDoublePauseOnePool() (gas: 4880985)
[@bush.fi/v3-standalone-utils]: [PASS] testGetPools() (gas: 23853604)
[@bush.fi/v3-standalone-utils]: [PASS] testGetPoolsEdgeCases() (gas: 23839765)
[@bush.fi/v3-standalone-utils]: [PASS] testGetPoolsInvalidCases() (gas: 23841329)
[@bush.fi/v3-standalone-utils]: [PASS] testPause() (gas: 24034833)
[@bush.fi/v3-standalone-utils]: [PASS] testPauseIfPoolIsNotInList() (gas: 23840774)
[@bush.fi/v3-standalone-utils]: [PASS] testPauseWithoutPermission() (gas: 23842600)
[@bush.fi/v3-standalone-utils]: [PASS] testPauseWithoutVaultPermission() (gas: 2495969)
[@bush.fi/v3-standalone-utils]: [PASS] testRemoveNotExistingPool() (gas: 23840855)
[@bush.fi/v3-standalone-utils]: [PASS] testRemovePoolWithoutPermission() (gas: 23842576)
[@bush.fi/v3-standalone-utils]: [PASS] testRemovePools() (gas: 23487513)
[@bush.fi/v3-standalone-utils]: Suite result: ok. 14 passed; 0 failed; 0 skipped; finished in 186.11ms (141.62ms CPU time)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 3 tests for test/foundry/PriceImpactUnit.t.sol:PriceImpactUnitTest
[@bush.fi/v3-standalone-utils]: [PASS] testMaxNegativeIndex__Fuzz(int256[10],uint256) (runs: 10000, μ: 50775, ~: 50697)
[@bush.fi/v3-standalone-utils]: [PASS] testMinPositiveIndex__Fuzz(int256[10],uint256) (runs: 10000, μ: 45895, ~: 46132)
[@bush.fi/v3-standalone-utils]: [PASS] testQueryAddLiquidityUnbalancedForTokenDeltas__Fuzz(int256[10],uint256,uint256,uint256) (runs: 10000, μ: 45824, ~: 45851)
[@bush.fi/v3-standalone-utils]: Suite result: ok. 3 passed; 0 failed; 0 skipped; finished in 4.22s (11.35s CPU time)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 14 tests for test/foundry/WeightedLPOracle.t.sol:WeightedLPOracleTest
[@bush.fi/v3-standalone-utils]: [PASS] testCalculateFeedTokenDecimalScalingFactor__Fuzz(uint256) (runs: 10, μ: 7522816, ~: 7554197)
[@bush.fi/v3-standalone-utils]: [PASS] testCalculateTVLAfterSwap() (gas: 6313722)
[@bush.fi/v3-standalone-utils]: [PASS] testCalculateTVLAfterSwapWithRates() (gas: 6523505)
[@bush.fi/v3-standalone-utils]: [PASS] testCalculateTVL__Fuzz(uint256,uint256[8],uint256[8],uint256[8]) (runs: 10000, μ: 7336751, ~: 7362044)
[@bush.fi/v3-standalone-utils]: [PASS] testDecimals() (gas: 6250280)
[@bush.fi/v3-standalone-utils]: [PASS] testDescription() (gas: 6251892)
[@bush.fi/v3-standalone-utils]: [PASS] testGetFeedData__Fuzz(uint256,uint256[8],uint256[8]) (runs: 10000, μ: 7464913, ~: 7484214)
[@bush.fi/v3-standalone-utils]: [PASS] testGetFeedTokenDecimalScalingFactors__Fuzz(uint256) (runs: 10, μ: 7100210, ~: 6905088)
[@bush.fi/v3-standalone-utils]: [PASS] testGetFeeds__Fuzz(uint256) (runs: 10, μ: 6995741, ~: 6738019)
[@bush.fi/v3-standalone-utils]: [PASS] testGetPoolTokens(uint256) (runs: 10, μ: 7358991, ~: 7712587)
[@bush.fi/v3-standalone-utils]: [PASS] testGetWeights__Fuzz(uint256) (runs: 10, μ: 7573011, ~: 7700842)
[@bush.fi/v3-standalone-utils]: [PASS] testLatestRoundData__Fuzz(uint256,uint256[8],uint256[8],uint256[8],uint256[8]) (runs: 10000, μ: 7620142, ~: 7625671)
[@bush.fi/v3-standalone-utils]: [PASS] testUnsupportedDecimals() (gas: 6424170)
[@bush.fi/v3-standalone-utils]: [PASS] testVersion() (gas: 6250231)
[@bush.fi/v3-standalone-utils]: Suite result: ok. 14 passed; 0 failed; 0 skipped; finished in 36.10s (96.09s CPU time)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 14 tests for test/foundry/ProtocolFeeHelper.t.sol:PoolPauseHelperTest
[@bush.fi/v3-standalone-utils]: [PASS] testAddPoolWithoutPermission() (gas: 27672)
[@bush.fi/v3-standalone-utils]: [PASS] testAddPoolsWithTwoBatches() (gas: 47641901)
[@bush.fi/v3-standalone-utils]: [PASS] testAddUnregisteredPool() (gas: 30241)
[@bush.fi/v3-standalone-utils]: [PASS] testDoubleAddOnePool() (gas: 4802001)
[@bush.fi/v3-standalone-utils]: [PASS] testGetPools() (gas: 23853515)
[@bush.fi/v3-standalone-utils]: [PASS] testGetPoolsEdgeCases() (gas: 23839699)
[@bush.fi/v3-standalone-utils]: [PASS] testGetPoolsInvalidCases() (gas: 23841197)
[@bush.fi/v3-standalone-utils]: [PASS] testRemoveNotExistingPool() (gas: 23840789)
[@bush.fi/v3-standalone-utils]: [PASS] testRemovePoolWithoutPermission() (gas: 23842599)
[@bush.fi/v3-standalone-utils]: [PASS] testRemovePools() (gas: 23487876)
[@bush.fi/v3-standalone-utils]: [PASS] testSetProtocolFee() (gas: 25372711)
[@bush.fi/v3-standalone-utils]: [PASS] testSetProtocolFeeIfPoolIsNotInList() (gas: 23832727)
[@bush.fi/v3-standalone-utils]: [PASS] testSetProtocolFeeWithoutFeeControllerPermission() (gas: 2495165)
[@bush.fi/v3-standalone-utils]: [PASS] testSetProtocolFeeWithoutPermission() (gas: 2483344)
[@bush.fi/v3-standalone-utils]: Suite result: ok. 14 passed; 0 failed; 0 skipped; finished in 140.24s (120.39ms CPU time)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 11 tests for test/foundry/StableLPOracle.t.sol:StableLPOracleTest
[@bush.fi/v3-standalone-utils]: [PASS] testCalculateFeedTokenDecimalScalingFactor__Fuzz(uint256) (runs: 10000, μ: 6472509, ~: 6319270)
[@bush.fi/v3-standalone-utils]: [PASS] testCalculateTVL2Tokens() (gas: 6193463)
[@bush.fi/v3-standalone-utils]: [PASS] testComputeMarketPriceBalances__Fuzz(uint256,uint256,uint256[5],uint256[5]) (runs: 10000, μ: 7282321, ~: 6973345)
[@bush.fi/v3-standalone-utils]: [PASS] testDecimals() (gas: 5957759)
[@bush.fi/v3-standalone-utils]: [PASS] testDescription() (gas: 5959367)
[@bush.fi/v3-standalone-utils]: [PASS] testGetFeedData__Fuzz(uint256,uint256[5],uint256[5]) (runs: 10000, μ: 6659562, ~: 6472972)
[@bush.fi/v3-standalone-utils]: [PASS] testGetFeedTokenDecimalScalingFactors__Fuzz(uint256) (runs: 10000, μ: 6474103, ~: 6318386)
[@bush.fi/v3-standalone-utils]: [PASS] testGetFeeds__Fuzz(uint256) (runs: 10000, μ: 6474037, ~: 6313810)
[@bush.fi/v3-standalone-utils]: [PASS] testLatestRoundData__Fuzz(uint256,uint256,uint256[5],uint256[5],uint256[5]) (runs: 10000, μ: 8470130, ~: 7738907)
[@bush.fi/v3-standalone-utils]: [PASS] testUnsupportedDecimals() (gas: 6131738)
[@bush.fi/v3-standalone-utils]: [PASS] testVersion() (gas: 5957710)
[@bush.fi/v3-standalone-utils]: Suite result: ok. 11 passed; 0 failed; 0 skipped; finished in 263.40s (503.12s CPU time)
[@bush.fi/v3-standalone-utils]: 
[@bush.fi/v3-standalone-utils]: Ran 16 test suites in 263.43s (444.66s CPU time): 227 tests passed, 0 failed, 0 skipped (227 total tests)
[@bush.fi/v3-standalone-utils]: Process exited (exit code 0), completed in 5m 6s
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]:   LBPool
[@bush.fi/v3-pool-weighted]:     ✔ should have correct versions
[@bush.fi/v3-pool-weighted]:     ✔ returns starting weights
[@bush.fi/v3-pool-weighted]:     ✔ cannot be initialized by non-owners
[@bush.fi/v3-pool-weighted]:     ✔ can be initialized by the owner
[@bush.fi/v3-pool-weighted]:     with initialized pool
[@bush.fi/v3-pool-weighted]:       ✔ pool and protocol fee preconditions
[@bush.fi/v3-pool-weighted]:       ✔ has the correct pool tokens and balances
[@bush.fi/v3-pool-weighted]:       ✔ cannot be initialized twice
[@bush.fi/v3-pool-weighted]:       Owner operations and events
[@bush.fi/v3-pool-weighted]:         ✔ should emit GradualWeightUpdateScheduled event on deployment (66ms)
[@bush.fi/v3-pool-weighted]:         ✔ should only allow owner to be the LP (57ms)
[@bush.fi/v3-pool-weighted]:       Weight update on deployment
[@bush.fi/v3-pool-weighted]:         ✔ should update weights gradually (66ms)
[@bush.fi/v3-pool-weighted]:         ✔ should constrain weights to [1%, 99%]
[@bush.fi/v3-pool-weighted]:         ✔ should not allow endTime before startTime
[@bush.fi/v3-pool-weighted]:         ✔ should always sum weights to 1 (346ms)
[@bush.fi/v3-pool-weighted]:       Setters and Getters
[@bush.fi/v3-pool-weighted]:         ✔ should get gradual weight update params (52ms)
[@bush.fi/v3-pool-weighted]:       Swap restrictions
[@bush.fi/v3-pool-weighted]:         without project token restrictions
[@bush.fi/v3-pool-weighted]:           ✔ should allow swaps after init time and before end time
[@bush.fi/v3-pool-weighted]:           ✔ should not allow swaps before start time
[@bush.fi/v3-pool-weighted]:           ✔ should allow swaps after end time
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]:   WeightedMath
[@bush.fi/v3-pool-weighted]:     computeInvariant
[@bush.fi/v3-pool-weighted]:       ✔ reverts if zero invariant
[@bush.fi/v3-pool-weighted]:       ✔ computes invariant for two tokens
[@bush.fi/v3-pool-weighted]:       ✔ computes invariant for three tokens
[@bush.fi/v3-pool-weighted]:     computeOutGivenExactIn
[@bush.fi/v3-pool-weighted]:       ✔ computes correct outAmountPool
[@bush.fi/v3-pool-weighted]:       ✔ computes correct outAmountPool when tokenAmountIn is extremely small
[@bush.fi/v3-pool-weighted]:       ✔ computes correct outAmountPool when tokenWeightIn is extremely big
[@bush.fi/v3-pool-weighted]:       ✔ computes correct outAmountPool when tokenWeightIn is extremely small
[@bush.fi/v3-pool-weighted]:       ✔ throws MaxInRatio error when tokenAmountIn exceeds maximum allowed
[@bush.fi/v3-pool-weighted]:     computeInGivenExactOut
[@bush.fi/v3-pool-weighted]:       ✔ computes correct result
[@bush.fi/v3-pool-weighted]:       ✔ computes correct inAmountPool when tokenAmountOut is extremely small
[@bush.fi/v3-pool-weighted]:       ✔ throws MaxOutRatio error when amountOut exceeds maximum allowed
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]:   WeightedPool
[@bush.fi/v3-pool-weighted]:     ✔ should have correct versions
[@bush.fi/v3-pool-weighted]:     ✔ pool and protocol fee preconditions
[@bush.fi/v3-pool-weighted]:     ✔ has the correct pool tokens and balances
[@bush.fi/v3-pool-weighted]:     ✔ cannot be initialized twice
[@bush.fi/v3-pool-weighted]:     ✔ returns weights
[@bush.fi/v3-pool-weighted]:     ✔ is registered in the factory
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]:   WeightedPool Gas Benchmark
[@bush.fi/v3-pool-weighted]:     initialization
[@bush.fi/v3-pool-weighted]:       does not use ETH
[@bush.fi/v3-pool-weighted]:         ✔ measures initialization gas without ETH (Standard)
[@bush.fi/v3-pool-weighted]:       use ETH
[@bush.fi/v3-pool-weighted]:         ✔ measures initialization gas with ETH (Standard)
[@bush.fi/v3-pool-weighted]:     test donation
[@bush.fi/v3-pool-weighted]:       ✔ pool preconditions (Standard)
[@bush.fi/v3-pool-weighted]:       ✔ measures gas (Standard)
[@bush.fi/v3-pool-weighted]:     test standard pool
[@bush.fi/v3-pool-weighted]:       swap
[@bush.fi/v3-pool-weighted]:         ✔ pool and protocol fee preconditions (undefined)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (Router) (undefined)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (BatchRouter) (undefined)
[@bush.fi/v3-pool-weighted]:       remove liquidity
[@bush.fi/v3-pool-weighted]:         ✔ pool and protocol fee preconditions (Standard)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (proportional) (Standard)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (single token exact in) (Standard)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (single token exact in - BatchRouter) (Standard) (45ms)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (single token exact out) (Standard) (53ms)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (single token exact out - BatchRouter) (Standard) (56ms)
[@bush.fi/v3-pool-weighted]:       add liquidity
[@bush.fi/v3-pool-weighted]:         ✔ pool and protocol fee preconditions (Standard)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (proportional)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (unbalanced) (Standard) (60ms)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (unbalanced - BatchRouter) (Standard) (62ms)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (single token exact out) (Standard) (43ms)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (single token exact out - BatchRouter) (Standard) (54ms)
[@bush.fi/v3-pool-weighted]:     test yield pool
[@bush.fi/v3-pool-weighted]:       swap
[@bush.fi/v3-pool-weighted]:         ✔ pool and protocol fee preconditions (undefined)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (Router) (undefined) (38ms)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (BatchRouter) (undefined) (49ms)
[@bush.fi/v3-pool-weighted]:       remove liquidity
[@bush.fi/v3-pool-weighted]:         ✔ pool and protocol fee preconditions (WithRate)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (proportional) (WithRate)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (single token exact in) (WithRate) (51ms)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (single token exact in - BatchRouter) (WithRate) (59ms)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (single token exact out) (WithRate) (61ms)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (single token exact out - BatchRouter) (WithRate) (72ms)
[@bush.fi/v3-pool-weighted]:       add liquidity
[@bush.fi/v3-pool-weighted]:         ✔ pool and protocol fee preconditions (WithRate)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (proportional)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (unbalanced) (WithRate) (71ms)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (unbalanced - BatchRouter) (WithRate) (70ms)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (single token exact out) (WithRate) (54ms)
[@bush.fi/v3-pool-weighted]:         ✔ measures gas (single token exact out - BatchRouter) (WithRate) (61ms)
[@bush.fi/v3-pool-weighted]:     test ERC4626 pool
[@bush.fi/v3-pool-weighted]:       ✔ measures gas (buffers without liquidity exact in - BatchRouter) (107ms)
[@bush.fi/v3-pool-weighted]:       ✔ measures gas (buffers without liquidity exact out - BatchRouter) (78ms)
[@bush.fi/v3-pool-weighted]:       ✔ measures gas (buffers with liquidity exact in - BatchRouter) (72ms)
[@bush.fi/v3-pool-weighted]:       ✔ measures gas (buffers with liquidity exact out - BatchRouter) (85ms)
[@bush.fi/v3-pool-weighted]:     test nested pool
[@bush.fi/v3-pool-weighted]:       - measures gas (swap exact in)
[@bush.fi/v3-pool-weighted]:       - measures gas (swap exact in - reverse)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]:   72 passing (6s)
[@bush.fi/v3-pool-weighted]:   2 pending
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Nothing to compile
[@bush.fi/v3-pool-weighted]: No need to generate any newer typings.
[@bush.fi/v3-pool-weighted]: Compiling 12 files with Solc 0.8.26
[@bush.fi/v3-pool-weighted]: Solc 0.8.26 finished in 64.03s
[@bush.fi/v3-pool-weighted]: Compiler run successful!
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 7 tests for test/foundry/GradualValueChange.t.sol:GradualValueChangeTest
[@bush.fi/v3-pool-weighted]: [PASS] testCalculateValueChangeProgress() (gas: 293161)
[@bush.fi/v3-pool-weighted]: [PASS] testCalculateValueChangeProgressSameStartEndTime() (gas: 12842)
[@bush.fi/v3-pool-weighted]: [PASS] testEdgeCases() (gas: 57497991)
[@bush.fi/v3-pool-weighted]: [PASS] testGetInterpolatedValue() (gas: 349613)
[@bush.fi/v3-pool-weighted]: [PASS] testInterpolateValue() (gas: 517928)
[@bush.fi/v3-pool-weighted]: [PASS] testResolveStartTime() (gas: 13079)
[@bush.fi/v3-pool-weighted]: [PASS] testResolveStartTimeSameEndTime() (gas: 11018)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 7 passed; 0 failed; 0 skipped; finished in 203.98ms (203.50ms CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 44 tests for test/foundry/LBPool.t.sol:LBPoolTest
[@bush.fi/v3-pool-weighted]: [PASS] testAddingLiquidityNotOwner() (gas: 74252)
[@bush.fi/v3-pool-weighted]: [PASS] testAddingLiquidityOwnerAfterStartTime() (gas: 73533)
[@bush.fi/v3-pool-weighted]: [PASS] testAddingLiquidityOwnerBeforeStartTime() (gas: 195380)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolEvents() (gas: 8686323)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolLowProjectEndWeight() (gas: 43586)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolLowProjectStartWeight() (gas: 43541)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolLowReserveEndWeight() (gas: 43633)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolLowReserveStartWeight() (gas: 43566)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolNotNormalizedEndWeights() (gas: 50567)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolNotNormalizedStartWeights() (gas: 50533)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolStartTimeInPast() (gas: 4345442)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolTimeTravel() (gas: 50925)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolTimeTravelWrongEndTime() (gas: 50943)
[@bush.fi/v3-pool-weighted]: [PASS] testDonationOwnerNotAllowed() (gas: 80347)
[@bush.fi/v3-pool-weighted]: [PASS] testGetHookFlags() (gas: 17468)
[@bush.fi/v3-pool-weighted]: [PASS] testGetLBPoolDynamicData() (gas: 119409)
[@bush.fi/v3-pool-weighted]: [PASS] testGetLBPoolDynamicDataWeightInterpolation() (gas: 160513)
[@bush.fi/v3-pool-weighted]: [PASS] testGetLBPoolImmutableData() (gas: 97163)
[@bush.fi/v3-pool-weighted]: [PASS] testGetMigrationParams() (gas: 50379)
[@bush.fi/v3-pool-weighted]: [PASS] testGetMigrationParamsWithMigration() (gas: 4632138)
[@bush.fi/v3-pool-weighted]: [PASS] testGetProjectToken() (gas: 11236)
[@bush.fi/v3-pool-weighted]: [PASS] testGetReserveToken() (gas: 12117)
[@bush.fi/v3-pool-weighted]: [PASS] testGetTrustedRouter() (gas: 11809)
[@bush.fi/v3-pool-weighted]: [PASS] testGetWeightedPoolDynamicData() (gas: 12615)
[@bush.fi/v3-pool-weighted]: [PASS] testGetWeightedPoolImmutableData() (gas: 11965)
[@bush.fi/v3-pool-weighted]: [PASS] testGradualWeightUpdateParams() (gas: 4338662)
[@bush.fi/v3-pool-weighted]: [PASS] testIsProjectTokenSwapInBlocked() (gas: 8610563)
[@bush.fi/v3-pool-weighted]: [PASS] testIsSwapEnabled() (gas: 13803)
[@bush.fi/v3-pool-weighted]: [PASS] testOnBeforeInitialize() (gas: 20732)
[@bush.fi/v3-pool-weighted]: [PASS] testOnBeforeInitializeAfterStartTime() (gas: 12614)
[@bush.fi/v3-pool-weighted]: [PASS] testOnBeforeInitializeWrongSender() (gas: 18545)
[@bush.fi/v3-pool-weighted]: [PASS] testOnBeforeRemoveLiquidity() (gas: 17061)
[@bush.fi/v3-pool-weighted]: [PASS] testOnBeforeRemoveLiquidityAfterEndTime() (gas: 14960)
[@bush.fi/v3-pool-weighted]: [PASS] testOnBeforeRemoveLiquidityBeforeEndTime() (gas: 14096)
[@bush.fi/v3-pool-weighted]: [PASS] testOnBeforeRemoveLiquidityWithMigrationRevertWithWrongRouter() (gas: 4611651)
[@bush.fi/v3-pool-weighted]: [PASS] testOnBeforeRemoveLiquidityWithMigrationRouter() (gas: 4611710)
[@bush.fi/v3-pool-weighted]: [PASS] testOnRegisterMoreThanTwoTokens() (gas: 43389)
[@bush.fi/v3-pool-weighted]: [PASS] testOnRegisterNonStandardToken() (gas: 36515)
[@bush.fi/v3-pool-weighted]: [PASS] testOnRegisterSuccess() (gas: 36684)
[@bush.fi/v3-pool-weighted]: [PASS] testOnRegisterWrongPool() (gas: 36750)
[@bush.fi/v3-pool-weighted]: [PASS] testOnSwap() (gas: 60138)
[@bush.fi/v3-pool-weighted]: [PASS] testOnSwapDisabled() (gas: 59867)
[@bush.fi/v3-pool-weighted]: [PASS] testOnSwapProjectTokenInAllowed() (gas: 4626840)
[@bush.fi/v3-pool-weighted]: [PASS] testOnSwapProjectTokenInNotAllowed() (gas: 54763)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 44 passed; 0 failed; 0 skipped; finished in 657.15ms (26.30ms CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 19 tests for test/foundry/LBPoolFactory.t.sol:LBPoolFactoryTest
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityPermission() (gas: 4710209)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePool() (gas: 4665836)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolWithInvalidBptLockDurationTooHigh() (gas: 50967)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolWithInvalidBptLockDurationTooZero() (gas: 50990)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolWithInvalidBptPercentageToMigrateTooHigh() (gas: 50950)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolWithInvalidBptPercentageToMigrateZero() (gas: 50869)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolWithInvalidMigrationWeights() (gas: 97363)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolWithInvalidOwner() (gas: 16057)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolWithMigrationParams() (gas: 4668611)
[@bush.fi/v3-pool-weighted]: [PASS] testDonationNotAllowed() (gas: 4637298)
[@bush.fi/v3-pool-weighted]: [PASS] testFactoryPausedState() (gas: 8620)
[@bush.fi/v3-pool-weighted]: [PASS] testGetMigrationRouter() (gas: 11128)
[@bush.fi/v3-pool-weighted]: [PASS] testGetPoolVersion() (gas: 12109)
[@bush.fi/v3-pool-weighted]: [PASS] testGetTrustedRouter() (gas: 11241)
[@bush.fi/v3-pool-weighted]: [PASS] testInvalidTrustedRouter() (gas: 5213822)
[@bush.fi/v3-pool-weighted]: [PASS] testPoolInitialization() (gas: 55483)
[@bush.fi/v3-pool-weighted]: [PASS] testPoolRegistrationOnCreate() (gas: 32129)
[@bush.fi/v3-pool-weighted]: [PASS] testSetSwapFee() (gas: 49200)
[@bush.fi/v3-pool-weighted]: [PASS] testSetSwapFeeNoPermission() (gas: 24790)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 19 passed; 0 failed; 0 skipped; finished in 719.62ms (7.91ms CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 11 tests for test/foundry/BigWeightedPool.t.sol:BigWeightedPoolTest
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidity() (gas: 762336)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityUnbalanced() (gas: 660368)
[@bush.fi/v3-pool-weighted]: [PASS] testInitialize() (gas: 266824)
[@bush.fi/v3-pool-weighted]: [PASS] testMaximumSwapFee() (gas: 11027)
[@bush.fi/v3-pool-weighted]: [PASS] testMinimumSwapFee() (gas: 11336)
[@bush.fi/v3-pool-weighted]: [PASS] testPoolAddress() (gas: 75494)
[@bush.fi/v3-pool-weighted]: [PASS] testPoolPausedState() (gas: 23712)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquidity() (gas: 978596)
[@bush.fi/v3-pool-weighted]: [PASS] testSetSwapFeeTooHigh() (gas: 85337)
[@bush.fi/v3-pool-weighted]: [PASS] testSetSwapFeeTooLow() (gas: 84211)
[@bush.fi/v3-pool-weighted]: [PASS] testSwap() (gas: 278044)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 11 passed; 0 failed; 0 skipped; finished in 736.18ms (7.10ms CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 2 tests for test/foundry/WeightedMathRounding.t.sol:WeightedMathRoundingTest
[@bush.fi/v3-pool-weighted]: [PASS] testComputeInGivenExactOut__Fuzz(uint64,uint256,uint256,uint256,bool) (runs: 10000, μ: 28922, ~: 29356)
[@bush.fi/v3-pool-weighted]: [PASS] testComputeOutGivenExactIn__Fuzz(uint64,uint256,uint256,uint256,bool) (runs: 10000, μ: 29090, ~: 29580)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 2 passed; 0 failed; 0 skipped; finished in 6.11s (6.10s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 15 tests for test/foundry/WeightedPool.t.sol:WeightedPoolTest
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidity() (gas: 293431)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityUnbalanced() (gas: 294342)
[@bush.fi/v3-pool-weighted]: [PASS] testGetBptRate() (gas: 8612)
[@bush.fi/v3-pool-weighted]: [PASS] testGetWeightedPoolDynamicData() (gas: 105608)
[@bush.fi/v3-pool-weighted]: [PASS] testGetWeightedPoolImmutableData() (gas: 69976)
[@bush.fi/v3-pool-weighted]: [PASS] testInitialize() (gas: 102464)
[@bush.fi/v3-pool-weighted]: [PASS] testMaximumSwapFee() (gas: 11027)
[@bush.fi/v3-pool-weighted]: [PASS] testMinimumSwapFee() (gas: 11364)
[@bush.fi/v3-pool-weighted]: [PASS] testPoolAddress() (gas: 62288)
[@bush.fi/v3-pool-weighted]: [PASS] testPoolPausedState() (gas: 23734)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquidity() (gas: 387050)
[@bush.fi/v3-pool-weighted]: [PASS] testRevertsWhenSwapFeeTooLow() (gas: 3389048)
[@bush.fi/v3-pool-weighted]: [PASS] testSetSwapFeeTooHigh() (gas: 85337)
[@bush.fi/v3-pool-weighted]: [PASS] testSetSwapFeeTooLow() (gas: 84223)
[@bush.fi/v3-pool-weighted]: [PASS] testSwap() (gas: 200015)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 15 passed; 0 failed; 0 skipped; finished in 382.85ms (8.57ms CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 6 tests for test/foundry/WeightedPool8020Factory.t.sol:WeightedPool8020FactoryTest
[@bush.fi/v3-pool-weighted]: [PASS] testFactoryPausedState() (gas: 8596)
[@bush.fi/v3-pool-weighted]: [PASS] testPoolCreation() (gas: 3392413)
[@bush.fi/v3-pool-weighted]: [PASS] testPoolCrossChainProtection__Fuzz(uint16) (runs: 10, μ: 6700773, ~: 6700773)
[@bush.fi/v3-pool-weighted]: [PASS] testPoolFetching() (gas: 3416635)
[@bush.fi/v3-pool-weighted]: [PASS] testPoolUniqueness() (gas: 1072693037)
[@bush.fi/v3-pool-weighted]: [PASS] testPoolWithInvertedWeights() (gas: 6697045)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 6 passed; 0 failed; 0 skipped; finished in 128.61ms (11.24ms CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 3 tests for test/foundry/WeightedPoolFactory.t.sol:WeightedPoolFactoryTest
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolWithDonation() (gas: 3777554)
[@bush.fi/v3-pool-weighted]: [PASS] testCreatePoolWithoutDonation() (gas: 3659988)
[@bush.fi/v3-pool-weighted]: [PASS] testFactoryPausedState() (gas: 8562)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 3 passed; 0 failed; 0 skipped; finished in 405.86ms (4.95ms CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 1 test for ../../node_modules/@bush.fi/v3-vault/test/foundry/Fungibility.t.sol:FungibilityTest
[@bush.fi/v3-pool-weighted]: [PASS] testFungibilityAddUnbalanced__Fuzz(uint256) (runs: 10000, μ: 367283, ~: 367330)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 24.49s (23.86s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 6 tests for test/foundry/UniswapV2BasePoolMathRounding.sol:UniswapV2BasePoolMathRoundingTest
[@bush.fi/v3-pool-weighted]: [PASS] testComputeAddLiquiditySingleTokenExactOut__Fuzz(uint256,uint256,uint256,uint64) (runs: 10000, μ: 52088, ~: 52088)
[@bush.fi/v3-pool-weighted]: [PASS] testComputeAddLiquidityUnbalanced__Fuzz(uint256[2],uint256[2],uint64) (runs: 10000, μ: 78116, ~: 77785)
[@bush.fi/v3-pool-weighted]: [PASS] testComputeProportionalAmountsIn__Fuzz(uint256[2],uint256) (runs: 10000, μ: 31893, ~: 32030)
[@bush.fi/v3-pool-weighted]: [PASS] testComputeProportionalAmountsOut__Fuzz(uint256[2],uint256) (runs: 10000, μ: 31691, ~: 31830)
[@bush.fi/v3-pool-weighted]: [PASS] testComputeRemoveLiquiditySingleTokenExactIn__Fuzz(uint256,uint256,uint256,uint64) (runs: 10000, μ: 51414, ~: 51400)
[@bush.fi/v3-pool-weighted]: [PASS] testComputeRemoveLiquiditySingleTokenExactOut__Fuzz(uint256,uint256,uint256,uint64) (runs: 10000, μ: 72218, ~: 72217)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 6 passed; 0 failed; 0 skipped; finished in 37.59s (37.59s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 6 tests for test/foundry/Weighted5050BasePoolMathRounding.sol:Weighted5050BasePoolMathRounding
[@bush.fi/v3-pool-weighted]: [PASS] testComputeAddLiquiditySingleTokenExactOut__Fuzz(uint256,uint256,uint256,uint64) (runs: 10000, μ: 58955, ~: 58996)
[@bush.fi/v3-pool-weighted]: [PASS] testComputeAddLiquidityUnbalanced__Fuzz(uint256[2],uint256[2],uint64) (runs: 10000, μ: 135627, ~: 135557)
[@bush.fi/v3-pool-weighted]: [PASS] testComputeProportionalAmountsIn__Fuzz(uint256[2],uint256) (runs: 10000, μ: 43595, ~: 43779)
[@bush.fi/v3-pool-weighted]: [PASS] testComputeProportionalAmountsOut__Fuzz(uint256[2],uint256) (runs: 10000, μ: 43570, ~: 43747)
[@bush.fi/v3-pool-weighted]: [PASS] testComputeRemoveLiquiditySingleTokenExactIn__Fuzz(uint256,uint256,uint256,uint64) (runs: 10000, μ: 58706, ~: 58794)
[@bush.fi/v3-pool-weighted]: [PASS] testComputeRemoveLiquiditySingleTokenExactOut__Fuzz(uint256,uint256,uint256,uint64) (runs: 10000, μ: 129398, ~: 129902)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 6 passed; 0 failed; 0 skipped; finished in 52.47s (52.43s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 1 test for test/foundry/FungibilityWeighted.t.sol:FungibilityWeightedTest
[@bush.fi/v3-pool-weighted]: [PASS] testFungibilityAddUnbalanced__Fuzz(uint256) (runs: 10000, μ: 384145, ~: 383821)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 30.32s (30.05s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 6 tests for test/foundry/Weighted8020BasePoolMathRounding.sol:Weighted8020BasePoolMathRounding
[@bush.fi/v3-pool-weighted]: [PASS] testComputeAddLiquiditySingleTokenExactOut__Fuzz(uint256,uint256,uint256,uint64) (runs: 10000, μ: 65098, ~: 65360)
[@bush.fi/v3-pool-weighted]: [PASS] testComputeAddLiquidityUnbalanced__Fuzz(uint256[2],uint256[2],uint64) (runs: 10000, μ: 134975, ~: 134965)
[@bush.fi/v3-pool-weighted]: [PASS] testComputeProportionalAmountsIn__Fuzz(uint256[2],uint256) (runs: 10000, μ: 43558, ~: 43736)
[@bush.fi/v3-pool-weighted]: [PASS] testComputeProportionalAmountsOut__Fuzz(uint256[2],uint256) (runs: 10000, μ: 43525, ~: 43704)
[@bush.fi/v3-pool-weighted]: [PASS] testComputeRemoveLiquiditySingleTokenExactIn__Fuzz(uint256,uint256,uint256,uint64) (runs: 10000, μ: 64773, ~: 65241)
[@bush.fi/v3-pool-weighted]: [PASS] testComputeRemoveLiquiditySingleTokenExactOut__Fuzz(uint256,uint256,uint256,uint64) (runs: 10000, μ: 128982, ~: 129472)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 6 passed; 0 failed; 0 skipped; finished in 54.83s (54.78s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 2 tests for test/foundry/WeightedPoolLimits.t.sol:WeightedPoolLimitsTest
[@bush.fi/v3-pool-weighted]: [PASS] testInitialize__Fuzz(uint256,uint256) (runs: 10000, μ: 472460, ~: 472560)
[@bush.fi/v3-pool-weighted]: [PASS] testWeightLimits__Fuzz(uint256,uint256) (runs: 10000, μ: 1417379, ~: 1417188)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 2 passed; 0 failed; 0 skipped; finished in 123.98s (123.60s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 9 tests for test/foundry/LBPMigrationRouter.t.sol:LBPMigrationRouterTest
[@bush.fi/v3-pool-weighted]: [PASS] testConstructorWithIncorrectWeightedPoolFactory() (gas: 104261)
[@bush.fi/v3-pool-weighted]: [PASS] testLockAmount() (gas: 669586)
[@bush.fi/v3-pool-weighted]: [PASS] testMigrateLiquidityRevertsIfSenderIsNotPoolOwner() (gas: 66621)
[@bush.fi/v3-pool-weighted]: [PASS] testMigrateLiquidityWithSpecificParameters() (gas: 8593962)
[@bush.fi/v3-pool-weighted]: [PASS] testMigrateLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 12560778, ~: 12561232)
[@bush.fi/v3-pool-weighted]: [PASS] testMigrationLiquidityRevertsIfMigrationNotSetup() (gas: 66367)
[@bush.fi/v3-pool-weighted]: [PASS] testUnlockAmount() (gas: 682214)
[@bush.fi/v3-pool-weighted]: [PASS] testUnlockAmountRevertsIfAmountIsZero() (gas: 10913)
[@bush.fi/v3-pool-weighted]: [PASS] testUnlockAmountRevertsIfUnlockTimestampNotReached() (gas: 659779)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 9 passed; 0 failed; 0 skipped; finished in 152.23s (151.58s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 5 tests for test/foundry/E2eBatchSwap.t.sol:E2eBatchSwapWeightedTest
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactIn__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 1014278, ~: 1014414)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOut__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 1036305, ~: 1036400)
[@bush.fi/v3-pool-weighted]: [PASS] testExactInRepeatEachOperation__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 796190, ~: 796329)
[@bush.fi/v3-pool-weighted]: [PASS] testExactInRepeatExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 739274, ~: 739345)
[@bush.fi/v3-pool-weighted]: [PASS] testExactOutRepeatEachOperation__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 798703, ~: 798846)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 5 passed; 0 failed; 0 skipped; finished in 314.49s (313.84s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 23 tests for ../../node_modules/@bush.fi/v3-vault/test/foundry/E2eSwapRateProvider.t.sol:E2eSwapRateProviderTest
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 631537, ~: 633099)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 659916, ~: 661103)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 628438, ~: 630091)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 619524, ~: 621237)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 541105, ~: 541150)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 528253, ~: 528299)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 576065, ~: 576121)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 540926, ~: 541037)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 528055, ~: 528165)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInSwapRateComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 714336, ~: 714694)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInSwapRate__Fuzz(uint256,uint256) (runs: 10000, μ: 614872, ~: 614975)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 719608, ~: 721209)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 748078, ~: 749500)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 716462, ~: 718194)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 707581, ~: 709307)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 629147, ~: 629188)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 616262, ~: 616306)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 664161, ~: 664214)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 628986, ~: 629097)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 616080, ~: 616193)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutSwapRateComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 802529, ~: 802896)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutSwapRate__Fuzz(uint256,uint256) (runs: 10000, μ: 702970, ~: 703069)
[@bush.fi/v3-pool-weighted]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 380549, ~: 380704)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 23 passed; 0 failed; 0 skipped; finished in 665.12s (1264.25s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 19 tests for /Users/jeff/bush-v3-monorepo/node_modules/@bush.fi/v3-vault/test/foundry/E2eSwap.t.sol:E2eSwapTest
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 607822, ~: 609291)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 632029, ~: 633394)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 604741, ~: 606598)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 595826, ~: 597745)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 525958, ~: 526000)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 513060, ~: 513103)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 554666, ~: 554719)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 525779, ~: 525887)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 512856, ~: 512969)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 695986, ~: 697420)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 720107, ~: 721463)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 692792, ~: 694676)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 683805, ~: 685768)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 613996, ~: 614038)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 601090, ~: 601134)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 642710, ~: 642765)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 613815, ~: 613925)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 600906, ~: 601020)
[@bush.fi/v3-pool-weighted]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 359438, ~: 359590)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 19 passed; 0 failed; 0 skipped; finished in 817.09s (1031.72s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 20 tests for test/foundry/E2eSwap.t.sol:E2eSwapWeightedTest
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 671171, ~: 672555)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 649833, ~: 651610)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 668107, ~: 669380)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 613798, ~: 615766)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 606993, ~: 608418)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 535156, ~: 535293)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 573709, ~: 573780)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 604009, ~: 605377)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 532329, ~: 532359)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 765271, ~: 766605)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 744056, ~: 745770)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 762072, ~: 763333)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 708060, ~: 709960)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 700907, ~: 702379)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 629354, ~: 629495)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 667903, ~: 668018)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 697939, ~: 699327)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 626617, ~: 626581)
[@bush.fi/v3-pool-weighted]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 415064, ~: 417509)
[@bush.fi/v3-pool-weighted]: [PASS] testSwapSymmetry__Fuzz(uint256,uint256,uint256) (runs: 10000, μ: 398170, ~: 398466)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 20 passed; 0 failed; 0 skipped; finished in 329.58s (1150.17s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 19 tests for ../../node_modules/@bush.fi/v3-vault/test/foundry/E2eSwap.t.sol:E2eSwapTest
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 607767, ~: 609291)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 631997, ~: 633394)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 604723, ~: 606598)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 595834, ~: 597745)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 525958, ~: 526000)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 513060, ~: 513103)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 554664, ~: 554719)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 525776, ~: 525887)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 512860, ~: 512969)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 695892, ~: 697420)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 720091, ~: 721463)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 692744, ~: 694676)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 683922, ~: 685768)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 613996, ~: 614038)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 601093, ~: 601134)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 642710, ~: 642765)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 613814, ~: 613925)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 600906, ~: 601020)
[@bush.fi/v3-pool-weighted]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 359432, ~: 359590)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 19 passed; 0 failed; 0 skipped; finished in 686.08s (1081.32s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 5 tests for ../../node_modules/@bush.fi/v3-vault/test/foundry/E2eBatchSwap.t.sol:E2eBatchSwapTest
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactIn__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 973615, ~: 973860)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOut__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 995184, ~: 995420)
[@bush.fi/v3-pool-weighted]: [PASS] testExactInRepeatEachOperation__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 796108, ~: 796341)
[@bush.fi/v3-pool-weighted]: [PASS] testExactInRepeatExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 738964, ~: 739118)
[@bush.fi/v3-pool-weighted]: [PASS] testExactOutRepeatEachOperation__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 798148, ~: 798384)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 5 passed; 0 failed; 0 skipped; finished in 816.44s (289.78s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 30 tests for test/foundry/LiquidityApproximationWeighted.t.sol:LiquidityApproximationWeightedTest
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactInNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 533650, ~: 533877)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactInNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 467104, ~: 467165)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactInSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 548009, ~: 548249)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactInWeightsSmallAmounts__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 363039, ~: 364193)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactIn__Fuzz(uint256,uint256) (runs: 10000, μ: 481341, ~: 481517)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 640453, ~: 640441)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 576536, ~: 576634)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 654790, ~: 654811)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactOutWeightsSmallAmounts__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 390356, ~: 390459)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 590871, ~: 591005)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquiditySingleTokenExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 525031, ~: 525259)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquiditySingleTokenExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 458874, ~: 458936)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquiditySingleTokenExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 539316, ~: 539508)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquiditySingleTokenExactOutWeightsSmallAmounts__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 502885, ~: 506609)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquiditySingleTokenExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 472336, ~: 472891)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityUnbalancedNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 534158, ~: 534104)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityUnbalancedNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 472142, ~: 472222)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityUnbalancedSmallAmountsSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 390228, ~: 390331)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityUnbalancedSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 548324, ~: 548304)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityUnbalanced__Fuzz(uint256,uint256) (runs: 10000, μ: 484344, ~: 484427)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactInNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 607537, ~: 607788)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactInNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 536856, ~: 536918)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactInSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 621881, ~: 622148)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactInWeightsSmallAmounts__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 372628, ~: 372699)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactIn__Fuzz(uint256,uint256) (runs: 10000, μ: 551214, ~: 551313)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 634002, ~: 634035)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 567992, ~: 568054)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 648361, ~: 648407)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactOutWeightsSmallAmounts__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 626008, ~: 627483)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 582346, ~: 582449)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 30 passed; 0 failed; 0 skipped; finished in 762.29s (1461.67s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 23 tests for test/foundry/E2ESwapRateProvider.t.sol:E2eSwapRateProviderWeightedTest
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 645069, ~: 646846)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 672978, ~: 674495)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 641808, ~: 643447)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 632915, ~: 634593)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 554470, ~: 554506)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 541615, ~: 541655)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 589063, ~: 589135)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 554313, ~: 554393)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 541441, ~: 541521)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInSwapRateComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 727421, ~: 727927)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactInSwapRate__Fuzz(uint256,uint256) (runs: 10000, μ: 628233, ~: 628331)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 738876, ~: 740588)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 766755, ~: 768205)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 735578, ~: 737211)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 726632, ~: 728324)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 648168, ~: 648205)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 635284, ~: 635323)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 682731, ~: 682845)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 648074, ~: 648114)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 635168, ~: 635210)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutSwapRateComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 821200, ~: 821678)
[@bush.fi/v3-pool-weighted]: [PASS] testDoUndoExactOutSwapRate__Fuzz(uint256,uint256) (runs: 10000, μ: 721985, ~: 722086)
[@bush.fi/v3-pool-weighted]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 380658, ~: 380779)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 23 passed; 0 failed; 0 skipped; finished in 817.10s (1285.01s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 24 tests for ../../node_modules/@bush.fi/v3-vault/test/foundry/LiquidityApproximation.t.sol:LiquidityApproximationTest
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactInNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 435429, ~: 435483)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactInNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 434818, ~: 434873)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactInSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 449060, ~: 454771)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactIn__Fuzz(uint256,uint256) (runs: 10000, μ: 448638, ~: 454211)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 526710, ~: 526770)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 526143, ~: 526204)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 540516, ~: 546061)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityProportionalAndRemoveExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 539895, ~: 545496)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquiditySingleTokenExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 429233, ~: 429290)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquiditySingleTokenExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 428643, ~: 428702)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquiditySingleTokenExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 442828, ~: 448538)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquiditySingleTokenExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 442346, ~: 447976)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityUnbalancedNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 432172, ~: 432229)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityUnbalancedNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 431558, ~: 431618)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityUnbalancedSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 444740, ~: 449326)
[@bush.fi/v3-pool-weighted]: [PASS] testAddLiquidityUnbalanced__Fuzz(uint256,uint256) (runs: 10000, μ: 444245, ~: 448763)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactInNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 520469, ~: 520528)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactInNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 519838, ~: 519898)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactInSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 534244, ~: 539776)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactIn__Fuzz(uint256,uint256) (runs: 10000, μ: 533655, ~: 539236)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 531218, ~: 531279)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 530642, ~: 530700)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 545036, ~: 550568)
[@bush.fi/v3-pool-weighted]: [PASS] testRemoveLiquiditySingleTokenExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 544333, ~: 549993)
[@bush.fi/v3-pool-weighted]: Suite result: ok. 24 passed; 0 failed; 0 skipped; finished in 816.38s (1082.84s CPU time)
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Ran 24 test suites in 818.57s (6509.84s CPU time): 306 tests passed, 0 failed, 0 skipped (306 total tests)
[@bush.fi/v3-pool-weighted]: Solidity 0.8.26, 0.8.27 are not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Learn more at https://hardhat.org/hardhat-runner/docs/reference/solidity-support
[@bush.fi/v3-pool-weighted]: 
[@bush.fi/v3-pool-weighted]: Process exited (exit code 0), completed in 15m 28s
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]:   StablePool
[@bush.fi/v3-pool-stable]:     ✔ 2 token pool was deployed correctly (67ms)
[@bush.fi/v3-pool-stable]:     ✔ should have correct versions (56ms)
[@bush.fi/v3-pool-stable]:     ✔ 3 token pool was deployed correctly (75ms)
[@bush.fi/v3-pool-stable]:     ✔ should have correct versions (78ms)
[@bush.fi/v3-pool-stable]:     ✔ 4 token pool was deployed correctly (61ms)
[@bush.fi/v3-pool-stable]:     ✔ should have correct versions (63ms)
[@bush.fi/v3-pool-stable]:     ✔ 5 token pool was deployed correctly (51ms)
[@bush.fi/v3-pool-stable]:     ✔ should have correct versions (60ms)
[@bush.fi/v3-pool-stable]:     initialization with 2 tokens
[@bush.fi/v3-pool-stable]:       uninitialized
[@bush.fi/v3-pool-stable]:         ✔ is registered, but not initialized on deployment (60ms)
[@bush.fi/v3-pool-stable]:       initialized
[@bush.fi/v3-pool-stable]:         ✔ is registered and initialized
[@bush.fi/v3-pool-stable]:         ✔ has the correct pool tokens and balances
[@bush.fi/v3-pool-stable]:         ✔ cannot be initialized twice
[@bush.fi/v3-pool-stable]:         ✔ is registered in the factory
[@bush.fi/v3-pool-stable]:     initialization with 3 tokens
[@bush.fi/v3-pool-stable]:       uninitialized
[@bush.fi/v3-pool-stable]:         ✔ is registered, but not initialized on deployment (64ms)
[@bush.fi/v3-pool-stable]:       initialized
[@bush.fi/v3-pool-stable]:         ✔ is registered and initialized
[@bush.fi/v3-pool-stable]:         ✔ has the correct pool tokens and balances
[@bush.fi/v3-pool-stable]:         ✔ cannot be initialized twice
[@bush.fi/v3-pool-stable]:         ✔ is registered in the factory
[@bush.fi/v3-pool-stable]:     initialization with 4 tokens
[@bush.fi/v3-pool-stable]:       uninitialized
[@bush.fi/v3-pool-stable]:         ✔ is registered, but not initialized on deployment (47ms)
[@bush.fi/v3-pool-stable]:       initialized
[@bush.fi/v3-pool-stable]:         ✔ is registered and initialized
[@bush.fi/v3-pool-stable]:         ✔ has the correct pool tokens and balances
[@bush.fi/v3-pool-stable]:         ✔ cannot be initialized twice
[@bush.fi/v3-pool-stable]:         ✔ is registered in the factory
[@bush.fi/v3-pool-stable]:     initialization with 5 tokens
[@bush.fi/v3-pool-stable]:       uninitialized
[@bush.fi/v3-pool-stable]:         ✔ is registered, but not initialized on deployment (51ms)
[@bush.fi/v3-pool-stable]:       initialized
[@bush.fi/v3-pool-stable]:         ✔ is registered and initialized
[@bush.fi/v3-pool-stable]:         ✔ has the correct pool tokens and balances
[@bush.fi/v3-pool-stable]:         ✔ cannot be initialized twice
[@bush.fi/v3-pool-stable]:         ✔ is registered in the factory
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]:   StablePoolAmplification
[@bush.fi/v3-pool-stable]:     constructor
[@bush.fi/v3-pool-stable]:       when passing a valid initial amplification parameter value
[@bush.fi/v3-pool-stable]:         ✔ sets the expected amplification parameter
[@bush.fi/v3-pool-stable]:       when passing an initial amplification parameter less than MIN_AMP
[@bush.fi/v3-pool-stable]:         ✔ reverts
[@bush.fi/v3-pool-stable]:       when passing an initial amplification parameter greater than MAX_AMP
[@bush.fi/v3-pool-stable]:         ✔ reverts
[@bush.fi/v3-pool-stable]:     startAmplificationParameterUpdate
[@bush.fi/v3-pool-stable]:       with permission
[@bush.fi/v3-pool-stable]:         when the sender is allowed
[@bush.fi/v3-pool-stable]:           when requesting a reasonable change duration
[@bush.fi/v3-pool-stable]:             when requesting a valid amp
[@bush.fi/v3-pool-stable]:               when increasing the amp
[@bush.fi/v3-pool-stable]:                 when increasing the amp by 2x
[@bush.fi/v3-pool-stable]:                   when there is no ongoing update
[@bush.fi/v3-pool-stable]:                     ✔ starts changing the amp
[@bush.fi/v3-pool-stable]:                     ✔ stops updating after duration
[@bush.fi/v3-pool-stable]:                     ✔ emits an AmpUpdateStarted event
[@bush.fi/v3-pool-stable]:                     ✔ does not emit an AmpUpdateStopped event
[@bush.fi/v3-pool-stable]:                   when there is an ongoing update
[@bush.fi/v3-pool-stable]:                     ✔ trying to start another update reverts
[@bush.fi/v3-pool-stable]:                     after the ongoing update is stopped
[@bush.fi/v3-pool-stable]:                       ✔ the new update can be started
[@bush.fi/v3-pool-stable]:               when decreasing the amp
[@bush.fi/v3-pool-stable]:                 when decreasing the amp by 2x
[@bush.fi/v3-pool-stable]:                   when there is no ongoing update
[@bush.fi/v3-pool-stable]:                     ✔ starts changing the amp
[@bush.fi/v3-pool-stable]:                     ✔ stops updating after duration
[@bush.fi/v3-pool-stable]:                     ✔ emits an AmpUpdateStarted event
[@bush.fi/v3-pool-stable]:                     ✔ does not emit an AmpUpdateStopped event
[@bush.fi/v3-pool-stable]:                   when there is an ongoing update
[@bush.fi/v3-pool-stable]:                     ✔ trying to start another update reverts
[@bush.fi/v3-pool-stable]:                     after the ongoing update is stopped
[@bush.fi/v3-pool-stable]:                       ✔ the new update can be started
[@bush.fi/v3-pool-stable]:             when requesting an invalid amp
[@bush.fi/v3-pool-stable]:               ✔ reverts when requesting below the min
[@bush.fi/v3-pool-stable]:               ✔ reverts when requesting above the max
[@bush.fi/v3-pool-stable]:               rate limits
[@bush.fi/v3-pool-stable]:                 ✔ reverts when increasing the amp by more than 2x in a single day
[@bush.fi/v3-pool-stable]:                 ✔ reverts when increasing the amp by more than 2x daily over multiple days
[@bush.fi/v3-pool-stable]:                 ✔ reverts when decreasing the amp by more than 2x in a single day
[@bush.fi/v3-pool-stable]:                 ✔ reverts when decreasing the amp by more than 2x daily over multiple days
[@bush.fi/v3-pool-stable]:           when requesting a short duration change
[@bush.fi/v3-pool-stable]:             ✔ reverts
[@bush.fi/v3-pool-stable]:         when the sender is not allowed
[@bush.fi/v3-pool-stable]:           ✔ reverts
[@bush.fi/v3-pool-stable]:     stopAmplificationParameterUpdate
[@bush.fi/v3-pool-stable]:       with permission
[@bush.fi/v3-pool-stable]:         when the sender is allowed
[@bush.fi/v3-pool-stable]:           when there is an ongoing update
[@bush.fi/v3-pool-stable]:             ✔ stops the amp factor from updating
[@bush.fi/v3-pool-stable]:             ✔ emits an AmpUpdateStopped event
[@bush.fi/v3-pool-stable]:             ✔ does not emit an AmpUpdateStarted event
[@bush.fi/v3-pool-stable]:           when there is no ongoing update
[@bush.fi/v3-pool-stable]:             ✔ reverts
[@bush.fi/v3-pool-stable]:         when the sender is not allowed
[@bush.fi/v3-pool-stable]:           ✔ reverts
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]:   StablePool Gas Benchmark
[@bush.fi/v3-pool-stable]:     initialization
[@bush.fi/v3-pool-stable]:       does not use ETH
[@bush.fi/v3-pool-stable]:         ✔ measures initialization gas without ETH (Standard)
[@bush.fi/v3-pool-stable]:       use ETH
[@bush.fi/v3-pool-stable]:         ✔ measures initialization gas with ETH (Standard)
[@bush.fi/v3-pool-stable]:     test donation
[@bush.fi/v3-pool-stable]:       ✔ pool preconditions (Standard)
[@bush.fi/v3-pool-stable]:       ✔ measures gas (Standard)
[@bush.fi/v3-pool-stable]:     test standard pool
[@bush.fi/v3-pool-stable]:       swap
[@bush.fi/v3-pool-stable]:         ✔ pool and protocol fee preconditions (undefined)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (Router) (undefined)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (BatchRouter) (undefined) (40ms)
[@bush.fi/v3-pool-stable]:       remove liquidity
[@bush.fi/v3-pool-stable]:         ✔ pool and protocol fee preconditions (Standard)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (proportional) (Standard)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (single token exact in) (Standard) (51ms)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (single token exact in - BatchRouter) (Standard) (73ms)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (single token exact out) (Standard) (50ms)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (single token exact out - BatchRouter) (Standard) (61ms)
[@bush.fi/v3-pool-stable]:       add liquidity
[@bush.fi/v3-pool-stable]:         ✔ pool and protocol fee preconditions (Standard)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (proportional)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (unbalanced) (Standard) (68ms)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (unbalanced - BatchRouter) (Standard) (68ms)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (single token exact out) (Standard) (56ms)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (single token exact out - BatchRouter) (Standard) (64ms)
[@bush.fi/v3-pool-stable]:     test yield pool
[@bush.fi/v3-pool-stable]:       swap
[@bush.fi/v3-pool-stable]:         ✔ pool and protocol fee preconditions (undefined)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (Router) (undefined) (44ms)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (BatchRouter) (undefined) (53ms)
[@bush.fi/v3-pool-stable]:       remove liquidity
[@bush.fi/v3-pool-stable]:         ✔ pool and protocol fee preconditions (WithRate)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (proportional) (WithRate)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (single token exact in) (WithRate) (64ms)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (single token exact in - BatchRouter) (WithRate) (57ms)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (single token exact out) (WithRate) (56ms)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (single token exact out - BatchRouter) (WithRate) (105ms)
[@bush.fi/v3-pool-stable]:       add liquidity
[@bush.fi/v3-pool-stable]:         ✔ pool and protocol fee preconditions (WithRate)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (proportional)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (unbalanced) (WithRate) (70ms)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (unbalanced - BatchRouter) (WithRate) (73ms)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (single token exact out) (WithRate) (76ms)
[@bush.fi/v3-pool-stable]:         ✔ measures gas (single token exact out - BatchRouter) (WithRate) (66ms)
[@bush.fi/v3-pool-stable]:     test ERC4626 pool
[@bush.fi/v3-pool-stable]:       ✔ measures gas (buffers without liquidity exact in - BatchRouter) (77ms)
[@bush.fi/v3-pool-stable]:       ✔ measures gas (buffers without liquidity exact out - BatchRouter) (85ms)
[@bush.fi/v3-pool-stable]:       ✔ measures gas (buffers with liquidity exact in - BatchRouter) (82ms)
[@bush.fi/v3-pool-stable]:       ✔ measures gas (buffers with liquidity exact out - BatchRouter) (86ms)
[@bush.fi/v3-pool-stable]:     test nested pool
[@bush.fi/v3-pool-stable]:       ✔ measures gas (swap exact in) (119ms)
[@bush.fi/v3-pool-stable]:       ✔ measures gas (swap exact in - reverse) (62ms)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]:   96 passing (7s)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Nothing to compile
[@bush.fi/v3-pool-stable]: No need to generate any newer typings.
[@bush.fi/v3-pool-stable]: Compiling 9 files with Solc 0.8.26
[@bush.fi/v3-pool-stable]: Solc 0.8.26 finished in 37.46s
[@bush.fi/v3-pool-stable]: Compiler run successful!
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 4 tests for test/foundry/StablePoolFactory.t.sol:StablePoolFactoryTest
[@bush.fi/v3-pool-stable]: [PASS] testCreatePoolWithDonation() (gas: 3825425)
[@bush.fi/v3-pool-stable]: [PASS] testCreatePoolWithTooManyTokens() (gas: 3183812)
[@bush.fi/v3-pool-stable]: [PASS] testCreatePoolWithoutDonation() (gas: 3707752)
[@bush.fi/v3-pool-stable]: [PASS] testFactoryPausedState() (gas: 8540)
[@bush.fi/v3-pool-stable]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 201.63ms (5.46ms CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 1 test for test/foundry/ActionIds.t.sol:ActionIdsTest
[@bush.fi/v3-pool-stable]: [PASS] testActionIds() (gas: 11621569)
[@bush.fi/v3-pool-stable]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 206.27ms (1.13ms CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 17 tests for test/foundry/StablePool.t.sol:StablePoolTest
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidity() (gas: 285212)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityUnbalanced() (gas: 290641)
[@bush.fi/v3-pool-stable]: [PASS] testAmplificationUpdateByGovernance() (gas: 141284)
[@bush.fi/v3-pool-stable]: [PASS] testAmplificationUpdateBySwapFeeManager() (gas: 121897)
[@bush.fi/v3-pool-stable]: [PASS] testGetAmplificationState() (gas: 55762)
[@bush.fi/v3-pool-stable]: [PASS] testGetBptRate() (gas: 250745)
[@bush.fi/v3-pool-stable]: [PASS] testGetStablePoolDynamicData() (gas: 150372)
[@bush.fi/v3-pool-stable]: [PASS] testGetStablePoolImmutableData() (gas: 71880)
[@bush.fi/v3-pool-stable]: [PASS] testInitialize() (gas: 102486)
[@bush.fi/v3-pool-stable]: [PASS] testMaximumSwapFee() (gas: 11042)
[@bush.fi/v3-pool-stable]: [PASS] testMinimumSwapFee() (gas: 11417)
[@bush.fi/v3-pool-stable]: [PASS] testPoolAddress() (gas: 53400)
[@bush.fi/v3-pool-stable]: [PASS] testPoolPausedState() (gas: 23690)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquidity() (gas: 378966)
[@bush.fi/v3-pool-stable]: [PASS] testSetSwapFeeTooHigh() (gas: 44740)
[@bush.fi/v3-pool-stable]: [PASS] testSetSwapFeeTooLow() (gas: 43580)
[@bush.fi/v3-pool-stable]: [PASS] testSwap() (gas: 209427)
[@bush.fi/v3-pool-stable]: Suite result: ok. 17 passed; 0 failed; 0 skipped; finished in 205.80ms (8.16ms CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 13 tests for test/foundry/RoundingDirectionEdgeCases.t.sol:RoundingDirectionStablePoolEdgeCasesTest
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidity() (gas: 290468)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityUnbalanced() (gas: 298530)
[@bush.fi/v3-pool-stable]: [PASS] testInitialize() (gas: 102502)
[@bush.fi/v3-pool-stable]: [PASS] testMaximumSwapFee() (gas: 11042)
[@bush.fi/v3-pool-stable]: [PASS] testMinimumSwapFee() (gas: 11417)
[@bush.fi/v3-pool-stable]: [PASS] testMockPoolBalanceWithEdgeCase() (gas: 366560)
[@bush.fi/v3-pool-stable]: [PASS] testMockPoolBalanceWithEdgeCaseAddUnbalanced() (gas: 283707)
[@bush.fi/v3-pool-stable]: [PASS] testPoolAddress() (gas: 53400)
[@bush.fi/v3-pool-stable]: [PASS] testPoolPausedState() (gas: 23712)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquidity() (gas: 384920)
[@bush.fi/v3-pool-stable]: [PASS] testSetSwapFeeTooHigh() (gas: 85455)
[@bush.fi/v3-pool-stable]: [PASS] testSetSwapFeeTooLow() (gas: 84292)
[@bush.fi/v3-pool-stable]: [PASS] testSwap() (gas: 214684)
[@bush.fi/v3-pool-stable]: Suite result: ok. 13 passed; 0 failed; 0 skipped; finished in 46.39ms (5.08ms CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 1 test for test/foundry/FungibilityStable.t.sol:FungibilityStableTest
[@bush.fi/v3-pool-stable]: [PASS] testFungibilityAddUnbalanced__Fuzz(uint256) (runs: 10000, μ: 376569, ~: 376622)
[@bush.fi/v3-pool-stable]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 21.68s (21.64s CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 5 tests for ../../node_modules/@bush.fi/v3-vault/test/foundry/E2eBatchSwap.t.sol:E2eBatchSwapTest
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactIn__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 973626, ~: 973860)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOut__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 995180, ~: 995420)
[@bush.fi/v3-pool-stable]: [PASS] testExactInRepeatEachOperation__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 796104, ~: 796341)
[@bush.fi/v3-pool-stable]: [PASS] testExactInRepeatExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 738959, ~: 739118)
[@bush.fi/v3-pool-stable]: [PASS] testExactOutRepeatEachOperation__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 798144, ~: 798384)
[@bush.fi/v3-pool-stable]: Suite result: ok. 5 passed; 0 failed; 0 skipped; finished in 277.61s (277.41s CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 1 test for ../../node_modules/@bush.fi/v3-vault/test/foundry/Fungibility.t.sol:FungibilityTest
[@bush.fi/v3-pool-stable]: [PASS] testFungibilityAddUnbalanced__Fuzz(uint256) (runs: 10000, μ: 367280, ~: 367330)
[@bush.fi/v3-pool-stable]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 26.55s (26.30s CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 5 tests for test/foundry/E2eBatchSwap.t.sol:E2eBatchSwapStableTest
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactIn__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 1067833, ~: 1070671)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOut__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 1088899, ~: 1091345)
[@bush.fi/v3-pool-stable]: [PASS] testExactInRepeatEachOperation__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 859161, ~: 859737)
[@bush.fi/v3-pool-stable]: [PASS] testExactInRepeatExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 800800, ~: 800869)
[@bush.fi/v3-pool-stable]: [PASS] testExactOutRepeatEachOperation__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 858734, ~: 858488)
[@bush.fi/v3-pool-stable]: Suite result: ok. 5 passed; 0 failed; 0 skipped; finished in 428.35s (335.73s CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 9 tests for ../../node_modules/@bush.fi/v3-vault/test/foundry/E2eErc4626Swaps.t.sol:E2eErc4626SwapsTest
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 940623, ~: 966898)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 883717, ~: 883760)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 951994, ~: 961704)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 861160, ~: 881603)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 976788, ~: 1009554)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 926331, ~: 926373)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 993362, ~: 1004339)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 897375, ~: 924258)
[@bush.fi/v3-pool-stable]: [PASS] testERC4626BufferPreconditions() (gas: 192913)
[@bush.fi/v3-pool-stable]: Suite result: ok. 9 passed; 0 failed; 0 skipped; finished in 626.32s (722.34s CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 9 tests for test/foundry/E2eErc4626Swaps.t.sol:E2eErc4626SwapsStableTest
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 973891, ~: 996221)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 913036, ~: 913081)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 987719, ~: 994277)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 889682, ~: 910924)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 1012366, ~: 1038314)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 955088, ~: 955131)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 1029206, ~: 1036748)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 925585, ~: 953016)
[@bush.fi/v3-pool-stable]: [PASS] testERC4626BufferPreconditions() (gas: 193164)
[@bush.fi/v3-pool-stable]: Suite result: ok. 9 passed; 0 failed; 0 skipped; finished in 760.00s (759.80s CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 23 tests for ../../node_modules/@bush.fi/v3-vault/test/foundry/E2eSwapRateProvider.t.sol:E2eSwapRateProviderTest
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 631553, ~: 633099)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 659957, ~: 661103)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 628336, ~: 630091)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 619556, ~: 621237)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 541107, ~: 541150)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 528256, ~: 528299)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 576067, ~: 576121)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 540925, ~: 541037)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 528049, ~: 528165)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInSwapRateComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 714358, ~: 714694)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInSwapRate__Fuzz(uint256,uint256) (runs: 10000, μ: 614873, ~: 614975)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 719713, ~: 721209)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 748087, ~: 749409)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 716448, ~: 718194)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 707636, ~: 709307)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 629144, ~: 629188)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 616264, ~: 616306)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 664162, ~: 664214)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 628986, ~: 629097)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 616078, ~: 616193)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutSwapRateComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 802544, ~: 802896)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutSwapRate__Fuzz(uint256,uint256) (runs: 10000, μ: 702967, ~: 703069)
[@bush.fi/v3-pool-stable]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 380549, ~: 380704)
[@bush.fi/v3-pool-stable]: Suite result: ok. 23 passed; 0 failed; 0 skipped; finished in 840.75s (1307.39s CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 24 tests for test/foundry/LiquidityApproximationStable.t.sol:LiquidityApproximationStableTest
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityProportionalAndRemoveExactInNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 546015, ~: 546235)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityProportionalAndRemoveExactInNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 461454, ~: 461513)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityProportionalAndRemoveExactInSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 560362, ~: 560341)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityProportionalAndRemoveExactIn__Fuzz(uint256,uint256) (runs: 10000, μ: 475811, ~: 475909)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityProportionalAndRemoveExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 642597, ~: 643048)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityProportionalAndRemoveExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 558038, ~: 558338)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityProportionalAndRemoveExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 656929, ~: 657307)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityProportionalAndRemoveExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 572373, ~: 572710)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquiditySingleTokenExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 539790, ~: 540026)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquiditySingleTokenExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 455246, ~: 455303)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquiditySingleTokenExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 554090, ~: 554069)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquiditySingleTokenExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 469538, ~: 469635)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityUnbalancedNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 548176, ~: 548492)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityUnbalancedNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 465794, ~: 466860)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityUnbalancedSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 560334, ~: 560580)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityUnbalanced__Fuzz(uint256,uint256) (runs: 10000, μ: 477958, ~: 479041)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquiditySingleTokenExactInNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 630981, ~: 631214)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquiditySingleTokenExactInNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 546497, ~: 546554)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquiditySingleTokenExactInSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 645268, ~: 645256)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquiditySingleTokenExactIn__Fuzz(uint256,uint256) (runs: 10000, μ: 560849, ~: 560950)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquiditySingleTokenExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 647053, ~: 647542)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquiditySingleTokenExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 562516, ~: 562820)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquiditySingleTokenExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 661403, ~: 661820)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquiditySingleTokenExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 576834, ~: 577171)
[@bush.fi/v3-pool-stable]: Suite result: ok. 24 passed; 0 failed; 0 skipped; finished in 860.50s (1223.98s CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 19 tests for test/foundry/E2eSwap.t.sol:E2eSwapStableTest
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 684566, ~: 686440)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 672134, ~: 672689)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 682263, ~: 683888)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 629067, ~: 630955)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 604864, ~: 605165)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 547850, ~: 547993)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 594367, ~: 594925)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 602241, ~: 603019)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 544488, ~: 545667)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 777268, ~: 779647)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 766291, ~: 766476)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 775209, ~: 776623)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 723285, ~: 725243)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 697683, ~: 697325)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 641831, ~: 641686)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 688692, ~: 690331)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 695022, ~: 696157)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 638063, ~: 640473)
[@bush.fi/v3-pool-stable]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 424671, ~: 424608)
[@bush.fi/v3-pool-stable]: Suite result: ok. 19 passed; 0 failed; 0 skipped; finished in 860.50s (1093.43s CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 24 tests for ../../node_modules/@bush.fi/v3-vault/test/foundry/LiquidityApproximation.t.sol:LiquidityApproximationTest
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityProportionalAndRemoveExactInNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 435426, ~: 435483)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityProportionalAndRemoveExactInNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 434813, ~: 434873)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityProportionalAndRemoveExactInSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 449247, ~: 454771)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityProportionalAndRemoveExactIn__Fuzz(uint256,uint256) (runs: 10000, μ: 448526, ~: 454211)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityProportionalAndRemoveExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 526710, ~: 526770)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityProportionalAndRemoveExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 526144, ~: 526204)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityProportionalAndRemoveExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 540435, ~: 546061)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityProportionalAndRemoveExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 539901, ~: 545496)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquiditySingleTokenExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 429233, ~: 429290)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquiditySingleTokenExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 428641, ~: 428702)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquiditySingleTokenExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 442902, ~: 448538)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquiditySingleTokenExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 442416, ~: 447976)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityUnbalancedNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 432167, ~: 432229)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityUnbalancedNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 431558, ~: 431618)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityUnbalancedSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 444640, ~: 449326)
[@bush.fi/v3-pool-stable]: [PASS] testAddLiquidityUnbalanced__Fuzz(uint256,uint256) (runs: 10000, μ: 444201, ~: 448763)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquiditySingleTokenExactInNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 520467, ~: 520528)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquiditySingleTokenExactInNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 519838, ~: 519898)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquiditySingleTokenExactInSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 534198, ~: 539776)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquiditySingleTokenExactIn__Fuzz(uint256,uint256) (runs: 10000, μ: 533619, ~: 539236)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquiditySingleTokenExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 531215, ~: 531279)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquiditySingleTokenExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 530640, ~: 530700)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquiditySingleTokenExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 545057, ~: 550568)
[@bush.fi/v3-pool-stable]: [PASS] testRemoveLiquiditySingleTokenExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 544354, ~: 549993)
[@bush.fi/v3-pool-stable]: Suite result: ok. 24 passed; 0 failed; 0 skipped; finished in 842.76s (1053.57s CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 19 tests for /Users/jeff/bush-v3-monorepo/node_modules/@bush.fi/v3-vault/test/foundry/E2eSwap.t.sol:E2eSwapTest
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 607724, ~: 609291)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 632071, ~: 633394)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 604650, ~: 606598)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 595890, ~: 597745)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 525957, ~: 526000)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 513061, ~: 513103)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 554666, ~: 554719)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 525776, ~: 525887)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 512854, ~: 512969)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 695916, ~: 697421)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 720100, ~: 721463)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 692786, ~: 694676)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 683856, ~: 685768)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 613998, ~: 614038)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 601091, ~: 601134)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 642709, ~: 642765)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 613812, ~: 613925)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 600906, ~: 601020)
[@bush.fi/v3-pool-stable]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 359436, ~: 359590)
[@bush.fi/v3-pool-stable]: Suite result: ok. 19 passed; 0 failed; 0 skipped; finished in 864.64s (911.18s CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 23 tests for test/foundry/E2eSwapRateProvider.t.sol:E2eSwapRateProviderStableTest
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 663785, ~: 665774)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 700268, ~: 700726)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 661848, ~: 663301)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 653052, ~: 654447)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 575860, ~: 575997)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 563014, ~: 563166)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 615893, ~: 616329)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 572547, ~: 573690)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 559758, ~: 560884)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInSwapRateComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 755818, ~: 755594)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInSwapRate__Fuzz(uint256,uint256) (runs: 10000, μ: 648081, ~: 648185)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 757663, ~: 759450)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 794619, ~: 794213)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 756234, ~: 757647)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 747417, ~: 748805)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 669905, ~: 669763)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 657015, ~: 656881)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 709987, ~: 711737)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 666307, ~: 668572)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 653395, ~: 655711)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutSwapRateComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 850135, ~: 850982)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutSwapRate__Fuzz(uint256,uint256) (runs: 10000, μ: 742449, ~: 742544)
[@bush.fi/v3-pool-stable]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 401502, ~: 401424)
[@bush.fi/v3-pool-stable]: Suite result: ok. 23 passed; 0 failed; 0 skipped; finished in 864.64s (1346.78s CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 19 tests for ../../node_modules/@bush.fi/v3-vault/test/foundry/E2eSwap.t.sol:E2eSwapTest
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 607762, ~: 609291)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 631959, ~: 633394)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 604706, ~: 606598)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 595943, ~: 597745)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 525958, ~: 526000)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 513060, ~: 513103)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 554665, ~: 554719)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 525774, ~: 525887)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 512853, ~: 512969)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 696005, ~: 697420)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 720133, ~: 721463)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 692785, ~: 694676)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 683848, ~: 685768)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 613994, ~: 614038)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 601091, ~: 601134)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 642712, ~: 642765)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 613814, ~: 613925)
[@bush.fi/v3-pool-stable]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 600908, ~: 601020)
[@bush.fi/v3-pool-stable]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 359436, ~: 359590)
[@bush.fi/v3-pool-stable]: Suite result: ok. 19 passed; 0 failed; 0 skipped; finished in 864.44s (1028.38s CPU time)
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Ran 17 test suites in 865.01s (8139.41s CPU time): 216 tests passed, 0 failed, 0 skipped (216 total tests)
[@bush.fi/v3-pool-stable]: Solidity 0.8.26, 0.8.27 are not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Learn more at https://hardhat.org/hardhat-runner/docs/reference/solidity-support
[@bush.fi/v3-pool-stable]: 
[@bush.fi/v3-pool-stable]: Process exited (exit code 0), completed in 15m 44s
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]:   2-CLP
[@bush.fi/v3-pool-gyro]:     ✔ should have correct versions
[@bush.fi/v3-pool-gyro]:     ✔ pool and protocol fee preconditions
[@bush.fi/v3-pool-gyro]:     ✔ has the correct pool tokens and balances
[@bush.fi/v3-pool-gyro]:     ✔ cannot be initialized twice
[@bush.fi/v3-pool-gyro]:     ✔ returns immutable data
[@bush.fi/v3-pool-gyro]:     ✔ is registered in the factory
[@bush.fi/v3-pool-gyro]:     LM flags
[@bush.fi/v3-pool-gyro]:       ✔ allows donation
[@bush.fi/v3-pool-gyro]:       ✔ does not allow unbalanced liquidity
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]:   E-CLP
[@bush.fi/v3-pool-gyro]:     ✔ should have correct versions
[@bush.fi/v3-pool-gyro]:     ✔ pool and protocol fee preconditions
[@bush.fi/v3-pool-gyro]:     ✔ has the correct pool tokens and balances
[@bush.fi/v3-pool-gyro]:     ✔ cannot be initialized twice
[@bush.fi/v3-pool-gyro]:     ✔ returns immutable data
[@bush.fi/v3-pool-gyro]:     ✔ is registered in the factory
[@bush.fi/v3-pool-gyro]:     LM flags
[@bush.fi/v3-pool-gyro]:       ✔ allows donation
[@bush.fi/v3-pool-gyro]:       ✔ does not allow unbalanced liquidity
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]:   16 passing (3s)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Nothing to compile
[@bush.fi/v3-pool-gyro]: No need to generate any newer typings.
[@bush.fi/v3-pool-gyro]: Compiling 13 files with Solc 0.8.27
[@bush.fi/v3-pool-gyro]: Solc 0.8.27 finished in 48.02s
[@bush.fi/v3-pool-gyro]: Compiler run successful!
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 2 tests for test/foundry/DynamicAndImmutableDataECLP.t.sol:DynamicAndImmutableDataECLPTest
[@bush.fi/v3-pool-gyro]: [PASS] testGetGyroECLPPoolDynamicData() (gas: 308771)
[@bush.fi/v3-pool-gyro]: [PASS] testGetGyroECLPPoolImmutableData() (gas: 108046)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 2 passed; 0 failed; 0 skipped; finished in 243.38ms (1.39ms CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 3 tests for test/foundry/Gyro2CLPMathRounding.sol:Gyro2CLPMathRoundingTest
[@bush.fi/v3-pool-gyro]: [PASS] testCalculateQuadraticRounding__Fuzz(uint256,uint256,uint256) (runs: 10000, μ: 18489, ~: 18629)
[@bush.fi/v3-pool-gyro]: [PASS] testCalculateQuadraticTermsRounding__Fuzz(uint256[2],uint256,uint256) (runs: 10000, μ: 23427, ~: 23623)
[@bush.fi/v3-pool-gyro]: [PASS] testComputeInvariantRounding__Fuzz(uint256[2],uint256,uint256) (runs: 10000, μ: 30635, ~: 30910)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 3 passed; 0 failed; 0 skipped; finished in 4.20s (4.20s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 2 tests for test/foundry/DynamicAndImmutableData2CLP.t.sol:DynamicAndImmutableData2CLPTest
[@bush.fi/v3-pool-gyro]: [PASS] testGetGyro2CLPPoolDynamicData() (gas: 223137)
[@bush.fi/v3-pool-gyro]: [PASS] testGetGyro2CLPPoolImmutableData() (gas: 73080)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 2 passed; 0 failed; 0 skipped; finished in 346.98ms (2.87ms CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 2 tests for test/foundry/ComputeBalance2CLP.t.sol:ComputeBalance2CLPTest
[@bush.fi/v3-pool-gyro]: [PASS] testComputeNewXBalance__Fuzz(uint256,uint256,uint256) (runs: 10000, μ: 53834, ~: 54111)
[@bush.fi/v3-pool-gyro]: [PASS] testComputeNewYBalance__Fuzz(uint256,uint256,uint256) (runs: 10000, μ: 53783, ~: 54059)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 2 passed; 0 failed; 0 skipped; finished in 6.95s (6.88s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 1 test for ../../node_modules/@bush.fi/v3-vault/test/foundry/Fungibility.t.sol:FungibilityTest
[@bush.fi/v3-pool-gyro]: [PASS] testFungibilityAddUnbalanced__Fuzz(uint256) (runs: 10000, μ: 367252, ~: 367300)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 17.96s (17.89s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 1 test for test/foundry/FungibilityGyro2CLP.t.sol:FungibilityGyro2CLPTest
[@bush.fi/v3-pool-gyro]: [PASS] testFungibilityAddUnbalanced__Fuzz(uint256) (runs: 10000, μ: 386359, ~: 386389)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 19.89s (19.83s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 1 test for test/foundry/FungibilityGyroECLP.t.sol:FungibilityGyroECLPTest
[@bush.fi/v3-pool-gyro]: [PASS] testFungibilityAddUnbalanced__Fuzz(uint256) (runs: 10000, μ: 471995, ~: 472055)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 29.15s (28.88s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 5 tests for ../../node_modules/@bush.fi/v3-vault/test/foundry/E2eBatchSwap.t.sol:E2eBatchSwapTest
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactIn__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 973539, ~: 973777)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOut__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 995106, ~: 995334)
[@bush.fi/v3-pool-gyro]: [PASS] testExactInRepeatEachOperation__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 796061, ~: 796299)
[@bush.fi/v3-pool-gyro]: [PASS] testExactInRepeatExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 738916, ~: 739065)
[@bush.fi/v3-pool-gyro]: [PASS] testExactOutRepeatEachOperation__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 798111, ~: 798343)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 5 passed; 0 failed; 0 skipped; finished in 139.06s (265.40s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 24 tests for test/foundry/LiquidityApproximation2CLP.t.sol:LiquidityApproximation2CLPTest
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactInNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 506987, ~: 507083)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactInNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 458516, ~: 458571)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactInSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 519097, ~: 519452)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactIn__Fuzz(uint256,uint256) (runs: 10000, μ: 469245, ~: 472308)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 613229, ~: 613325)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 564800, ~: 564856)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 625354, ~: 625696)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 575537, ~: 578547)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquiditySingleTokenExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 500795, ~: 500894)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquiditySingleTokenExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 452341, ~: 452404)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquiditySingleTokenExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 512871, ~: 513222)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquiditySingleTokenExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 463060, ~: 466077)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityUnbalancedNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 518246, ~: 518361)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityUnbalancedNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 469768, ~: 469848)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityUnbalancedSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 530150, ~: 530539)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityUnbalanced__Fuzz(uint256,uint256) (runs: 10000, μ: 479385, ~: 481322)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactInNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 592039, ~: 592136)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactInNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 543545, ~: 543603)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactInSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 604103, ~: 604464)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactIn__Fuzz(uint256,uint256) (runs: 10000, μ: 554319, ~: 557340)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 617397, ~: 617500)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 568958, ~: 569018)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 629521, ~: 629869)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 579682, ~: 582710)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 24 passed; 0 failed; 0 skipped; finished in 841.58s (1070.58s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 5 tests for test/foundry/E2eBatchSwapECLP.t.sol:E2eBatchSwapECLPTest
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactIn__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 1569650, ~: 1570101)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOut__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 1592107, ~: 1592658)
[@bush.fi/v3-pool-gyro]: [PASS] testExactInRepeatEachOperation__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 1178204, ~: 1178821)
[@bush.fi/v3-pool-gyro]: [PASS] testExactInRepeatExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 1120161, ~: 1120748)
[@bush.fi/v3-pool-gyro]: [PASS] testExactOutRepeatEachOperation__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 1178503, ~: 1179077)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 5 passed; 0 failed; 0 skipped; finished in 862.67s (665.97s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 19 tests for ../../node_modules/@bush.fi/v3-vault/test/foundry/E2eSwap.t.sol:E2eSwapTest
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 607709, ~: 609240)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 631964, ~: 633338)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 604622, ~: 606546)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 595822, ~: 597693)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 525908, ~: 525949)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 513008, ~: 513053)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 554609, ~: 554666)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 525725, ~: 525836)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 512806, ~: 512919)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 695810, ~: 697362)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 719955, ~: 721402)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 692734, ~: 694619)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 683900, ~: 685711)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 613940, ~: 613982)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 601037, ~: 601079)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 642651, ~: 642707)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 613757, ~: 613869)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 600851, ~: 600965)
[@bush.fi/v3-pool-gyro]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 359413, ~: 359567)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 19 passed; 0 failed; 0 skipped; finished in 576.61s (1042.63s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 24 tests for ../../node_modules/@bush.fi/v3-vault/test/foundry/LiquidityApproximation.t.sol:LiquidityApproximationTest
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactInNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 435383, ~: 435441)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactInNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 434775, ~: 434832)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactInSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 449196, ~: 454729)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactIn__Fuzz(uint256,uint256) (runs: 10000, μ: 448526, ~: 454169)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 526667, ~: 526725)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 526103, ~: 526160)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 540570, ~: 546016)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 539814, ~: 545451)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquiditySingleTokenExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 429192, ~: 429251)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquiditySingleTokenExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 428604, ~: 428664)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquiditySingleTokenExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 442971, ~: 448499)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquiditySingleTokenExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 442382, ~: 447937)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityUnbalancedNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 432134, ~: 432190)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityUnbalancedNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 431524, ~: 431580)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityUnbalancedSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 444717, ~: 449287)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityUnbalanced__Fuzz(uint256,uint256) (runs: 10000, μ: 444103, ~: 448724)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactInNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 520420, ~: 520481)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactInNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 519792, ~: 519852)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactInSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 534123, ~: 539729)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactIn__Fuzz(uint256,uint256) (runs: 10000, μ: 533638, ~: 539189)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 531176, ~: 531234)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 530592, ~: 530656)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 544906, ~: 550523)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 544432, ~: 549948)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 24 passed; 0 failed; 0 skipped; finished in 915.71s (935.65s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 23 tests for ../../node_modules/@bush.fi/v3-vault/test/foundry/E2eSwapRateProvider.t.sol:E2eSwapRateProviderTest
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 631540, ~: 633046)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 659855, ~: 661047)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 628377, ~: 630039)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 619540, ~: 621185)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 541058, ~: 541099)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 528203, ~: 528249)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 576009, ~: 576068)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 540874, ~: 540986)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 528000, ~: 528115)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapRateComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 714315, ~: 714635)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapRate__Fuzz(uint256,uint256) (runs: 10000, μ: 614828, ~: 614922)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 719603, ~: 721151)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 748033, ~: 749348)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 716433, ~: 718137)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 707592, ~: 709250)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 629088, ~: 629132)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 616207, ~: 616251)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 664102, ~: 664156)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 628929, ~: 629041)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 616027, ~: 616138)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapRateComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 802465, ~: 802832)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapRate__Fuzz(uint256,uint256) (runs: 10000, μ: 702911, ~: 703011)
[@bush.fi/v3-pool-gyro]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 380528, ~: 380681)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 23 passed; 0 failed; 0 skipped; finished in 180.43s (681.98s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 19 tests for test/foundry/E2eSwap2CLP.t.sol:E2eSwapGyro2CLPTest
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 645715, ~: 647231)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 660062, ~: 661579)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 642589, ~: 644536)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 623682, ~: 625716)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 563748, ~: 563942)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 540918, ~: 541076)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 579996, ~: 580040)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 560877, ~: 561029)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 538028, ~: 538142)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 740456, ~: 741950)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 754862, ~: 756282)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 737245, ~: 739199)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 718349, ~: 720318)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 658374, ~: 658566)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 635536, ~: 635686)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 674662, ~: 674700)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 655501, ~: 655651)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 632664, ~: 632772)
[@bush.fi/v3-pool-gyro]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 381989, ~: 382289)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 19 passed; 0 failed; 0 skipped; finished in 717.27s (845.57s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 24 tests for test/foundry/LiquidityApproximationECLP.t.sol:LiquidityApproximationECLPTest
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactInNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 564251, ~: 564295)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactInNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 563644, ~: 563686)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactInSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 578372, ~: 578663)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactIn__Fuzz(uint256,uint256) (runs: 10000, μ: 577796, ~: 578103)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 700236, ~: 700279)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 699673, ~: 699714)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 714352, ~: 714650)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityProportionalAndRemoveExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 713787, ~: 714085)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquiditySingleTokenExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 559025, ~: 559065)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquiditySingleTokenExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 558436, ~: 558478)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquiditySingleTokenExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 573108, ~: 573393)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquiditySingleTokenExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 572553, ~: 572831)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityUnbalancedNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 605617, ~: 605660)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityUnbalancedNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 605007, ~: 605050)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityUnbalancedSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 617521, ~: 617837)
[@bush.fi/v3-pool-gyro]: [PASS] testAddLiquidityUnbalanced__Fuzz(uint256,uint256) (runs: 10000, μ: 616965, ~: 617274)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactInNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 649482, ~: 649707)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactInNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 648858, ~: 649078)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactInSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 663555, ~: 664035)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactIn__Fuzz(uint256,uint256) (runs: 10000, μ: 663018, ~: 663495)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 704204, ~: 704244)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactOutNoSwapFee__Fuzz(uint256) (runs: 10000, μ: 703622, ~: 703666)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 718324, ~: 718613)
[@bush.fi/v3-pool-gyro]: [PASS] testRemoveLiquiditySingleTokenExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 717737, ~: 718038)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 24 passed; 0 failed; 0 skipped; finished in 1030.12s (1327.76s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 19 tests for test/foundry/E2eSwapECLP.t.sol:E2eSwapECLPTest
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 806733, ~: 808257)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 830836, ~: 832136)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 803646, ~: 805574)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 794755, ~: 796721)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 724840, ~: 724977)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 711930, ~: 712081)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 750711, ~: 750749)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 721894, ~: 722060)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 708971, ~: 709143)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 929600, ~: 931083)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 953913, ~: 955131)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 926388, ~: 928346)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 917518, ~: 919438)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 847557, ~: 847709)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 834658, ~: 834806)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 873753, ~: 873908)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 844687, ~: 844792)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 831777, ~: 831888)
[@bush.fi/v3-pool-gyro]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 486118, ~: 486436)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 19 passed; 0 failed; 0 skipped; finished in 508.85s (971.87s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 5 tests for test/foundry/E2eBatchSwap2CLP.t.sol:E2eBatchSwapGyro2CLPTest
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactIn__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 1042381, ~: 1042954)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOut__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 1064527, ~: 1065075)
[@bush.fi/v3-pool-gyro]: [PASS] testExactInRepeatEachOperation__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 820533, ~: 821099)
[@bush.fi/v3-pool-gyro]: [PASS] testExactInRepeatExactOut__Fuzz(uint256,uint256) (runs: 10000, μ: 763687, ~: 764147)
[@bush.fi/v3-pool-gyro]: [PASS] testExactOutRepeatEachOperation__Fuzz(uint256,uint256,uint256,uint256) (runs: 10000, μ: 823144, ~: 823707)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 5 passed; 0 failed; 0 skipped; finished in 1050.02s (312.30s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 19 tests for /Users/jeff/bush-v3-monorepo/node_modules/@bush.fi/v3-vault/test/foundry/E2eSwap.t.sol:E2eSwapTest
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 607698, ~: 609238)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 631954, ~: 633340)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 604624, ~: 606546)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 595869, ~: 597693)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 525906, ~: 525949)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 513009, ~: 513053)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 554611, ~: 554666)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 525722, ~: 525836)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 512807, ~: 512919)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 695858, ~: 697362)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 720003, ~: 721402)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 692701, ~: 694619)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 683863, ~: 685711)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 613938, ~: 613982)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 601035, ~: 601079)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 642653, ~: 642707)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 613761, ~: 613869)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 600853, ~: 600965)
[@bush.fi/v3-pool-gyro]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 359418, ~: 359567)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 19 passed; 0 failed; 0 skipped; finished in 677.22s (916.22s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 23 tests for test/foundry/E2eSwapRateProviderECLP.t.sol:E2eSwapRateProviderECLPTest
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 830640, ~: 832133)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 858731, ~: 860206)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 827537, ~: 829067)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 818708, ~: 820213)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 739961, ~: 740127)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 727116, ~: 727277)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 772173, ~: 772488)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 737044, ~: 737210)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 724172, ~: 724339)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapRateComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 913084, ~: 913501)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapRate__Fuzz(uint256,uint256) (runs: 10000, μ: 811326, ~: 811154)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 953509, ~: 955164)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 981914, ~: 983090)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 950372, ~: 951864)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 941490, ~: 942977)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 862721, ~: 862859)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 849825, ~: 849978)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 895254, ~: 895516)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 859857, ~: 859964)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 846959, ~: 847061)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapRateComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 1036347, ~: 1036580)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapRate__Fuzz(uint256,uint256) (runs: 10000, μ: 934115, ~: 933942)
[@bush.fi/v3-pool-gyro]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 507234, ~: 507550)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 23 passed; 0 failed; 0 skipped; finished in 1050.03s (2054.92s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 23 tests for test/foundry/E2eSwapRateProvider2CLP.t.sol:E2eSwapRateProviderGyro2CLPTest
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 654417, ~: 655919)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 682935, ~: 684187)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 651135, ~: 652910)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 642379, ~: 644056)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 563821, ~: 563970)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10000, μ: 550969, ~: 551120)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 596246, ~: 596292)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 560953, ~: 561057)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10000, μ: 548080, ~: 548186)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapRateComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 737305, ~: 737715)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactInSwapRate__Fuzz(uint256,uint256) (runs: 10000, μ: 634895, ~: 634993)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10000, μ: 748798, ~: 750549)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 777350, ~: 778740)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 745582, ~: 747260)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10000, μ: 736626, ~: 738373)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 658099, ~: 658255)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10000, μ: 645213, ~: 645374)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10000, μ: 690626, ~: 690667)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10000, μ: 655262, ~: 655364)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10000, μ: 642357, ~: 642461)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapRateComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10000, μ: 831815, ~: 832228)
[@bush.fi/v3-pool-gyro]: [PASS] testDoUndoExactOutSwapRate__Fuzz(uint256,uint256) (runs: 10000, μ: 729241, ~: 729334)
[@bush.fi/v3-pool-gyro]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10000, μ: 388701, ~: 388959)
[@bush.fi/v3-pool-gyro]: Suite result: ok. 23 passed; 0 failed; 0 skipped; finished in 1050.03s (1248.32s CPU time)
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Ran 20 test suites in 1050.54s (9678.34s CPU time): 244 tests passed, 0 failed, 0 skipped (244 total tests)
[@bush.fi/v3-pool-gyro]: Solidity 0.8.26, 0.8.27 are not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Learn more at https://hardhat.org/hardhat-runner/docs/reference/solidity-support
[@bush.fi/v3-pool-gyro]: 
[@bush.fi/v3-pool-gyro]: Process exited (exit code 0), completed in 18m 43s
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]:   AggregatorBatchSwap
[@bush.fi/v3-vault]:     common tests
[@bush.fi/v3-vault]:       ✔ reverts doSwapExactIn if deadline is in the past
[@bush.fi/v3-vault]:       ✔ reverts doSwapExactOut if deadline is in the past
[@bush.fi/v3-vault]:       ✔ reverts doSwapExactIn if amount out < min amount out
[@bush.fi/v3-vault]:       ✔ reverts doSwapExactOut if amount in > max amount in
[@bush.fi/v3-vault]:     batch swap given in
[@bush.fi/v3-vault]:       pure swaps with no nesting
[@bush.fi/v3-vault]:         should revert if path is inccorrect
[@bush.fi/v3-vault]:           ✔ should revert if the step.pool is tokenIn
[@bush.fi/v3-vault]:           ✔ should revert if the step.pool is baseTest.tokensOut
[@bush.fi/v3-vault]:         single path
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (62ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (50ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out
[@bush.fi/v3-vault]:           ✔ returns tokens out
[@bush.fi/v3-vault]:           ✔ returns token amounts out
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (43ms)
[@bush.fi/v3-vault]:         single path, first - intermediate - final steps
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (80ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (90ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (48ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (46ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (56ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (96ms)
[@bush.fi/v3-vault]:         multi path, SISO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (61ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (68ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out
[@bush.fi/v3-vault]:           ✔ returns tokens out
[@bush.fi/v3-vault]:           ✔ returns token amounts out
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (76ms)
[@bush.fi/v3-vault]:         multi path, MISO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (56ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (64ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out
[@bush.fi/v3-vault]:           ✔ returns tokens out
[@bush.fi/v3-vault]:           ✔ returns token amounts out
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (58ms)
[@bush.fi/v3-vault]:         multi path, SIMO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (54ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out
[@bush.fi/v3-vault]:           ✔ returns tokens out
[@bush.fi/v3-vault]:           ✔ returns token amounts out
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (65ms)
[@bush.fi/v3-vault]:         multi path, MIMO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (84ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (45ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (45ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (58ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (101ms)
[@bush.fi/v3-vault]:         unwrap first, SISO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (72ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (109ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (57ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (54ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (51ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (104ms)
[@bush.fi/v3-vault]:         unwrap first - wrap end, SISO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (92ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (156ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (65ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (56ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (75ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (113ms)
[@bush.fi/v3-vault]:         wrap first - unwrap end, SISO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (103ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (108ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (57ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (57ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (61ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (118ms)
[@bush.fi/v3-vault]:     batch swap given out
[@bush.fi/v3-vault]:       pure swaps with no nesting
[@bush.fi/v3-vault]:         ✔ should revert if the step.pool is tokenIn
[@bush.fi/v3-vault]:         ✔ should revert if the step.pool is baseTest.tokensOut
[@bush.fi/v3-vault]:         single path
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (49ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out
[@bush.fi/v3-vault]:           ✔ returns path amounts in
[@bush.fi/v3-vault]:           ✔ returns tokens in
[@bush.fi/v3-vault]:           ✔ returns token amounts in
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (63ms)
[@bush.fi/v3-vault]:         single path, first - intermediate - final steps
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (86ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (59ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (56ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (51ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (56ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (121ms)
[@bush.fi/v3-vault]:         multi path, SISO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (68ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (38ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (38ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (41ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (47ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (81ms)
[@bush.fi/v3-vault]:         multi path, MISO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (79ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (44ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in
[@bush.fi/v3-vault]:           ✔ returns tokens in
[@bush.fi/v3-vault]:           ✔ returns token amounts in
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (66ms)
[@bush.fi/v3-vault]:         multi path, SIMO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (89ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (51ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (52ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (56ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (89ms)
[@bush.fi/v3-vault]:         multi path, MIMO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (106ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (68ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (66ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (58ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (97ms)
[@bush.fi/v3-vault]:         unwrap first, SISO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (109ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (57ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (55ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (50ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (60ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (141ms)
[@bush.fi/v3-vault]:         unwrap first - wrap end, SISO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (149ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (85ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (70ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (66ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (70ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (137ms)
[@bush.fi/v3-vault]:         wrap first - unwrap end, SISO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (147ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (78ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (115ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (90ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (126ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (162ms)
[@bush.fi/v3-vault]:         multi path, circular inputs/outputs
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (179ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (92ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (96ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (106ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (211ms)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]:   BalancerPoolToken
[@bush.fi/v3-vault]:     minting
[@bush.fi/v3-vault]:       ✔ vault can mint BPT (48ms)
[@bush.fi/v3-vault]:       ✔ minting ERC20 BPT emits a transfer event on the token
[@bush.fi/v3-vault]:       ✔ cannot mint ERC20 BPT to zero address
[@bush.fi/v3-vault]:     burning
[@bush.fi/v3-vault]:       ✔ vault can burn ERC20 BPT
[@bush.fi/v3-vault]:       ✔ burning ERC20 BPT emits a transfer event on the token
[@bush.fi/v3-vault]:       ✔ cannot burn ERC20 BPT from the zero address
[@bush.fi/v3-vault]:       ✔ cannot burn more than the ERC20 BPT balance
[@bush.fi/v3-vault]:     transfer
[@bush.fi/v3-vault]:       ✔ transfers ERC20 BPT directly
[@bush.fi/v3-vault]:       ✔ transfers ERC20 BPT through the Vault
[@bush.fi/v3-vault]:       ✔ cannot transfer ERC20 BPT from zero address
[@bush.fi/v3-vault]:       ✔ cannot transfer ERC20 BPT to zero address
[@bush.fi/v3-vault]:       ✔ cannot transfer more than balance
[@bush.fi/v3-vault]:       ✔ cannot emit transfer event except through the Vault
[@bush.fi/v3-vault]:       ✔ cannot emit approval event except through the Vault
[@bush.fi/v3-vault]:     allowance
[@bush.fi/v3-vault]:       ✔ cannot approve to zero address
[@bush.fi/v3-vault]:       sets approval directly
[@bush.fi/v3-vault]:         ✔ sets approval
[@bush.fi/v3-vault]:         ✔ direct ERC20 approval emits an event on the token
[@bush.fi/v3-vault]:         ✔ indirect ERC20 approval emits an event on the token
[@bush.fi/v3-vault]:       sets approval through the Vault
[@bush.fi/v3-vault]:         ✔ sets approval (47ms)
[@bush.fi/v3-vault]:         ✔ direct ERC20 approval emits an event on the token
[@bush.fi/v3-vault]:         ✔ indirect ERC20 approval emits an event on the token
[@bush.fi/v3-vault]:     transferFrom
[@bush.fi/v3-vault]:       ✔ direct transfer emits a transfer event on the token
[@bush.fi/v3-vault]:       ✔ indirect transfer emits a transfer event on the ERC20 BPT token
[@bush.fi/v3-vault]:       ✔ cannot transfer ERC20 BPT to zero address
[@bush.fi/v3-vault]:       ✔ cannot transfer more than ERC20 BPT balance
[@bush.fi/v3-vault]:       ✔ cannot transfer more than ERC20 BPT allowance
[@bush.fi/v3-vault]:       transfers ERC20 BPT directly
[@bush.fi/v3-vault]:         ✔ relayer can transfer ERC20 BPT
[@bush.fi/v3-vault]:       transfers ERC20 BPT through the Vault
[@bush.fi/v3-vault]:         ✔ relayer can transfer ERC20 BPT
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]:   BasePoolMath
[@bush.fi/v3-vault]:     ✔ test computeProportionalAmountsIn
[@bush.fi/v3-vault]:     ✔ test computeProportionalAmountsOut
[@bush.fi/v3-vault]:     ✔ test computeAddLiquidityUnbalanced
[@bush.fi/v3-vault]:     ✔ test computeAddLiquiditySingleTokenExactOut
[@bush.fi/v3-vault]:     ✔ test computeRemoveLiquiditySingleTokenExactOut
[@bush.fi/v3-vault]:     ✔ test computeRemoveLiquiditySingleTokenExactIn
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]:   BatchSwap
[@bush.fi/v3-vault]:     common tests
[@bush.fi/v3-vault]:       ✔ reverts doSwapExactIn if deadline is in the past
[@bush.fi/v3-vault]:       ✔ reverts doSwapExactOut if deadline is in the past
[@bush.fi/v3-vault]:       ✔ reverts doSwapExactIn if amount out < min amount out
[@bush.fi/v3-vault]:       ✔ reverts doSwapExactOut if amount in > max amount in
[@bush.fi/v3-vault]:     batch swap given in
[@bush.fi/v3-vault]:       pure swaps with no nesting
[@bush.fi/v3-vault]:         single path
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (45ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token in
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (48ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out
[@bush.fi/v3-vault]:           ✔ returns tokens out
[@bush.fi/v3-vault]:           ✔ returns token amounts out
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (50ms)
[@bush.fi/v3-vault]:         single path, first - intermediate - final steps
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (77ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token in (59ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (108ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (62ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (56ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (72ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (95ms)
[@bush.fi/v3-vault]:         multi path, SISO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (83ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token in (51ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (81ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out
[@bush.fi/v3-vault]:           ✔ returns tokens out
[@bush.fi/v3-vault]:           ✔ returns token amounts out
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (58ms)
[@bush.fi/v3-vault]:         multi path, MISO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (153ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (126ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (87ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (58ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (48ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (171ms)
[@bush.fi/v3-vault]:         multi path, SIMO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (161ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token in (77ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (64ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (65ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (64ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (161ms)
[@bush.fi/v3-vault]:         multi path, MIMO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (166ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (70ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (80ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (114ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (145ms)
[@bush.fi/v3-vault]:         multi path, circular inputs/outputs
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (151ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (72ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (231ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (103ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (233ms)
[@bush.fi/v3-vault]:       joinswaps (add liquidity step)
[@bush.fi/v3-vault]:         single path - initial add liquidity step
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (196ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token in (151ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (233ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (44ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (85ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (65ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (164ms)
[@bush.fi/v3-vault]:         single path - intermediate add liquidity step
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (240ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token in (132ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (181ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (125ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (107ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (70ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (168ms)
[@bush.fi/v3-vault]:         multi path - initial and final add liquidity step
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (225ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token in (154ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (134ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (139ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (138ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (274ms)
[@bush.fi/v3-vault]:       exitswaps (remove liquidity step)
[@bush.fi/v3-vault]:         single path - initial remove liquidity step
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (114ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (71ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (52ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (54ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (56ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (117ms)
[@bush.fi/v3-vault]:         single path - intermediate remove liquidity step
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (180ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token in (75ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (79ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (102ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (96ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (189ms)
[@bush.fi/v3-vault]:         single path - final remove liquidity step
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (145ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (82ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (53ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (62ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (105ms)
[@bush.fi/v3-vault]:         multi path - final remove liquidity step
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (236ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (137ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (122ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (107ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (245ms)
[@bush.fi/v3-vault]:         multi path - mid remove liquidity step
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (166ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts out (74ms)
[@bush.fi/v3-vault]:           ✔ returns tokens out (77ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts out (78ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (170ms)
[@bush.fi/v3-vault]:     batch swap given out
[@bush.fi/v3-vault]:       pure swaps with no nesting
[@bush.fi/v3-vault]:         single path
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (97ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token in (70ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (41ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (39ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in
[@bush.fi/v3-vault]:           ✔ returns token amounts in
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (71ms)
[@bush.fi/v3-vault]:         single path, first - intermediate - final steps
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (187ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token in (126ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (127ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (67ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (97ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (92ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (160ms)
[@bush.fi/v3-vault]:         multi path, SISO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (158ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token in (122ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (76ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (58ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (58ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (42ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (114ms)
[@bush.fi/v3-vault]:         multi path, MISO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (103ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (66ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (56ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (49ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (42ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (95ms)
[@bush.fi/v3-vault]:         multi path, SIMO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (100ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token in (105ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (40ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (45ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (115ms)
[@bush.fi/v3-vault]:         multi path, MIMO
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (128ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (62ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (71ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (70ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (121ms)
[@bush.fi/v3-vault]:         multi path, circular inputs/outputs
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (105ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (79ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (45ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (52ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (98ms)
[@bush.fi/v3-vault]:       joinswaps (add liquidity step)
[@bush.fi/v3-vault]:         single path - first add liquidity step
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (101ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token in (98ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (51ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (39ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in
[@bush.fi/v3-vault]:           ✔ returns token amounts in (42ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (72ms)
[@bush.fi/v3-vault]:         multi path - first and intermediate add liquidity step
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (165ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token in (154ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (76ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (80ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (69ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (155ms)
[@bush.fi/v3-vault]:         single path - final add liquidity step
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (109ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token in (113ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (73ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (44ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (72ms)
[@bush.fi/v3-vault]:           ✔ mints amount out
[@bush.fi/v3-vault]:       exitswaps (remove liquidity step)
[@bush.fi/v3-vault]:         single path - first remove liquidity step
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (143ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (56ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (59ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (69ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (70ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (99ms)
[@bush.fi/v3-vault]:           ✔ burns amount in (117ms)
[@bush.fi/v3-vault]:         single path - intermediate remove liquidity step
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (129ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token out (67ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (66ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (62ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (59ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (148ms)
[@bush.fi/v3-vault]:         single path - final remove liquidity step
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (101ms)
[@bush.fi/v3-vault]:           ✔ performs single transfer for token in (95ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (56ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (45ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (38ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (127ms)
[@bush.fi/v3-vault]:         multi path - final remove liquidity step
[@bush.fi/v3-vault]:           ✔ performs swap, transfers tokens (173ms)
[@bush.fi/v3-vault]:           ✔ returns path amounts in (118ms)
[@bush.fi/v3-vault]:           ✔ returns tokens in (115ms)
[@bush.fi/v3-vault]:           ✔ returns token amounts in (114ms)
[@bush.fi/v3-vault]:           ✔ returns same outputs as query (263ms)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]:   ContractSizes
[@bush.fi/v3-vault]:     ✔ calculates and stores contract sizes (4934ms)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]:   ERC4626VaultPrimitive
[@bush.fi/v3-vault]:     registration
[@bush.fi/v3-vault]:       ✔ pool has correct metadata
[@bush.fi/v3-vault]:       ✔ registers the pool
[@bush.fi/v3-vault]:       ✔ has the correct tokens
[@bush.fi/v3-vault]:       ✔ configures the pool correctly
[@bush.fi/v3-vault]:     initialization
[@bush.fi/v3-vault]:       ✔ satisfies preconditions
[@bush.fi/v3-vault]:       ✔ emits an event
[@bush.fi/v3-vault]:       ✔ updates the state (48ms)
[@bush.fi/v3-vault]:       ✔ cannot be initialized twice (61ms)
[@bush.fi/v3-vault]:     queries
[@bush.fi/v3-vault]:       ✔ should not require tokens in advance to querySwapExactIn using buffer (143ms)
[@bush.fi/v3-vault]:       ✔ should not require tokens in advance to querySwapExactOut using buffer (143ms)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]:   InputHelpers (token sorting)
[@bush.fi/v3-vault]:     ✔ ensures tokens are sorted
[@bush.fi/v3-vault]:     ✔ sorts tokens
[@bush.fi/v3-vault]:     ✔ does not mutate already sorted tokens
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]:   Queries
[@bush.fi/v3-vault]:     swap
[@bush.fi/v3-vault]:       ✔ queries a swap exact in correctly
[@bush.fi/v3-vault]:       ✔ queries a swap exact out correctly
[@bush.fi/v3-vault]:       ✔ reverts if not a static call (exact in)
[@bush.fi/v3-vault]:       ✔ reverts if not a static call (exact out)
[@bush.fi/v3-vault]:     addLiquidityProportional
[@bush.fi/v3-vault]:       ✔ queries addLiquidityProportional correctly
[@bush.fi/v3-vault]:       ✔ reverts if not a static call
[@bush.fi/v3-vault]:     addLiquidityUnbalanced
[@bush.fi/v3-vault]:       ✔ queries addLiquidityUnbalanced correctly
[@bush.fi/v3-vault]:       ✔ reverts if not a static call
[@bush.fi/v3-vault]:     addLiquiditySingleTokenExactOut
[@bush.fi/v3-vault]:       ✔ queries addLiquiditySingleTokenExactOut correctly
[@bush.fi/v3-vault]:       ✔ reverts if not a static call
[@bush.fi/v3-vault]:     addLiquidityCustom
[@bush.fi/v3-vault]:       ✔ queries addLiquidityCustom correctly
[@bush.fi/v3-vault]:       ✔ reverts if not a static call
[@bush.fi/v3-vault]:     removeLiquidityProportional
[@bush.fi/v3-vault]:       ✔ queries removeLiquidityProportional correctly
[@bush.fi/v3-vault]:       ✔ reverts if not a static call
[@bush.fi/v3-vault]:     removeLiquiditySingleTokenExactIn
[@bush.fi/v3-vault]:       ✔ queries removeLiquiditySingleTokenExactIn correctly
[@bush.fi/v3-vault]:       ✔ reverts if not a static call
[@bush.fi/v3-vault]:     removeLiquiditySingleTokenExactOut
[@bush.fi/v3-vault]:       ✔ queries removeLiquiditySingleTokenExactOut correctly
[@bush.fi/v3-vault]:       ✔ reverts if not a static call
[@bush.fi/v3-vault]:     removeLiquidityCustom
[@bush.fi/v3-vault]:       ✔ queries removeLiquidityCustom correctly
[@bush.fi/v3-vault]:       ✔ reverts if not a static call
[@bush.fi/v3-vault]:     query and revert
[@bush.fi/v3-vault]:       swap
[@bush.fi/v3-vault]:         ✔ queries a swap exact in correctly
[@bush.fi/v3-vault]:         ✔ reverts if not a static call (exact in)
[@bush.fi/v3-vault]:         ✔ handles query spoofs
[@bush.fi/v3-vault]:         ✔ handles custom error codes
[@bush.fi/v3-vault]:         ✔ handles legacy errors
[@bush.fi/v3-vault]:         ✔ handles revert with no reason
[@bush.fi/v3-vault]:         ✔ handles panic
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]:   Vault
[@bush.fi/v3-vault]:     registration
[@bush.fi/v3-vault]:       ✔ cannot register a pool with unsorted tokens
[@bush.fi/v3-vault]:       ✔ can register a pool
[@bush.fi/v3-vault]:       ✔ pools are initially not in recovery mode
[@bush.fi/v3-vault]:       ✔ pools are initially unpaused
[@bush.fi/v3-vault]:       ✔ registering a pool emits an event
[@bush.fi/v3-vault]:       ✔ registering a pool with a swap fee emits an event
[@bush.fi/v3-vault]:       ✔ cannot register a pool twice
[@bush.fi/v3-vault]:       ✔ cannot register a pool with an invalid token (zero address)
[@bush.fi/v3-vault]:       ✔ cannot register a pool with an invalid token (pool address)
[@bush.fi/v3-vault]:       ✔ cannot register a pool with duplicate tokens
[@bush.fi/v3-vault]:       ✔ cannot register a pool when paused
[@bush.fi/v3-vault]:       ✔ cannot get pool tokens for an invalid pool
[@bush.fi/v3-vault]:       ✔ cannot register a pool with too few tokens
[@bush.fi/v3-vault]:       ✔ cannot register a pool with too many tokens (223ms)
[@bush.fi/v3-vault]:     initialization
[@bush.fi/v3-vault]:       ✔ is temporarily pausable
[@bush.fi/v3-vault]:       ✔ pausing the Vault emits an event
[@bush.fi/v3-vault]:       rate providers
[@bush.fi/v3-vault]:         ✔ has rate providers
[@bush.fi/v3-vault]:         ✔ rate providers respond to changing rates
[@bush.fi/v3-vault]:       pausing pools
[@bush.fi/v3-vault]:         ✔ Pools are temporarily pausable
[@bush.fi/v3-vault]:         ✔ pausing a pool emits an event
[@bush.fi/v3-vault]:     authorizer
[@bush.fi/v3-vault]:       without permission
[@bush.fi/v3-vault]:         ✔ cannot change authorizer
[@bush.fi/v3-vault]:       with permission
[@bush.fi/v3-vault]:         ✔ can change authorizer
[@bush.fi/v3-vault]:         ✔ the null authorizer allows everything
[@bush.fi/v3-vault]:     pool tokens
[@bush.fi/v3-vault]:       ✔ returns the min and max pool counts (45ms)
[@bush.fi/v3-vault]:       ✔ stores the decimal differences (102ms)
[@bush.fi/v3-vault]:       ✔ computes the scaling factors (59ms)
[@bush.fi/v3-vault]:     recovery mode
[@bush.fi/v3-vault]:       ✔ enable/disable functions are permissioned
[@bush.fi/v3-vault]:       in recovery mode
[@bush.fi/v3-vault]:         ✔ can place pool in recovery mode
[@bush.fi/v3-vault]:         ✔ cannot put in recovery mode twice
[@bush.fi/v3-vault]:         ✔ can call recovery mode only function
[@bush.fi/v3-vault]:         ✔ can disable recovery mode
[@bush.fi/v3-vault]:         ✔ disabling recovery mode emits an event
[@bush.fi/v3-vault]:       not in recovery mode
[@bush.fi/v3-vault]:         ✔ is initially not in recovery mode
[@bush.fi/v3-vault]:         ✔ cannot disable when not in recovery mode
[@bush.fi/v3-vault]:         ✔ cannot call recovery mode only function when not in recovery mode
[@bush.fi/v3-vault]:         ✔ enabling recovery mode emits an event
[@bush.fi/v3-vault]:     reentrancy guard state
[@bush.fi/v3-vault]:       ✔ reentrancy guard should be false when not in Vault context
[@bush.fi/v3-vault]:       ✔ reentrancy guard should be true when in Vault context (39ms)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]:   PoolMock Gas Benchmark
[@bush.fi/v3-vault]:     initialization
[@bush.fi/v3-vault]:       does not use ETH
[@bush.fi/v3-vault]:         ✔ measures initialization gas without ETH (Standard) (41ms)
[@bush.fi/v3-vault]:       use ETH
[@bush.fi/v3-vault]:         ✔ measures initialization gas with ETH (Standard)
[@bush.fi/v3-vault]:     test donation
[@bush.fi/v3-vault]:       ✔ pool preconditions (Standard)
[@bush.fi/v3-vault]:       ✔ measures gas (Standard) (75ms)
[@bush.fi/v3-vault]:     test standard pool
[@bush.fi/v3-vault]:       swap
[@bush.fi/v3-vault]:         ✔ pool and protocol fee preconditions (undefined)
[@bush.fi/v3-vault]:         ✔ measures gas (Router) (undefined) (133ms)
[@bush.fi/v3-vault]:         ✔ measures gas (BatchRouter) (undefined) (220ms)
[@bush.fi/v3-vault]:       remove liquidity
[@bush.fi/v3-vault]:         ✔ pool and protocol fee preconditions (Standard)
[@bush.fi/v3-vault]:         ✔ measures gas (proportional) (Standard) (45ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact in) (Standard) (151ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact in - BatchRouter) (Standard) (124ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact out) (Standard) (130ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact out - BatchRouter) (Standard) (172ms)
[@bush.fi/v3-vault]:       add liquidity
[@bush.fi/v3-vault]:         ✔ pool and protocol fee preconditions (Standard) (49ms)
[@bush.fi/v3-vault]:         ✔ measures gas (proportional) (139ms)
[@bush.fi/v3-vault]:         ✔ measures gas (unbalanced) (Standard) (121ms)
[@bush.fi/v3-vault]:         ✔ measures gas (unbalanced - BatchRouter) (Standard) (135ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact out) (Standard) (223ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact out - BatchRouter) (Standard) (89ms)
[@bush.fi/v3-vault]:     test yield pool
[@bush.fi/v3-vault]:       swap
[@bush.fi/v3-vault]:         ✔ pool and protocol fee preconditions (undefined)
[@bush.fi/v3-vault]:         ✔ measures gas (Router) (undefined) (193ms)
[@bush.fi/v3-vault]:         ✔ measures gas (BatchRouter) (undefined) (158ms)
[@bush.fi/v3-vault]:       remove liquidity
[@bush.fi/v3-vault]:         ✔ pool and protocol fee preconditions (WithRate)
[@bush.fi/v3-vault]:         ✔ measures gas (proportional) (WithRate) (127ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact in) (WithRate) (77ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact in - BatchRouter) (WithRate) (238ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact out) (WithRate) (159ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact out - BatchRouter) (WithRate) (240ms)
[@bush.fi/v3-vault]:       add liquidity
[@bush.fi/v3-vault]:         ✔ pool and protocol fee preconditions (WithRate) (47ms)
[@bush.fi/v3-vault]:         ✔ measures gas (proportional) (103ms)
[@bush.fi/v3-vault]:         ✔ measures gas (unbalanced) (WithRate) (179ms)
[@bush.fi/v3-vault]:         ✔ measures gas (unbalanced - BatchRouter) (WithRate) (194ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact out) (WithRate) (157ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact out - BatchRouter) (WithRate) (210ms)
[@bush.fi/v3-vault]:     test ERC4626 pool
[@bush.fi/v3-vault]:       ✔ measures gas (buffers without liquidity exact in - BatchRouter) (186ms)
[@bush.fi/v3-vault]:       ✔ measures gas (buffers without liquidity exact out - BatchRouter) (230ms)
[@bush.fi/v3-vault]:       ✔ measures gas (buffers with liquidity exact in - BatchRouter) (223ms)
[@bush.fi/v3-vault]:       ✔ measures gas (buffers with liquidity exact out - BatchRouter) (285ms)
[@bush.fi/v3-vault]:     test nested pool
[@bush.fi/v3-vault]:       ✔ measures gas (swap exact in) (128ms)
[@bush.fi/v3-vault]:       ✔ measures gas (swap exact in - reverse) (281ms)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]:   PoolMock with Hooks Gas Benchmark
[@bush.fi/v3-vault]:     initialization
[@bush.fi/v3-vault]:       does not use ETH
[@bush.fi/v3-vault]:         ✔ measures initialization gas without ETH (Standard) (44ms)
[@bush.fi/v3-vault]:       use ETH
[@bush.fi/v3-vault]:         ✔ measures initialization gas with ETH (Standard) (76ms)
[@bush.fi/v3-vault]:     test donation
[@bush.fi/v3-vault]:       ✔ pool preconditions (Standard)
[@bush.fi/v3-vault]:       ✔ measures gas (Standard) (74ms)
[@bush.fi/v3-vault]:     test standard pool
[@bush.fi/v3-vault]:       swap
[@bush.fi/v3-vault]:         ✔ pool and protocol fee preconditions (undefined)
[@bush.fi/v3-vault]:         ✔ measures gas (Router) (undefined) (185ms)
[@bush.fi/v3-vault]:         ✔ measures gas (BatchRouter) (undefined) (155ms)
[@bush.fi/v3-vault]:       remove liquidity
[@bush.fi/v3-vault]:         ✔ pool and protocol fee preconditions (Standard)
[@bush.fi/v3-vault]:         ✔ measures gas (proportional) (Standard) (115ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact in) (Standard) (233ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact in - BatchRouter) (Standard) (234ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact out) (Standard) (165ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact out - BatchRouter) (Standard) (245ms)
[@bush.fi/v3-vault]:       add liquidity
[@bush.fi/v3-vault]:         ✔ pool and protocol fee preconditions (Standard) (56ms)
[@bush.fi/v3-vault]:         ✔ measures gas (proportional) (167ms)
[@bush.fi/v3-vault]:         ✔ measures gas (unbalanced) (Standard) (278ms)
[@bush.fi/v3-vault]:         ✔ measures gas (unbalanced - BatchRouter) (Standard) (199ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact out) (Standard) (250ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact out - BatchRouter) (Standard) (250ms)
[@bush.fi/v3-vault]:     test yield pool
[@bush.fi/v3-vault]:       swap
[@bush.fi/v3-vault]:         ✔ pool and protocol fee preconditions (undefined)
[@bush.fi/v3-vault]:         ✔ measures gas (Router) (undefined) (176ms)
[@bush.fi/v3-vault]:         ✔ measures gas (BatchRouter) (undefined) (256ms)
[@bush.fi/v3-vault]:       remove liquidity
[@bush.fi/v3-vault]:         ✔ pool and protocol fee preconditions (WithRate)
[@bush.fi/v3-vault]:         ✔ measures gas (proportional) (WithRate) (130ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact in) (WithRate) (287ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact in - BatchRouter) (WithRate) (202ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact out) (WithRate) (288ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact out - BatchRouter) (WithRate) (248ms)
[@bush.fi/v3-vault]:       add liquidity
[@bush.fi/v3-vault]:         ✔ pool and protocol fee preconditions (WithRate) (60ms)
[@bush.fi/v3-vault]:         ✔ measures gas (proportional) (179ms)
[@bush.fi/v3-vault]:         ✔ measures gas (unbalanced) (WithRate) (250ms)
[@bush.fi/v3-vault]:         ✔ measures gas (unbalanced - BatchRouter) (WithRate) (248ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact out) (WithRate) (310ms)
[@bush.fi/v3-vault]:         ✔ measures gas (single token exact out - BatchRouter) (WithRate) (235ms)
[@bush.fi/v3-vault]:     test ERC4626 pool
[@bush.fi/v3-vault]:       ✔ measures gas (buffers without liquidity exact in - BatchRouter) (287ms)
[@bush.fi/v3-vault]:       ✔ measures gas (buffers without liquidity exact out - BatchRouter) (477ms)
[@bush.fi/v3-vault]:       ✔ measures gas (buffers with liquidity exact in - BatchRouter) (395ms)
[@bush.fi/v3-vault]:       ✔ measures gas (buffers with liquidity exact out - BatchRouter) (316ms)
[@bush.fi/v3-vault]:     test nested pool
[@bush.fi/v3-vault]:       ✔ measures gas (swap exact in) (353ms)
[@bush.fi/v3-vault]:       ✔ measures gas (swap exact in - reverse) (326ms)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]:   491 passing (3m)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Nothing to compile
[@bush.fi/v3-vault]: No need to generate any newer typings.
[@bush.fi/v3-vault]: Compiling 27 files with Solc 0.8.26
[@bush.fi/v3-vault]: Solc 0.8.26 finished in 145.65s
[@bush.fi/v3-vault]: Compiler run successful!
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 18 tests for test/foundry/unit/VaultUnitLiquidity.t.sol:VaultUnitLiquidityTest
[@bush.fi/v3-vault]: [PASS] testAddLiquidityCustom() (gas: 407403)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportional() (gas: 318370)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOut() (gas: 325335)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalanced() (gas: 336240)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityCustom() (gas: 436911)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityProportional() (gas: 350230)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactIn() (gas: 354076)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactOut() (gas: 388035)
[@bush.fi/v3-vault]: [PASS] testRevertAddLiquidityCustomExactOutIfCustomLiquidityIsDisabled() (gas: 59371)
[@bush.fi/v3-vault]: [PASS] testRevertAddLiquiditySingleTokenExactOutIfUnbalancedLiquidityIsDisabled() (gas: 59724)
[@bush.fi/v3-vault]: [PASS] testRevertAddLiquidityUnbalancedIfUnbalancedLiquidityIsDisabled() (gas: 59583)
[@bush.fi/v3-vault]: [PASS] testRevertIfAmountInAboveMax() (gas: 71434)
[@bush.fi/v3-vault]: [PASS] testRevertIfAmountOutBelowMin() (gas: 73338)
[@bush.fi/v3-vault]: [PASS] testRevertIfBptAmountInAboveMax() (gas: 70490)
[@bush.fi/v3-vault]: [PASS] testRevertIfBptAmountOutBelowMin() (gas: 68157)
[@bush.fi/v3-vault]: [PASS] testRevertRemoveLiquidityCustomExactOutIfCustomLiquidityIsDisabled() (gas: 61530)
[@bush.fi/v3-vault]: [PASS] testRevertRemoveLiquiditySingleTokenExactOutIfUnbalancedLiquidityIsDisabled() (gas: 61914)
[@bush.fi/v3-vault]: [PASS] testRevertRemoveLiquidityUnbalancedIfUnbalancedLiquidityIsDisabled() (gas: 61738)
[@bush.fi/v3-vault]: Suite result: ok. 18 passed; 0 failed; 0 skipped; finished in 479.51ms (9.03ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 7 tests for test/foundry/unit/VaultUnitSwap.t.sol:VaultUnitSwapTest
[@bush.fi/v3-vault]: [PASS] testMakeParams() (gas: 46746)
[@bush.fi/v3-vault]: [PASS] testSwapExactInSwapLimitRevert() (gas: 70178)
[@bush.fi/v3-vault]: [PASS] testSwapExactInWithFee() (gas: 174542)
[@bush.fi/v3-vault]: [PASS] testSwapExactInWithZeroFee() (gas: 153121)
[@bush.fi/v3-vault]: [PASS] testSwapExactOutSwapLimitRevert() (gas: 69819)
[@bush.fi/v3-vault]: [PASS] testSwapExactOutWithFee() (gas: 174801)
[@bush.fi/v3-vault]: [PASS] testSwapExactOutWithZeroFee() (gas: 153016)
[@bush.fi/v3-vault]: Suite result: ok. 7 passed; 0 failed; 0 skipped; finished in 144.54ms (2.23ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 13 tests for test/foundry/RecoveryMode.t.sol:RecoveryModeTest
[@bush.fi/v3-vault]: [PASS] testDisableRecoveryModeRevert() (gas: 69522)
[@bush.fi/v3-vault]: [PASS] testDisableRecoveryModeSuccessfully() (gas: 141838)
[@bush.fi/v3-vault]: [PASS] testRecoveryModeAmountsOutBelowMin() (gas: 295361)
[@bush.fi/v3-vault]: [PASS] testRecoveryModeAmountsOutBelowMinWithRoundtripFee() (gas: 301853)
[@bush.fi/v3-vault]: [PASS] testRecoveryModeBalances() (gas: 417277)
[@bush.fi/v3-vault]: [PASS] testRecoveryModeEmitApprovalFail() (gas: 436144)
[@bush.fi/v3-vault]: [PASS] testRecoveryModeEmitTransferFail() (gas: 413610)
[@bush.fi/v3-vault]: [PASS] testRecoveryModeEmitsPoolBalanceChangedEvent() (gas: 357273)
[@bush.fi/v3-vault]: [PASS] testRecoveryModePermissionedWhenPoolPermissionless() (gas: 127374)
[@bush.fi/v3-vault]: [PASS] testRecoveryModePermissionedWhenVaultPermissionless() (gas: 143184)
[@bush.fi/v3-vault]: [PASS] testRecoveryModePermissionlessWhenPoolPaused() (gas: 88548)
[@bush.fi/v3-vault]: [PASS] testRecoveryModePermissionlessWhenVaultPaused() (gas: 104364)
[@bush.fi/v3-vault]: [PASS] testRecoveryModeWithRoundtripFee() (gas: 368035)
[@bush.fi/v3-vault]: Suite result: ok. 13 passed; 0 failed; 0 skipped; finished in 13.53s (8.03ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 15 tests for test/foundry/mutation/vault/Vault.t.sol:VaultMutationTest
[@bush.fi/v3-vault]: [PASS] testAddLiquidityReentrancy() (gas: 17577)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityWithLockedVault() (gas: 23020)
[@bush.fi/v3-vault]: [PASS] testErc4626BufferWrapOrUnwrapReentrancy() (gas: 40862)
[@bush.fi/v3-vault]: [PASS] testErc4626BufferWrapOrUnwrapWhenBuffersArePaused() (gas: 86978)
[@bush.fi/v3-vault]: [PASS] testErc4626BufferWrapOrUnwrapWhenNotInitialized() (gas: 16643)
[@bush.fi/v3-vault]: [PASS] testErc4626BufferWrapOrUnwrapWhenNotUnlocked() (gas: 10011)
[@bush.fi/v3-vault]: [PASS] testLoadPoolDataUpdatingBalancesAndYieldFeesReentrancy() (gas: 18146)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityReentrancy() (gas: 15820)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityWithLockedVault() (gas: 22547)
[@bush.fi/v3-vault]: [PASS] testSendToReentrancy() (gas: 17099)
[@bush.fi/v3-vault]: [PASS] testSendToWithLockedVault() (gas: 12533)
[@bush.fi/v3-vault]: [PASS] testSettleReentrancy() (gas: 14033)
[@bush.fi/v3-vault]: [PASS] testSettleWithLockedVault() (gas: 11099)
[@bush.fi/v3-vault]: [PASS] testSwapReentrancy() (gas: 16893)
[@bush.fi/v3-vault]: [PASS] testSwapWithLockedVault() (gas: 17221)
[@bush.fi/v3-vault]: Suite result: ok. 15 passed; 0 failed; 0 skipped; finished in 13.60s (2.39ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 4 tests for test/foundry/BatchRouter.t.sol:BatchRouterTest
[@bush.fi/v3-vault]: [PASS] testBatchRouterVersion() (gas: 12077)
[@bush.fi/v3-vault]: [PASS] testQuerySingleStepRemove() (gas: 131823)
[@bush.fi/v3-vault]: [PASS] testSwapDeadlineExactIn() (gas: 19541)
[@bush.fi/v3-vault]: [PASS] testSwapDeadlineExactOut() (gas: 20011)
[@bush.fi/v3-vault]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 13.69s (928.58µs CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 5 tests for test/foundry/VaultLiquidityFees.t.sol:VaultLiquidityWithFeesTest
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOut() (gas: 449219)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalanced() (gas: 445351)
[@bush.fi/v3-vault]: [PASS] testPrerequisites() (gas: 32617)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactIn() (gas: 517291)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactOut() (gas: 528879)
[@bush.fi/v3-vault]: Suite result: ok. 5 passed; 0 failed; 0 skipped; finished in 13.69s (4.74ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 7 tests for test/foundry/WrappedBalancerPoolToken.t.sol:WrappedBalancerPoolTokenTest
[@bush.fi/v3-vault]: [PASS] testBurn() (gas: 143354)
[@bush.fi/v3-vault]: [PASS] testBurnFrom() (gas: 166886)
[@bush.fi/v3-vault]: [PASS] testBurnFromIfVaultUnlocked() (gas: 23237)
[@bush.fi/v3-vault]: [PASS] testBurnIfVaultUnlocked() (gas: 20979)
[@bush.fi/v3-vault]: [PASS] testConstructor() (gas: 14624)
[@bush.fi/v3-vault]: [PASS] testMint() (gas: 147376)
[@bush.fi/v3-vault]: [PASS] testMintIfVaultUnlocked() (gas: 21033)
[@bush.fi/v3-vault]: Suite result: ok. 7 passed; 0 failed; 0 skipped; finished in 13.69s (1.71ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 8 tests for test/foundry/Permit2.t.sol:Permit2Test
[@bush.fi/v3-vault]: [PASS] testCustomRemoveBatchAndCall() (gas: 289709)
[@bush.fi/v3-vault]: [PASS] testEmptyBatchAndCall() (gas: 214226)
[@bush.fi/v3-vault]: [PASS] testNoPermitCall() (gas: 105290)
[@bush.fi/v3-vault]: [PASS] testPermitBatchAndCall() (gas: 417242)
[@bush.fi/v3-vault]: [PASS] testPermitBatchAndCallBubbleUpRevert() (gas: 49359)
[@bush.fi/v3-vault]: [PASS] testPermitBatchAndCallDos() (gas: 127605)
[@bush.fi/v3-vault]: [PASS] testPermitBatchAndCallMismatch() (gas: 21908)
[@bush.fi/v3-vault]: [PASS] testRecoveryModeBatchAndCall() (gas: 288925)
[@bush.fi/v3-vault]: Suite result: ok. 8 passed; 0 failed; 0 skipped; finished in 13.68s (8.31ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 8 tests for test/foundry/unit/CommonAuthentication.t.sol:CommonAuthenticationTest
[@bush.fi/v3-vault]: [PASS] testEnsureAuthenticatedByExclusiveRoleNoAuthNoManager() (gas: 35560)
[@bush.fi/v3-vault]: [PASS] testEnsureAuthenticatedByExclusiveRoleWithAuthNoManager() (gas: 61846)
[@bush.fi/v3-vault]: [PASS] testEnsureAuthenticatedByExclusiveRoleWithAuthWithManager() (gas: 39648)
[@bush.fi/v3-vault]: [PASS] testEnsureAuthenticatedByExclusiveRoleWithManager() (gas: 5701)
[@bush.fi/v3-vault]: [PASS] testEnsureAuthenticatedByRoleNoAuthNoManager() (gas: 35577)
[@bush.fi/v3-vault]: [PASS] testEnsureAuthenticatedByRoleWithAuthNoManager() (gas: 61818)
[@bush.fi/v3-vault]: [PASS] testEnsureAuthenticatedByRoleWithAuthWithManager() (gas: 61861)
[@bush.fi/v3-vault]: [PASS] testEnsureAuthenticatedByRoleWithManager() (gas: 5711)
[@bush.fi/v3-vault]: Suite result: ok. 8 passed; 0 failed; 0 skipped; finished in 13.75s (2.43ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 4 tests for test/foundry/VaultSwapRate.t.sol:VaultSwapWithRatesTest
[@bush.fi/v3-vault]: [PASS] testInitialRateProviderState() (gas: 49463)
[@bush.fi/v3-vault]: [PASS] testInitializePoolWithRate() (gas: 23108)
[@bush.fi/v3-vault]: [PASS] testSwapSingleTokenExactIWithRate() (gas: 156986)
[@bush.fi/v3-vault]: [PASS] testSwapSingleTokenExactOutWithRate() (gas: 157286)
[@bush.fi/v3-vault]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 13.79s (2.54ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 69 tests for test/foundry/mutation/vault/VaultAdmin.t.sol:VaultAdminMutationTest
[@bush.fi/v3-vault]: [PASS] testAddLiquidityFromBufferWhenNotInitialized() (gas: 25343)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityToBufferNonReentrant() (gas: 53098)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityToBufferWhenNotUnlocked() (gas: 18718)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityToBufferWhenNotVault() (gas: 9622)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityToBufferWhenPaused() (gas: 90630)
[@bush.fi/v3-vault]: [PASS] testAreBuffersPausedWhenNotVault() (gas: 8771)
[@bush.fi/v3-vault]: [PASS] testCollectAggregateFeesWhenNotProtocolFeeController() (gas: 24638)
[@bush.fi/v3-vault]: [PASS] testCollectAggregateFeesWhenNotUnlocked() (gas: 20599)
[@bush.fi/v3-vault]: [PASS] testCollectAggregateFeesWhenNotVault() (gas: 13673)
[@bush.fi/v3-vault]: [PASS] testCollectAggregateFeesWithoutRegisteredPool() (gas: 31576)
[@bush.fi/v3-vault]: [PASS] testDisableQueryPermanentlyWhenNotAuthenticated() (gas: 28097)
[@bush.fi/v3-vault]: [PASS] testDisableQueryPermanentlyWhenNotVault() (gas: 8853)
[@bush.fi/v3-vault]: [PASS] testDisableQueryWhenNotAuthenticated() (gas: 28518)
[@bush.fi/v3-vault]: [PASS] testDisableQueryWhenNotVault() (gas: 9316)
[@bush.fi/v3-vault]: [PASS] testDisableRecoveryModeNonReentrant() (gas: 78392)
[@bush.fi/v3-vault]: [PASS] testDisableRecoveryModeWhenNotAuthenticated() (gas: 32746)
[@bush.fi/v3-vault]: [PASS] testDisableRecoveryModeWhenNotVault() (gas: 11287)
[@bush.fi/v3-vault]: [PASS] testDisableRecoveryModeWithoutRegisteredPool() (gas: 20606)
[@bush.fi/v3-vault]: [PASS] testEnableQueryWhenNotAuthenticated() (gas: 28562)
[@bush.fi/v3-vault]: [PASS] testEnableQueryWhenNotVault() (gas: 9336)
[@bush.fi/v3-vault]: [PASS] testEnableRecoveryModeWhenNotVault() (gas: 11419)
[@bush.fi/v3-vault]: [PASS] testEnableRecoveryModeWithoutRegisteredPool() (gas: 20804)
[@bush.fi/v3-vault]: [PASS] testGetBufferBalanceWhenNotVault() (gas: 10861)
[@bush.fi/v3-vault]: [PASS] testGetBufferOwnerSharesWhenNotVault() (gas: 13368)
[@bush.fi/v3-vault]: [PASS] testGetBufferTotalSharesWhenNotVault() (gas: 11699)
[@bush.fi/v3-vault]: [PASS] testGetVaultPausedStateWhenNotVault() (gas: 9170)
[@bush.fi/v3-vault]: [PASS] testInitializeBufferNonReentrant() (gas: 52331)
[@bush.fi/v3-vault]: [PASS] testInitializeBufferWhenNotUnlocked() (gas: 18060)
[@bush.fi/v3-vault]: [PASS] testInitializeBufferWhenNotVault() (gas: 9040)
[@bush.fi/v3-vault]: [PASS] testInitializeBufferWhenPaused() (gas: 90016)
[@bush.fi/v3-vault]: [PASS] testIsVaultPausedWhenNotVault() (gas: 8440)
[@bush.fi/v3-vault]: [PASS] testPausePoolWhenNotAuthenticated() (gas: 34651)
[@bush.fi/v3-vault]: [PASS] testPausePoolWhenNotVault() (gas: 10869)
[@bush.fi/v3-vault]: [PASS] testPausePoolWithoutRegisteredPool() (gas: 20187)
[@bush.fi/v3-vault]: [PASS] testPauseVaultBuffersSuccessfully() (gas: 95205)
[@bush.fi/v3-vault]: [PASS] testPauseVaultBuffersWhenNotAuthenticated() (gas: 28539)
[@bush.fi/v3-vault]: [PASS] testPauseVaultBuffersWhenNotVault() (gas: 9295)
[@bush.fi/v3-vault]: [PASS] testPauseVaultSuccessfully() (gas: 87686)
[@bush.fi/v3-vault]: [PASS] testPauseVaultWhenNotAuthenticated() (gas: 28231)
[@bush.fi/v3-vault]: [PASS] testPauseVaultWhenNotVault() (gas: 9054)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityFromBufferHookWhenNotInitialized() (gas: 23125)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityFromBufferHookWhenNotUnlocked() (gas: 18597)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityFromBufferHookWhenNotVaultDelegateCall() (gas: 9012)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityFromBufferHookWhenVaultIsNotSender() (gas: 18311)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityFromBufferNonReentrant() (gas: 133388)
[@bush.fi/v3-vault]: [PASS] testSetAuthorizer() (gas: 67050)
[@bush.fi/v3-vault]: [PASS] testSetAuthorizerWhenNotAuthenticated() (gas: 29708)
[@bush.fi/v3-vault]: [PASS] testSetAuthorizerWhenNotVault() (gas: 10480)
[@bush.fi/v3-vault]: [PASS] testSetProtocolFeeControllerSuccessfully() (gas: 69479)
[@bush.fi/v3-vault]: [PASS] testSetProtocolFeeControllerWhenNotAuthenticated() (gas: 27853)
[@bush.fi/v3-vault]: [PASS] testSetProtocolFeeControllerWhenNotVault() (gas: 8625)
[@bush.fi/v3-vault]: [PASS] testSetStaticSwapFeePercentageWhenNotAuthenticated() (gas: 35158)
[@bush.fi/v3-vault]: [PASS] testSetStaticSwapFeePercentageWhenNotVault() (gas: 11387)
[@bush.fi/v3-vault]: [PASS] testSetStaticSwapFeePercentageWhenPoolPaused() (gas: 101074)
[@bush.fi/v3-vault]: [PASS] testSetStaticSwapFeePercentageWhenVaultPaused() (gas: 94149)
[@bush.fi/v3-vault]: [PASS] testSetStaticSwapFeePercentageWithoutRegisteredPool() (gas: 20764)
[@bush.fi/v3-vault]: [PASS] testUnpausePoolWhenNotAuthenticated() (gas: 35420)
[@bush.fi/v3-vault]: [PASS] testUnpausePoolWhenNotVault() (gas: 11660)
[@bush.fi/v3-vault]: [PASS] testUnpausePoolWithoutRegisteredPool() (gas: 20979)
[@bush.fi/v3-vault]: [PASS] testUnpauseVaultBuffersSuccessfully() (gas: 114573)
[@bush.fi/v3-vault]: [PASS] testUnpauseVaultBuffersWhenNotAuthenticated() (gas: 28298)
[@bush.fi/v3-vault]: [PASS] testUnpauseVaultBuffersWhenNotVault() (gas: 9096)
[@bush.fi/v3-vault]: [PASS] testUnpauseVaultSuccessfully() (gas: 111951)
[@bush.fi/v3-vault]: [PASS] testUnpauseVaultWhenNotAuthenticated() (gas: 27635)
[@bush.fi/v3-vault]: [PASS] testUnpauseVaultWhenNotVault() (gas: 8413)
[@bush.fi/v3-vault]: [PASS] testUpdateAggregateSwapFeesWhenNotProtocolFeeController() (gas: 24228)
[@bush.fi/v3-vault]: [PASS] testUpdateAggregateSwapFeesWhenNotVault() (gas: 10937)
[@bush.fi/v3-vault]: [PASS] testUpdateAggregateYieldFeesWhenNotProtocolFeeController() (gas: 24867)
[@bush.fi/v3-vault]: [PASS] testUpdateAggregateYieldFeesWhenNotVault() (gas: 11531)
[@bush.fi/v3-vault]: Suite result: ok. 69 passed; 0 failed; 0 skipped; finished in 288.48ms (14.32ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 4 tests for test/foundry/WrappedBalancerPoolTokenFactory.t.sol:WrappedBalancerPoolTokenFactoryTest
[@bush.fi/v3-vault]: [PASS] testCreateWhenPoolNotRegistered() (gas: 30828)
[@bush.fi/v3-vault]: [PASS] testCreateWithExistingWrappedToken() (gas: 1242321)
[@bush.fi/v3-vault]: [PASS] testCreateWrappedToken() (gas: 2481906)
[@bush.fi/v3-vault]: [PASS] testGetVault() (gas: 10824)
[@bush.fi/v3-vault]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 394.87ms (2.38ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 5 tests for test/foundry/BatchRouterCommon.t.sol:BatchRouterCommonTest
[@bush.fi/v3-vault]: [PASS] testCurrentSwapTokenInAmountsSlot() (gas: 9178)
[@bush.fi/v3-vault]: [PASS] testCurrentSwapTokenOutAmountsSlot() (gas: 9047)
[@bush.fi/v3-vault]: [PASS] testCurrentSwapTokensInSlot() (gas: 9304)
[@bush.fi/v3-vault]: [PASS] testCurrentSwapTokensOutSlot() (gas: 9326)
[@bush.fi/v3-vault]: [PASS] testSettledTokenAmountsSlot() (gas: 9370)
[@bush.fi/v3-vault]: Suite result: ok. 5 passed; 0 failed; 0 skipped; finished in 409.18ms (654.58µs CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 4 tests for test/foundry/VaultTokens.t.sol:VaultTokenTest
[@bush.fi/v3-vault]: [PASS] testGetRegularPoolTokens() (gas: 485897)
[@bush.fi/v3-vault]: [PASS] testInvalidRateTokenWithoutProvider() (gas: 62971)
[@bush.fi/v3-vault]: [PASS] testInvalidStandardTokenWithRateProvider() (gas: 68674)
[@bush.fi/v3-vault]: [PASS] testInvalidTokenDecimals() (gas: 564791)
[@bush.fi/v3-vault]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 405.66ms (2.24ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 10 tests for test/foundry/unit/PoolAndVaultPaused.t.sol:PoolAndVaultPausedTest
[@bush.fi/v3-vault]: [PASS] testPausedPoolAfterBufferPeriod() (gas: 28613)
[@bush.fi/v3-vault]: [PASS] testPausedPoolBeforeBufferPeriod() (gas: 19542)
[@bush.fi/v3-vault]: [PASS] testUnpausedPoolAfterBufferPeriod() (gas: 25710)
[@bush.fi/v3-vault]: [PASS] testUnpausedPoolBeforeBufferPeriod() (gas: 15860)
[@bush.fi/v3-vault]: [PASS] testVaultAndPoolUnpaused() (gas: 53537)
[@bush.fi/v3-vault]: [PASS] testVaultPausedButPoolUnpaused() (gas: 53528)
[@bush.fi/v3-vault]: [PASS] testVaultPausedByFlag() (gas: 40673)
[@bush.fi/v3-vault]: [PASS] testVaultPausedByFlagAfterBufferTime() (gas: 41929)
[@bush.fi/v3-vault]: [PASS] testVaultUnpausedButPoolPaused() (gas: 27407)
[@bush.fi/v3-vault]: [PASS] testVaultUnpausedButPoolPausedByFlagAfterBufferTime() (gas: 35852)
[@bush.fi/v3-vault]: Suite result: ok. 10 passed; 0 failed; 0 skipped; finished in 497.26ms (1.58ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 2 tests for test/foundry/unit/PoolConfigConst.t.sol:PoolConfigConstTest
[@bush.fi/v3-vault]: [PASS] testOffsets() (gas: 4831747)
[@bush.fi/v3-vault]: [PASS] testRestConstants() (gas: 4751)
[@bush.fi/v3-vault]: Suite result: ok. 2 passed; 0 failed; 0 skipped; finished in 785.33µs (703.50µs CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 41 tests for test/foundry/unit/PoolConfigLib.t.sol:PoolConfigLibTest
[@bush.fi/v3-vault]: [PASS] testGetAggregateSwapFeePercentage() (gas: 7469)
[@bush.fi/v3-vault]: [PASS] testGetAggregateYieldFeePercentage() (gas: 7669)
[@bush.fi/v3-vault]: [PASS] testGetDecimalScalingFactors() (gas: 10610)
[@bush.fi/v3-vault]: [PASS] testGetPauseWindowEndTime() (gas: 7821)
[@bush.fi/v3-vault]: [PASS] testGetStaticSwapFeePercentage() (gas: 7314)
[@bush.fi/v3-vault]: [PASS] testGetTokenDecimalDiffs() (gas: 7599)
[@bush.fi/v3-vault]: [PASS] testIsPoolInRecoveryMode() (gas: 4103)
[@bush.fi/v3-vault]: [PASS] testIsPoolInitialized() (gas: 3700)
[@bush.fi/v3-vault]: [PASS] testIsPoolPaused() (gas: 3866)
[@bush.fi/v3-vault]: [PASS] testIsPoolRegistered() (gas: 3508)
[@bush.fi/v3-vault]: [PASS] testRequireAddLiquidityCustomEnabled() (gas: 1375)
[@bush.fi/v3-vault]: [PASS] testRequireAddLiquidityCustomRevertIfIsDisabled() (gas: 3695)
[@bush.fi/v3-vault]: [PASS] testRequireDonationEnabled() (gas: 1756)
[@bush.fi/v3-vault]: [PASS] testRequireDonationRevertIfIsDisabled() (gas: 3899)
[@bush.fi/v3-vault]: [PASS] testRequireRemoveLiquidityCustomEnabled() (gas: 1534)
[@bush.fi/v3-vault]: [PASS] testRequireRemoveLiquidityCustomReveryIfIsDisabled() (gas: 3763)
[@bush.fi/v3-vault]: [PASS] testRequireUnbalancedLiquidityEnabled() (gas: 709)
[@bush.fi/v3-vault]: [PASS] testRequireUnbalancedLiquidityRevertIfIsDisabled() (gas: 4077)
[@bush.fi/v3-vault]: [PASS] testSetAddLiquidityCustom() (gas: 4511)
[@bush.fi/v3-vault]: [PASS] testSetAggregateSwapFeePercentage() (gas: 7564)
[@bush.fi/v3-vault]: [PASS] testSetAggregateSwapFeePercentageAboveMax() (gas: 3257)
[@bush.fi/v3-vault]: [PASS] testSetAggregateSwapFeePercentageAlmostMaxFee() (gas: 7542)
[@bush.fi/v3-vault]: [PASS] testSetAggregateYieldFeePercentage() (gas: 7676)
[@bush.fi/v3-vault]: [PASS] testSetAggregateYieldFeePercentageAboveMax() (gas: 3258)
[@bush.fi/v3-vault]: [PASS] testSetDisableUnbalancedLiquidity() (gas: 4313)
[@bush.fi/v3-vault]: [PASS] testSetDonation() (gas: 4851)
[@bush.fi/v3-vault]: [PASS] testSetPauseWindowEndTime() (gas: 7842)
[@bush.fi/v3-vault]: [PASS] testSetPoolInRecoveryMode() (gas: 4108)
[@bush.fi/v3-vault]: [PASS] testSetPoolInitialized() (gas: 3747)
[@bush.fi/v3-vault]: [PASS] testSetPoolPaused() (gas: 3936)
[@bush.fi/v3-vault]: [PASS] testSetPoolRegistered() (gas: 3547)
[@bush.fi/v3-vault]: [PASS] testSetRemoveLiquidityCustom() (gas: 4648)
[@bush.fi/v3-vault]: [PASS] testSetStaticSwapFeePercentage() (gas: 7406)
[@bush.fi/v3-vault]: [PASS] testSetStaticSwapFeePercentageAboveMax() (gas: 3282)
[@bush.fi/v3-vault]: [PASS] testSetTokenDecimalDiffs() (gas: 7681)
[@bush.fi/v3-vault]: [PASS] testSupportsAddLiquidityCustom() (gas: 4417)
[@bush.fi/v3-vault]: [PASS] testSupportsDonation() (gas: 4779)
[@bush.fi/v3-vault]: [PASS] testSupportsRemoveLiquidityCustom() (gas: 4665)
[@bush.fi/v3-vault]: [PASS] testSupportsUnbalancedLiquidity() (gas: 4286)
[@bush.fi/v3-vault]: [PASS] testToTokenDecimalDiffs() (gas: 5900)
[@bush.fi/v3-vault]: [PASS] testZeroConfigBytes() (gas: 22828)
[@bush.fi/v3-vault]: Suite result: ok. 41 passed; 0 failed; 0 skipped; finished in 836.21µs (690.08µs CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 24 tests for test/foundry/unit/VaultAdminUnit.t.sol:VaultAdminUnitTest
[@bush.fi/v3-vault]: [PASS] testBurnBufferSharesInvalidOwner() (gas: 20808)
[@bush.fi/v3-vault]: [PASS] testDisableQuery() (gas: 109811)
[@bush.fi/v3-vault]: [PASS] testDisableQueryPermanently() (gas: 112143)
[@bush.fi/v3-vault]: [PASS] testDisableQueryPermanentlyWhenDisabled() (gas: 179348)
[@bush.fi/v3-vault]: [PASS] testEnableQuery() (gas: 156229)
[@bush.fi/v3-vault]: [PASS] testEnableQueryIfDisabledPermanently() (gas: 150963)
[@bush.fi/v3-vault]: [PASS] testEnsurePoolNotInRecoveryMode() (gas: 16623)
[@bush.fi/v3-vault]: [PASS] testEnsurePoolNotInRecoveryModeRevert() (gas: 44883)
[@bush.fi/v3-vault]: [PASS] testInitializeBuffer() (gas: 413412)
[@bush.fi/v3-vault]: [PASS] testInitializeBufferAddressZero() (gas: 33626)
[@bush.fi/v3-vault]: [PASS] testInitializeBufferBelowMinimumShares() (gas: 94433)
[@bush.fi/v3-vault]: [PASS] testInitializeBufferTwice() (gas: 167349)
[@bush.fi/v3-vault]: [PASS] testMintBufferShares() (gas: 155634)
[@bush.fi/v3-vault]: [PASS] testMintBufferSharesBelowMinimumTotalSupply() (gas: 24715)
[@bush.fi/v3-vault]: [PASS] testMintBufferSharesInvalidReceiver() (gas: 20219)
[@bush.fi/v3-vault]: [PASS] testMintMinimumBufferSupplyReserve() (gas: 81729)
[@bush.fi/v3-vault]: [PASS] testPausePoolWhenPoolIsPaused() (gas: 67672)
[@bush.fi/v3-vault]: [PASS] testPauseVaultWhenVaultIsPaused() (gas: 64400)
[@bush.fi/v3-vault]: [PASS] testPauseWithExpiredWindow() (gas: 30583)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityFromBufferNotEnoughShares() (gas: 316461)
[@bush.fi/v3-vault]: [PASS] testUnpausePoolWhenPoolIsUnpaused() (gas: 42617)
[@bush.fi/v3-vault]: [PASS] testUnpauseVaultWhenVaultIsUnpaused() (gas: 25702)
[@bush.fi/v3-vault]: [PASS] testWithValidPercentage() (gas: 14794)
[@bush.fi/v3-vault]: [PASS] testWithValidPercentageRevert() (gas: 17825)
[@bush.fi/v3-vault]: Suite result: ok. 24 passed; 0 failed; 0 skipped; finished in 448.62ms (15.78ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 22 tests for test/foundry/unit/VaultBufferUnit.t.sol:VaultBufferUnitTest
[@bush.fi/v3-vault]: [PASS] testGetERC4626BufferAsset() (gas: 31796)
[@bush.fi/v3-vault]: [PASS] testIsERC4626BufferInitialized() (gas: 26616)
[@bush.fi/v3-vault]: [PASS] testSettleUnwrap() (gas: 82693)
[@bush.fi/v3-vault]: [PASS] testSettleUnwrapWithLessUnderlyingWithdrawn() (gas: 62923)
[@bush.fi/v3-vault]: [PASS] testSettleUnwrapWithLessWrappedBurned() (gas: 82801)
[@bush.fi/v3-vault]: [PASS] testSettleUnwrapWithMoreUnderlyingWithdrawn() (gas: 82777)
[@bush.fi/v3-vault]: [PASS] testSettleUnwrapWithMoreWrappedBurned() (gas: 66926)
[@bush.fi/v3-vault]: [PASS] testSettleWrap() (gas: 82595)
[@bush.fi/v3-vault]: [PASS] testSettleWrapWithLessUnderlyingDeposited() (gas: 82722)
[@bush.fi/v3-vault]: [PASS] testSettleWrapWithLessWrappedMinted() (gas: 66827)
[@bush.fi/v3-vault]: [PASS] testSettleWrapWithMoreUnderlyingDeposited() (gas: 62835)
[@bush.fi/v3-vault]: [PASS] testSettleWrapWithMoreWrappedMinted() (gas: 82702)
[@bush.fi/v3-vault]: [PASS] testUnderlyingImbalanceBalanceZero() (gas: 13677)
[@bush.fi/v3-vault]: [PASS] testUnderlyingImbalanceOfUnderlyingBalance() (gas: 165460)
[@bush.fi/v3-vault]: [PASS] testUnderlyingImbalanceOfWrappedBalance() (gas: 146531)
[@bush.fi/v3-vault]: [PASS] testUnwrapExactInAmountInLessThanMin() (gas: 27145)
[@bush.fi/v3-vault]: [PASS] testUnwrapExactOutAmountInLessThanMin() (gas: 68000)
[@bush.fi/v3-vault]: [PASS] testWrapExactInAmountInLessThanMin() (gas: 27134)
[@bush.fi/v3-vault]: [PASS] testWrapExactOutAmountInLessThanMin() (gas: 68010)
[@bush.fi/v3-vault]: [PASS] testWrappedImbalanceBalanceZero() (gas: 14644)
[@bush.fi/v3-vault]: [PASS] testWrappedImbalanceOfUnderlyingBalance() (gas: 147490)
[@bush.fi/v3-vault]: [PASS] testWrappedImbalanceOfWrappedBalance() (gas: 166210)
[@bush.fi/v3-vault]: Suite result: ok. 22 passed; 0 failed; 0 skipped; finished in 317.88ms (7.59ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 1 test for test/foundry/fork/YieldBearingPoolMainnetAave.t.sol:YieldBearingPoolMainnetAaveTest
[@bush.fi/v3-vault]: [PASS] testSwapPreconditions__Fork() (gas: 208750)
[@bush.fi/v3-vault]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 7.53s (2.51ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 2 tests for test/foundry/PoolData.t.sol:PoolDataTest
[@bush.fi/v3-vault]: [PASS] testPoolData__Fuzz(uint256,uint256,bool) (runs: 10001, μ: 112663, ~: 112662)
[@bush.fi/v3-vault]: [PASS] testSyncPoolBalancesAndFees() (gas: 88554)
[@bush.fi/v3-vault]: Suite result: ok. 2 passed; 0 failed; 0 skipped; finished in 11.09s (10.63s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 1 test for test/foundry/PoolDonation.t.sol:PoolDonationTest
[@bush.fi/v3-vault]: [PASS] testUnbalancedDonationToPool() (gas: 372784)
[@bush.fi/v3-vault]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 335.79ms (4.35ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 8 tests for test/foundry/PoolPause.t.sol:PoolPauseTest
[@bush.fi/v3-vault]: [PASS] testCannotPauseIfNotManager() (gas: 65690)
[@bush.fi/v3-vault]: [PASS] testCannotPausePermissionlessPool() (gas: 66296)
[@bush.fi/v3-vault]: [PASS] testGovernancePause() (gas: 100813)
[@bush.fi/v3-vault]: [PASS] testHasPauseManager() (gas: 34937)
[@bush.fi/v3-vault]: [PASS] testInfinitePausePool() (gas: 79789)
[@bush.fi/v3-vault]: [PASS] testInvalidDuration() (gas: 61179)
[@bush.fi/v3-vault]: [PASS] testPauseManagerCanPause() (gas: 51725)
[@bush.fi/v3-vault]: [PASS] testPoolFactory() (gas: 17332)
[@bush.fi/v3-vault]: Suite result: ok. 8 passed; 0 failed; 0 skipped; finished in 643.40ms (95.08ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 5 tests for test/foundry/PoolSwapManager.t.sol:PoolSwapManagerTest
[@bush.fi/v3-vault]: [PASS] testCannotSetSwapFeePercentageIfNotManager() (gas: 39197)
[@bush.fi/v3-vault]: [PASS] testGovernanceCanSetSwapFeeIfNoManager() (gas: 125978)
[@bush.fi/v3-vault]: [PASS] testGovernanceCannotSetSwapFeeWithManager() (gas: 76156)
[@bush.fi/v3-vault]: [PASS] testHasSwapFeeManager() (gas: 45016)
[@bush.fi/v3-vault]: [PASS] testSwapFeeManagerCanSetFees() (gas: 48413)
[@bush.fi/v3-vault]: Suite result: ok. 5 passed; 0 failed; 0 skipped; finished in 584.03ms (1.03ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 1 test for test/foundry/fork/YieldBearingPoolMainnetAave2.t.sol:YieldBearingPoolMainnetAave2Test
[@bush.fi/v3-vault]: [PASS] testSwapPreconditions__Fork() (gas: 208750)
[@bush.fi/v3-vault]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 6.89s (2.35ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 16 tests for test/foundry/unit/VaultUnit.t.sol:VaultUnitTest
[@bush.fi/v3-vault]: [PASS] testBuildPoolSwapParams() (gas: 24734)
[@bush.fi/v3-vault]: [PASS] testComputeAmountGivenScaled18ExactIn__Fuzz(uint256,uint256,uint256) (runs: 10001, μ: 24049, ~: 24212)
[@bush.fi/v3-vault]: [PASS] testComputeAmountGivenScaled18ExactOut__Fuzz(uint256,uint256,uint256) (runs: 10001, μ: 24584, ~: 24754)
[@bush.fi/v3-vault]: [PASS] testComputeAndChargeAggregateSwapFeeIfPoolIsInRecoveryMode() (gas: 70314)
[@bush.fi/v3-vault]: [PASS] testComputeAndChargeAggregateSwapFees__Fuzz(uint256,uint256) (runs: 10001, μ: 79688, ~: 79429)
[@bush.fi/v3-vault]: [PASS] testFeeConstants() (gas: 4526)
[@bush.fi/v3-vault]: [PASS] testLoadSwapState() (gas: 34295)
[@bush.fi/v3-vault]: [PASS] testManualUpdatePoolDataLiveBalancesAndRates() (gas: 166984)
[@bush.fi/v3-vault]: [PASS] testMinimumSwapAmount() (gas: 25472)
[@bush.fi/v3-vault]: [PASS] testMinimumTradeAmountBelowMinimum() (gas: 19600)
[@bush.fi/v3-vault]: [PASS] testMinimumTradeAmountWithZero() (gas: 17726)
[@bush.fi/v3-vault]: [PASS] testPoolGetTokenCountAndIndexOfToken() (gas: 239649)
[@bush.fi/v3-vault]: [PASS] testPoolGetTokenCountAndIndexOfTokenNotRegistered() (gas: 17202)
[@bush.fi/v3-vault]: [PASS] testSettleNegative() (gas: 40290)
[@bush.fi/v3-vault]: [PASS] testSettle__Fuzz(uint256,uint256,uint256) (runs: 10001, μ: 110486, ~: 110310)
[@bush.fi/v3-vault]: [PASS] testWritePoolBalancesToStorage() (gas: 130170)
[@bush.fi/v3-vault]: Suite result: ok. 16 passed; 0 failed; 0 skipped; finished in 19.17s (19.03s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 13 tests for test/foundry/Registration.t.sol:RegistrationTest
[@bush.fi/v3-vault]: [PASS] testRegisterEmitsEvents() (gas: 305085)
[@bush.fi/v3-vault]: [PASS] testRegisterPoolAboveMaxTokens() (gas: 39806)
[@bush.fi/v3-vault]: [PASS] testRegisterPoolAddressPoolToken() (gas: 43060)
[@bush.fi/v3-vault]: [PASS] testRegisterPoolAddressZeroToken() (gas: 45865)
[@bush.fi/v3-vault]: [PASS] testRegisterPoolBelowMinTokens() (gas: 32795)
[@bush.fi/v3-vault]: [PASS] testRegisterPoolSameAddressToken() (gas: 94059)
[@bush.fi/v3-vault]: [PASS] testRegisterPoolTokensNotSorted() (gas: 97595)
[@bush.fi/v3-vault]: [PASS] testRegisterPoolTwice() (gas: 229791)
[@bush.fi/v3-vault]: [PASS] testRegisterSetPauseWindowEndTime__Fuzz(uint32) (runs: 10001, μ: 228805, ~: 228805)
[@bush.fi/v3-vault]: [PASS] testRegisterSetSwapFeePercentageAboveMax() (gas: 205567)
[@bush.fi/v3-vault]: [PASS] testRegisterSetSwapFeePercentage__Fuzz(uint256) (runs: 10001, μ: 228905, ~: 228574)
[@bush.fi/v3-vault]: [PASS] testRegisterSetTokenDecimalDiffs__Fuzz(uint256) (runs: 10001, μ: 238871, ~: 239031)
[@bush.fi/v3-vault]: [PASS] testRegisterSetWrongTokenDecimalDiffs() (gas: 52663)
[@bush.fi/v3-vault]: Suite result: ok. 13 passed; 0 failed; 0 skipped; finished in 20.00s (19.65s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 29 tests for test/foundry/mutation/router/Router.t.sol:RouterMutationTest
[@bush.fi/v3-vault]: [PASS] testAddLiquidityHookReentrancy() (gas: 10453)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityHookWhenNotVault() (gas: 21751)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityToBufferHookReentrancy() (gas: 9518)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityToBufferHookWhenNotVault() (gas: 9193)
[@bush.fi/v3-vault]: [PASS] testInitializeBufferHookReentrancy() (gas: 9851)
[@bush.fi/v3-vault]: [PASS] testInitializeBufferHookWhenNotVault() (gas: 9406)
[@bush.fi/v3-vault]: [PASS] testInitializeHookReentrancy() (gas: 10334)
[@bush.fi/v3-vault]: [PASS] testInitializeHookWhenNotVault() (gas: 30269)
[@bush.fi/v3-vault]: [PASS] testQueryAddLiquidityCustomSaveSender() (gas: 208308)
[@bush.fi/v3-vault]: [PASS] testQueryAddLiquidityHookWhenNotVault() (gas: 22226)
[@bush.fi/v3-vault]: [PASS] testQueryAddLiquidityProportionalSaveSender() (gas: 202393)
[@bush.fi/v3-vault]: [PASS] testQueryAddLiquiditySingleTokenExactOutSaveSender() (gas: 201047)
[@bush.fi/v3-vault]: [PASS] testQueryAddLiquidityUnbalancedSaveSender() (gas: 210688)
[@bush.fi/v3-vault]: [PASS] testQueryRemoveLiquidityCustomSaveSender() (gas: 183816)
[@bush.fi/v3-vault]: [PASS] testQueryRemoveLiquidityHookWhenNotVault() (gas: 21920)
[@bush.fi/v3-vault]: [PASS] testQueryRemoveLiquidityProportionalSaveSender() (gas: 182062)
[@bush.fi/v3-vault]: [PASS] testQueryRemoveLiquidityRecoveryHookWhenNoVault() (gas: 13534)
[@bush.fi/v3-vault]: [PASS] testQueryRemoveLiquiditySingleTokenExactInSaveSender() (gas: 177321)
[@bush.fi/v3-vault]: [PASS] testQueryRemoveLiquiditySingleTokenExactOutSaveSender() (gas: 189007)
[@bush.fi/v3-vault]: [PASS] testQuerySwapHookReentrancy() (gas: 11491)
[@bush.fi/v3-vault]: [PASS] testQuerySwapHookWhenNotVault() (gas: 21625)
[@bush.fi/v3-vault]: [PASS] testQuerySwapSingleTokenExactInSaveSender() (gas: 156950)
[@bush.fi/v3-vault]: [PASS] testQuerySwapSingleTokenExactOutSaveSender() (gas: 157114)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityHookReentrancy() (gas: 11532)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityHookWhenNotVault() (gas: 15723)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityRecoveryHookReentrancy() (gas: 11960)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityRecoveryHookWhenNotVault() (gas: 19404)
[@bush.fi/v3-vault]: [PASS] testSwapSingleTokenHookReentrancy() (gas: 11616)
[@bush.fi/v3-vault]: [PASS] testSwapSingleTokenHookWhenNotVault() (gas: 21481)
[@bush.fi/v3-vault]: Suite result: ok. 29 passed; 0 failed; 0 skipped; finished in 353.95ms (7.56ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 1 test for test/foundry/fork/YieldBearingPoolMainnetFrax.t.sol:YieldBearingPoolMainnetFraxTest
[@bush.fi/v3-vault]: [PASS] testSwapPreconditions__Fork() (gas: 184654)
[@bush.fi/v3-vault]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 6.24s (957.63µs CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 1 test for test/foundry/fork/YieldBearingPoolMainnetGearbox.t.sol:YieldBearingPoolMainnetGearboxTest
[@bush.fi/v3-vault]: [PASS] testSwapPreconditions__Fork() (gas: 173670)
[@bush.fi/v3-vault]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 6.06s (834.25µs CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 1 test for test/foundry/BigPoolData.t.sol:BigPoolDataTest
[@bush.fi/v3-vault]: [PASS] testPoolData__Fuzz(uint256[8],bool) (runs: 10001, μ: 339726, ~: 340096)
[@bush.fi/v3-vault]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 27.57s (26.76s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 4 tests for test/foundry/BufferDoSProtection.t.sol:BufferDoSProtectionTest
[@bush.fi/v3-vault]: [PASS] testDepositDoS() (gas: 547878)
[@bush.fi/v3-vault]: [PASS] testMintDoS() (gas: 550778)
[@bush.fi/v3-vault]: [PASS] testRedeemDoS() (gas: 564449)
[@bush.fi/v3-vault]: [PASS] testWithdrawDoS() (gas: 566825)
[@bush.fi/v3-vault]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 128.12ms (6.13ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 30 tests for test/foundry/BalancerPoolTokenTest.t.sol:BalancerPoolTokenTest
[@bush.fi/v3-vault]: [PASS] testApprove() (gas: 112379)
[@bush.fi/v3-vault]: [PASS] testBurn() (gas: 86460)
[@bush.fi/v3-vault]: [PASS] testEmitApproval() (gas: 17074)
[@bush.fi/v3-vault]: [PASS] testEmitApprovalRevertIfCallerIsNotVault() (gas: 11165)
[@bush.fi/v3-vault]: [PASS] testEmitTransfer() (gas: 16941)
[@bush.fi/v3-vault]: [PASS] testEmitTransferRevertIfCallerIsNotVault() (gas: 11001)
[@bush.fi/v3-vault]: [PASS] testGetRate() (gas: 384510)
[@bush.fi/v3-vault]: [PASS] testGetRatePoolNotInitialized() (gas: 21706)
[@bush.fi/v3-vault]: [PASS] testGetVault() (gas: 11310)
[@bush.fi/v3-vault]: [PASS] testMetadata() (gas: 18906)
[@bush.fi/v3-vault]: [PASS] testMint() (gas: 76765)
[@bush.fi/v3-vault]: [PASS] testOverrideRate() (gas: 32126)
[@bush.fi/v3-vault]: [PASS] testPermit() (gas: 87373)
[@bush.fi/v3-vault]: [PASS] testPermitPastDeadline__Fuzz(uint248,address,uint256,uint256) (runs: 10001, μ: 17215, ~: 17515)
[@bush.fi/v3-vault]: [PASS] testPermitRevokedNonce() (gas: 98572)
[@bush.fi/v3-vault]: [PASS] testPermit__Fuzz(uint248,address,uint256,uint256) (runs: 10001, μ: 90665, ~: 90613)
[@bush.fi/v3-vault]: [PASS] testRevertsWhenPermitBadDeadline() (gas: 42052)
[@bush.fi/v3-vault]: [PASS] testRevertsWhenPermitBadDeadline__Fuzz(uint248,address,uint256,uint256) (runs: 10001, μ: 17198, ~: 17275)
[@bush.fi/v3-vault]: [PASS] testRevertsWhenPermitBadNonce() (gas: 41970)
[@bush.fi/v3-vault]: [PASS] testRevertsWhenPermitBadNonce__Fuzz(uint256,address,uint256,uint256,uint256) (runs: 10001, μ: 43572, ~: 43271)
[@bush.fi/v3-vault]: [PASS] testRevertsWhenPermitPastDeadline() (gas: 15947)
[@bush.fi/v3-vault]: [PASS] testRevertsWhenPermitReplay() (gas: 84808)
[@bush.fi/v3-vault]: [PASS] testRevertsWhenPermitReplay__Fuzz(uint248,address,uint256,uint256) (runs: 10001, μ: 85432, ~: 85368)
[@bush.fi/v3-vault]: [PASS] testRevertsWhenPermitRevokedNonceV1() (gas: 43667)
[@bush.fi/v3-vault]: [PASS] testRevertsWhenPermitRevokedNonceV2() (gas: 52522)
[@bush.fi/v3-vault]: [PASS] testRevokePermit() (gas: 89090)
[@bush.fi/v3-vault]: [PASS] testRevokePermitOperation() (gas: 87058)
[@bush.fi/v3-vault]: [PASS] testSupportsIERC165() (gas: 8631)
[@bush.fi/v3-vault]: [PASS] testTransfer() (gas: 103686)
[@bush.fi/v3-vault]: [PASS] testTransferFrom() (gas: 128764)
[@bush.fi/v3-vault]: Suite result: ok. 30 passed; 0 failed; 0 skipped; finished in 42.92s (29.39s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 10 tests for test/foundry/BaseHooks.t.sol:BaseHooksTest
[@bush.fi/v3-vault]: [PASS] testOnAfterAddLiquidity() (gas: 15080)
[@bush.fi/v3-vault]: [PASS] testOnAfterInitialize() (gas: 12314)
[@bush.fi/v3-vault]: [PASS] testOnAfterRemoveLiquidity() (gas: 14995)
[@bush.fi/v3-vault]: [PASS] testOnAfterSwap() (gas: 12942)
[@bush.fi/v3-vault]: [PASS] testOnBeforeAddLiquidity() (gas: 13207)
[@bush.fi/v3-vault]: [PASS] testOnBeforeInitialize() (gas: 12214)
[@bush.fi/v3-vault]: [PASS] testOnBeforeRemoveLiquidity() (gas: 13251)
[@bush.fi/v3-vault]: [PASS] testOnBeforeSwap() (gas: 12182)
[@bush.fi/v3-vault]: [PASS] testOnComputeDynamicSwapFeePercentage() (gas: 12986)
[@bush.fi/v3-vault]: [PASS] testOnRegister() (gas: 12090)
[@bush.fi/v3-vault]: Suite result: ok. 10 passed; 0 failed; 0 skipped; finished in 464.38ms (2.39ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 4 tests for test/foundry/mutation/router/BatchRouter.t.sol:BatchRouterMutationTest
[@bush.fi/v3-vault]: [PASS] testQuerySwapExactInHookWhenNotVault() (gas: 12769)
[@bush.fi/v3-vault]: [PASS] testQuerySwapExactOutWhenNotVault() (gas: 12747)
[@bush.fi/v3-vault]: [PASS] testSwapExactInHookWhenNotVault() (gas: 12521)
[@bush.fi/v3-vault]: [PASS] testSwapExactOutHookWhenNotVault() (gas: 12830)
[@bush.fi/v3-vault]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 242.64ms (617.42µs CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 2 tests for test/foundry/AuxiliaryEvent.t.sol:AuxiliaryEventTest
[@bush.fi/v3-vault]: [PASS] testEventEmitted() (gas: 25576)
[@bush.fi/v3-vault]: [PASS] testWithNonPoolCall() (gas: 19710)
[@bush.fi/v3-vault]: Suite result: ok. 2 passed; 0 failed; 0 skipped; finished in 260.92ms (746.71µs CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 3 tests for test/foundry/ProtocolFeeExemption.t.sol:ProtocolFeeExemptionTest
[@bush.fi/v3-vault]: [PASS] testPrerequisites() (gas: 18215)
[@bush.fi/v3-vault]: [PASS] testProtocolFeesWithoutExemption() (gas: 2175527)
[@bush.fi/v3-vault]: [PASS] testWithProtocolFeeExemption() (gas: 2167100)
[@bush.fi/v3-vault]: Suite result: ok. 3 passed; 0 failed; 0 skipped; finished in 175.51ms (86.83ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 5 tests for test/foundry/QueryERC4626Buffer.t.sol:QueryERC4626BufferTest
[@bush.fi/v3-vault]: [PASS] testERC4626BufferPreconditions() (gas: 192903)
[@bush.fi/v3-vault]: [PASS] testQuerySwapOutOfBufferRangeExactIn() (gas: 458684)
[@bush.fi/v3-vault]: [PASS] testQuerySwapOutOfBufferRangeExactOut() (gas: 474666)
[@bush.fi/v3-vault]: [PASS] testQuerySwapWithinBufferRangeExactIn() (gas: 391041)
[@bush.fi/v3-vault]: [PASS] testQuerySwapWithinBufferRangeExactOut() (gas: 401991)
[@bush.fi/v3-vault]: Suite result: ok. 5 passed; 0 failed; 0 skipped; finished in 195.47ms (4.40ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 1 test for test/foundry/fork/YieldBearingPoolMainnetMorpho.t.sol:YieldBearingPoolMainnetMorphoTest
[@bush.fi/v3-vault]: [PASS] testSwapPreconditions__Fork() (gas: 441778)
[@bush.fi/v3-vault]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 4.11s (3.81ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 1 test for test/foundry/RateProvider.t.sol:RateProviderTest
[@bush.fi/v3-vault]: [PASS] testRate__Fuzz(uint256) (runs: 10001, μ: 17652, ~: 17334)
[@bush.fi/v3-vault]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 1.02s (1.01s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 1 test for test/foundry/fork/YieldBearingPoolMainnetMorpho2.t.sol:YieldBearingPoolMainnetMorpho2Test
[@bush.fi/v3-vault]: [PASS] testSwapPreconditions__Fork() (gas: 445166)
[@bush.fi/v3-vault]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 5.72s (5.61ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 1 test for test/foundry/fork/YieldBearingPoolMainnetYearn.t.sol:YieldBearingPoolMainnetYearnTest
[@bush.fi/v3-vault]: [PASS] testSwapPreconditions__Fork() (gas: 207734)
[@bush.fi/v3-vault]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 4.40s (1.96ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 13 tests for test/foundry/unit/VaultCommonBasicFunctions.t.sol:VaultCommonBasicFunctionsTest
[@bush.fi/v3-vault]: [PASS] testAccountDeltaNonZeroDown__Fuzz(int256,uint256) (runs: 10001, μ: 47432, ~: 47320)
[@bush.fi/v3-vault]: [PASS] testAccountDeltaNonZeroUp__Fuzz(int256) (runs: 10001, μ: 35908, ~: 35908)
[@bush.fi/v3-vault]: [PASS] testFindTokenIndexNotRegistered__Fuzz(address[8],uint256) (runs: 10001, μ: 21730, ~: 22190)
[@bush.fi/v3-vault]: [PASS] testFindTokenIndex__Fuzz(address[8],uint256,uint256) (runs: 10000, μ: 20175, ~: 19724)
[@bush.fi/v3-vault]: [PASS] testGetPoolTokenInfo__Fuzz(uint256,uint256,uint256,uint8,uint8,uint8) (runs: 10001, μ: 418799, ~: 419058)
[@bush.fi/v3-vault]: [PASS] testNonEmptyPoolConfig() (gas: 268785)
[@bush.fi/v3-vault]: [PASS] testNonEmptyPoolTokenBalance() (gas: 408863)
[@bush.fi/v3-vault]: [PASS] testSetStaticSwapFeePercentageOutsideBounds() (gas: 43625)
[@bush.fi/v3-vault]: [PASS] testSetStaticSwapFeePercentage__Fuzz(uint256) (runs: 10001, μ: 52968, ~: 53015)
[@bush.fi/v3-vault]: [PASS] testSupplyCreditNonZeroDown__Fuzz(int256,uint256) (runs: 10001, μ: 47365, ~: 47179)
[@bush.fi/v3-vault]: [PASS] testSupplyCreditNonZeroUp__Fuzz(uint256) (runs: 10001, μ: 39608, ~: 39383)
[@bush.fi/v3-vault]: [PASS] testTakeDebtNonZeroDown__Fuzz(int256,uint256) (runs: 10001, μ: 46638, ~: 46464)
[@bush.fi/v3-vault]: [PASS] testTakeDebtNonZeroUp__Fuzz(uint256) (runs: 10001, μ: 38707, ~: 38480)
[@bush.fi/v3-vault]: Suite result: ok. 13 passed; 0 failed; 0 skipped; finished in 47.00s (46.57s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 1 test for test/foundry/fork/YieldBearingPoolSepoliaAave.t.sol:YieldBearingPoolSepoliaAaveTest
[@bush.fi/v3-vault]: [PASS] testSwapPreconditions__Fork() (gas: 208370)
[@bush.fi/v3-vault]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 6.87s (1.22ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 4 tests for test/foundry/unit/VaultCommonModifiers.t.sol:VaultCommonModifiersTest
[@bush.fi/v3-vault]: [PASS] testInitializedPool() (gas: 13030)
[@bush.fi/v3-vault]: [PASS] testLock() (gas: 12173)
[@bush.fi/v3-vault]: [PASS] testUninitializedPool() (gas: 19137)
[@bush.fi/v3-vault]: [PASS] testUnlock() (gas: 9091)
[@bush.fi/v3-vault]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 451.40ms (583.92µs CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 9 tests for test/foundry/YieldBearingPools.t.sol:YieldBearingPoolsTest
[@bush.fi/v3-vault]: [PASS] testAddLiquidityEvents() (gas: 262957)
[@bush.fi/v3-vault]: [PASS] testERC4626BufferPreconditions() (gas: 192881)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityEvents() (gas: 265687)
[@bush.fi/v3-vault]: [PASS] testYieldBearingPoolSwapOutOfBufferRangeExactIn() (gas: 426906)
[@bush.fi/v3-vault]: [PASS] testYieldBearingPoolSwapOutOfBufferRangeExactOut() (gas: 440971)
[@bush.fi/v3-vault]: [PASS] testYieldBearingPoolSwapUnbalancedBufferExactIn() (gas: 531082)
[@bush.fi/v3-vault]: [PASS] testYieldBearingPoolSwapUnbalancedBufferExactOut() (gas: 537670)
[@bush.fi/v3-vault]: [PASS] testYieldBearingPoolSwapWithinBufferRangeExactIn() (gas: 366041)
[@bush.fi/v3-vault]: [PASS] testYieldBearingPoolSwapWithinBufferRangeExactOut() (gas: 369272)
[@bush.fi/v3-vault]: Suite result: ok. 9 passed; 0 failed; 0 skipped; finished in 409.65ms (9.64ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 10 tests for test/foundry/VaultDefaultHandlers.t.sol:VaultDefaultHandlersTest
[@bush.fi/v3-vault]: [PASS] testAdminFallback() (gas: 9522)
[@bush.fi/v3-vault]: [PASS] testDefaultHandler() (gas: 14450)
[@bush.fi/v3-vault]: [PASS] testDefaultHandlerNonExistentFunction() (gas: 18410)
[@bush.fi/v3-vault]: [PASS] testDefaultHandlerWithEth() (gas: 19968)
[@bush.fi/v3-vault]: [PASS] testOnlyVault() (gas: 22810)
[@bush.fi/v3-vault]: [PASS] testReceiveVault() (gas: 17157)
[@bush.fi/v3-vault]: [PASS] testReceiveVaultAdmin() (gas: 17173)
[@bush.fi/v3-vault]: [PASS] testReceiveVaultExtension() (gas: 17180)
[@bush.fi/v3-vault]: [PASS] testSendEthNowhereAdmin() (gas: 16161)
[@bush.fi/v3-vault]: [PASS] testSendEthNowhereExtension() (gas: 15859)
[@bush.fi/v3-vault]: Suite result: ok. 10 passed; 0 failed; 0 skipped; finished in 598.65ms (3.07ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 51 tests for test/foundry/VaultExplorer.t.sol:VaultExplorerTest
[@bush.fi/v3-vault]: [PASS] testAddLiquidityFlag() (gas: 32924)
[@bush.fi/v3-vault]: [PASS] testAllowance() (gas: 50917)
[@bush.fi/v3-vault]: [PASS] testAreBuffersPaused() (gas: 100200)
[@bush.fi/v3-vault]: [PASS] testBalanceOf() (gas: 33379)
[@bush.fi/v3-vault]: [PASS] testCollectAggregateFees() (gas: 525007)
[@bush.fi/v3-vault]: [PASS] testComputeDynamicSwapFeePercentage() (gas: 68425)
[@bush.fi/v3-vault]: [PASS] testEnableRecoveryMode() (gas: 107939)
[@bush.fi/v3-vault]: [PASS] testGetAggregateFeePercentages() (gas: 312108)
[@bush.fi/v3-vault]: [PASS] testGetAggregateSwapFeeAmount() (gas: 58056)
[@bush.fi/v3-vault]: [PASS] testGetAggregateYieldFeeAmount() (gas: 56385)
[@bush.fi/v3-vault]: [PASS] testGetBptRate() (gas: 92431)
[@bush.fi/v3-vault]: [PASS] testGetBufferAsset() (gas: 317876)
[@bush.fi/v3-vault]: [PASS] testGetBufferBalance() (gas: 329077)
[@bush.fi/v3-vault]: [PASS] testGetBufferMinimumTotalSupply() (gas: 28338)
[@bush.fi/v3-vault]: [PASS] testGetBufferOwnerShares() (gas: 320623)
[@bush.fi/v3-vault]: [PASS] testGetBufferPeriodDuration() (gas: 28403)
[@bush.fi/v3-vault]: [PASS] testGetBufferPeriodEndTime() (gas: 30597)
[@bush.fi/v3-vault]: [PASS] testGetBufferTotalShares() (gas: 329316)
[@bush.fi/v3-vault]: [PASS] testGetCurrentLiveBalances() (gas: 104350)
[@bush.fi/v3-vault]: [PASS] testGetHooksConfig() (gas: 56636)
[@bush.fi/v3-vault]: [PASS] testGetMaximumPoolTokens() (gas: 28463)
[@bush.fi/v3-vault]: [PASS] testGetMinimumPoolTokens() (gas: 29835)
[@bush.fi/v3-vault]: [PASS] testGetMinimumTradeAmount() (gas: 30917)
[@bush.fi/v3-vault]: [PASS] testGetMinimumWrapAmount() (gas: 28707)
[@bush.fi/v3-vault]: [PASS] testGetPauseWindowEndTime() (gas: 29700)
[@bush.fi/v3-vault]: [PASS] testGetPoolConfig() (gas: 81605)
[@bush.fi/v3-vault]: [PASS] testGetPoolData() (gas: 113312)
[@bush.fi/v3-vault]: [PASS] testGetPoolMinimumTotalSupply() (gas: 30481)
[@bush.fi/v3-vault]: [PASS] testGetPoolPausedState() (gas: 80760)
[@bush.fi/v3-vault]: [PASS] testGetPoolRoleAccounts() (gas: 43376)
[@bush.fi/v3-vault]: [PASS] testGetPoolTokenCountAndIndexOfToken() (gas: 55043)
[@bush.fi/v3-vault]: [PASS] testGetPoolTokenInfo() (gas: 81755)
[@bush.fi/v3-vault]: [PASS] testGetPoolTokenRates() (gas: 76800)
[@bush.fi/v3-vault]: [PASS] testGetPoolTokens() (gas: 51743)
[@bush.fi/v3-vault]: [PASS] testGetReservesOf() (gas: 54597)
[@bush.fi/v3-vault]: [PASS] testGetStaticSwapFeePercentage() (gas: 42976)
[@bush.fi/v3-vault]: [PASS] testGetTokenDelta() (gas: 65803)
[@bush.fi/v3-vault]: [PASS] testGetVaultContracts() (gas: 55584)
[@bush.fi/v3-vault]: [PASS] testGetVaultPausedState() (gas: 69155)
[@bush.fi/v3-vault]: [PASS] testIsERC4626BufferInitialized() (gas: 318538)
[@bush.fi/v3-vault]: [PASS] testIsPoolInRecoveryMode() (gas: 82651)
[@bush.fi/v3-vault]: [PASS] testIsPoolPaused() (gas: 66775)
[@bush.fi/v3-vault]: [PASS] testIsQueryDisabled() (gas: 103623)
[@bush.fi/v3-vault]: [PASS] testIsQueryDisabledPermanently() (gas: 98710)
[@bush.fi/v3-vault]: [PASS] testIsVaultPaused() (gas: 68134)
[@bush.fi/v3-vault]: [PASS] testNonzeroDeltaCount() (gas: 28935)
[@bush.fi/v3-vault]: [PASS] testPoolInitialization() (gas: 2373979)
[@bush.fi/v3-vault]: [PASS] testPoolRegistration() (gas: 2156863)
[@bush.fi/v3-vault]: [PASS] testPoolTokenCount() (gas: 35323)
[@bush.fi/v3-vault]: [PASS] testTotalSupply() (gas: 30319)
[@bush.fi/v3-vault]: [PASS] testUnlocked() (gas: 27470)
[@bush.fi/v3-vault]: Suite result: ok. 51 passed; 0 failed; 0 skipped; finished in 1.62s (111.98ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 43 tests for test/foundry/mutation/vault/VaultExtension.t.sol:VaultExtensionMutationTest
[@bush.fi/v3-vault]: [PASS] testAllowanceWhenNotVault() (gas: 11116)
[@bush.fi/v3-vault]: [PASS] testApproveWhenNotVault() (gas: 9370)
[@bush.fi/v3-vault]: [PASS] testBalanceOfWhenNotVault() (gas: 11505)
[@bush.fi/v3-vault]: [PASS] testComputeDynamicSwapFeePercentageWhenNotInitialized() (gas: 18464)
[@bush.fi/v3-vault]: [PASS] testComputeDynamicSwapFeePercentageWhenNotVault() (gas: 12811)
[@bush.fi/v3-vault]: [PASS] testEmitAuxiliaryEventWhenNotRegisteredPool() (gas: 17058)
[@bush.fi/v3-vault]: [PASS] testEmitAuxiliaryEventWhenNotVault() (gas: 9355)
[@bush.fi/v3-vault]: [PASS] testGetAggregateSwapFeeAmountWhenNotVault() (gas: 13094)
[@bush.fi/v3-vault]: [PASS] testGetAggregateYieldFeeAmountWhenNotVault() (gas: 12748)
[@bush.fi/v3-vault]: [PASS] testGetAuthorizerWhenNotVault() (gas: 8917)
[@bush.fi/v3-vault]: [PASS] testGetBptRateWhenNotVault() (gas: 10646)
[@bush.fi/v3-vault]: [PASS] testGetCurrentLiveBalancesWhenNotVault() (gas: 12756)
[@bush.fi/v3-vault]: [PASS] testGetERC4626BufferAssetWhenNotVault() (gas: 8517)
[@bush.fi/v3-vault]: [PASS] testGetHooksConfigWhenNotVault() (gas: 13514)
[@bush.fi/v3-vault]: [PASS] testGetNonzeroDeltaCountWhenNotVault() (gas: 9083)
[@bush.fi/v3-vault]: [PASS] testGetPoolConfigWhenNotVault() (gas: 13957)
[@bush.fi/v3-vault]: [PASS] testGetPoolDataWhenNotVault() (gas: 15201)
[@bush.fi/v3-vault]: [PASS] testGetPoolPausedStateWhenNotVault() (gas: 10855)
[@bush.fi/v3-vault]: [PASS] testGetPoolRoleAccountsWhenNotVault() (gas: 12769)
[@bush.fi/v3-vault]: [PASS] testGetPoolTokenInfoWhenNotVault() (gas: 14120)
[@bush.fi/v3-vault]: [PASS] testGetPoolTokenRatesWhenNotVault() (gas: 13319)
[@bush.fi/v3-vault]: [PASS] testGetPoolTokensWhenNotVault() (gas: 13252)
[@bush.fi/v3-vault]: [PASS] testGetProtocolFeeControllerWhenNotVault() (gas: 8784)
[@bush.fi/v3-vault]: [PASS] testGetReservesOfWhenNotVault() (gas: 10969)
[@bush.fi/v3-vault]: [PASS] testGetStaticSwapFeePercentageWhenNotVault() (gas: 11034)
[@bush.fi/v3-vault]: [PASS] testGetTokenDeltaWhenNotVault() (gas: 11004)
[@bush.fi/v3-vault]: [PASS] testInitializeReentrancy() (gas: 28069)
[@bush.fi/v3-vault]: [PASS] testInitializeWhenNotVault() (gas: 13028)
[@bush.fi/v3-vault]: [PASS] testIsERC4626BufferInitializedWhenNotVault() (gas: 8677)
[@bush.fi/v3-vault]: [PASS] testIsPoolInRecoveryModeWhenNotVault() (gas: 11182)
[@bush.fi/v3-vault]: [PASS] testIsPoolInitializedWhenNotVault() (gas: 10729)
[@bush.fi/v3-vault]: [PASS] testIsPoolPausedWhenNotVault() (gas: 10830)
[@bush.fi/v3-vault]: [PASS] testIsPoolRegisteredWhenNotVault() (gas: 11192)
[@bush.fi/v3-vault]: [PASS] testIsQueryDisabledWhenNotVault() (gas: 9020)
[@bush.fi/v3-vault]: [PASS] testIsUnlockedWhenNotVault() (gas: 9011)
[@bush.fi/v3-vault]: [PASS] testQuoteAndRevertWhenNotStaticCall() (gas: 9023)
[@bush.fi/v3-vault]: [PASS] testQuoteAndRevertWhenNotVault() (gas: 11753)
[@bush.fi/v3-vault]: [PASS] testQuoteWhenNotStaticCall() (gas: 11644)
[@bush.fi/v3-vault]: [PASS] testQuoteWhenNotVault() (gas: 14366)
[@bush.fi/v3-vault]: [PASS] testRegisterPoolReentrancy() (gas: 24437)
[@bush.fi/v3-vault]: [PASS] testRegisterPoolWhenNotVault() (gas: 13010)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityRecoveryWhenNotVault() (gas: 14273)
[@bush.fi/v3-vault]: [PASS] testTotalSupplyWhenNotVault() (gas: 11321)
[@bush.fi/v3-vault]: Suite result: ok. 43 passed; 0 failed; 0 skipped; finished in 547.93ms (14.75ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 1 test for test/foundry/unit/VaultExtensionUnit.t.sol:VaultExtensionUnitTest
[@bush.fi/v3-vault]: [PASS] testComputeDynamicSwapFeePercentageRevert() (gas: 74501)
[@bush.fi/v3-vault]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 188.56ms (236.42µs CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 10 tests for test/foundry/VaultFactory.t.sol:VaultFactoryTest
[@bush.fi/v3-vault]: [PASS] testCreateMismatch() (gas: 157168)
[@bush.fi/v3-vault]: [PASS] testCreateNotAuthorized() (gas: 103480)
[@bush.fi/v3-vault]: [PASS] testCreateTwice() (gas: 38264838)
[@bush.fi/v3-vault]: [PASS] testCreateVaultHardcodedSalt() (gas: 16720801)
[@bush.fi/v3-vault]: [PASS] testCreateVaultHardcodedSaltWrongDeployer() (gas: 1217690)
[@bush.fi/v3-vault]: [PASS] testCreateVault__Fuzz(bytes32) (runs: 101, μ: 19091842, ~: 19091842)
[@bush.fi/v3-vault]: [PASS] testInvalidFeeController() (gas: 153574)
[@bush.fi/v3-vault]: [PASS] testInvalidVaultAdminBytecode() (gas: 94688)
[@bush.fi/v3-vault]: [PASS] testInvalidVaultBytecode() (gas: 59858)
[@bush.fi/v3-vault]: [PASS] testInvalidVaultExtensionBytecode() (gas: 92873)
[@bush.fi/v3-vault]: Suite result: ok. 10 passed; 0 failed; 0 skipped; finished in 635.07ms (560.78ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 27 tests for test/foundry/VaultLiquidity.t.sol:VaultLiquidityTest
[@bush.fi/v3-vault]: [PASS] testAddLiquidityAmountInAboveMax() (gas: 79367)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityBptAmountOutBelowMin() (gas: 80451)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityCustom() (gas: 439814)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityCustomDisabled() (gas: 84409)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityNotInitialized() (gas: 2219719)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportional() (gas: 434762)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalWithDust() (gas: 455562)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOut() (gas: 425296)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutDisabled() (gas: 87702)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityTradeLimit() (gas: 82115)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalanced() (gas: 445140)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalancedDisabled() (gas: 82613)
[@bush.fi/v3-vault]: [PASS] testAddRemoveWithoutRoundtripFee() (gas: 473536)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityAmountOutBelowMin() (gas: 74814)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityBptInAboveMax() (gas: 85115)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityCustom() (gas: 486719)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityCustomDisabled() (gas: 84403)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityNotInitialized() (gas: 2223425)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityProportional() (gas: 476870)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactIn() (gas: 497527)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactInDisabled() (gas: 87452)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactOut() (gas: 507621)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactOutDisabled() (gas: 87602)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityTradeLimit() (gas: 64635)
[@bush.fi/v3-vault]: [PASS] testRoundtripFee() (gas: 484219)
[@bush.fi/v3-vault]: [PASS] testSwapFeesInEventAddLiquidityInRecovery() (gas: 430180)
[@bush.fi/v3-vault]: [PASS] testSwapFeesInEventRemoveLiquidityInRecovery() (gas: 310923)
[@bush.fi/v3-vault]: Suite result: ok. 27 passed; 0 failed; 0 skipped; finished in 411.86ms (25.03ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 22 tests for test/foundry/unit/HooksConfigLib.t.sol:HooksConfigLibTest
[@bush.fi/v3-vault]: [PASS] testEnableHookAdjustedAmounts() (gas: 5138)
[@bush.fi/v3-vault]: [PASS] testSetHookAdjustedAmounts() (gas: 5208)
[@bush.fi/v3-vault]: [PASS] testSetShouldCallAfterAddLiquidity() (gas: 6325)
[@bush.fi/v3-vault]: [PASS] testSetShouldCallAfterInitialize() (gas: 5404)
[@bush.fi/v3-vault]: [PASS] testSetShouldCallAfterRemoveLiquidity() (gas: 6686)
[@bush.fi/v3-vault]: [PASS] testSetShouldCallAfterSwap() (gas: 5988)
[@bush.fi/v3-vault]: [PASS] testSetShouldCallBeforeAddLiquidity() (gas: 6103)
[@bush.fi/v3-vault]: [PASS] testSetShouldCallBeforeInitialize() (gas: 5088)
[@bush.fi/v3-vault]: [PASS] testSetShouldCallBeforeRemoveLiquidity() (gas: 6527)
[@bush.fi/v3-vault]: [PASS] testSetShouldCallBeforeSwap() (gas: 5762)
[@bush.fi/v3-vault]: [PASS] testSetShouldCallComputeDynamicSwapFee() (gas: 5562)
[@bush.fi/v3-vault]: [PASS] testShouldCallAfterAddLiquidity() (gas: 6276)
[@bush.fi/v3-vault]: [PASS] testShouldCallAfterInitialize() (gas: 5377)
[@bush.fi/v3-vault]: [PASS] testShouldCallAfterRemoveLiquidity() (gas: 6616)
[@bush.fi/v3-vault]: [PASS] testShouldCallAfterSwap() (gas: 5918)
[@bush.fi/v3-vault]: [PASS] testShouldCallBeforeAddLiquidity() (gas: 6075)
[@bush.fi/v3-vault]: [PASS] testShouldCallBeforeInitialize() (gas: 4997)
[@bush.fi/v3-vault]: [PASS] testShouldCallBeforeRemoveLiquidity() (gas: 6459)
[@bush.fi/v3-vault]: [PASS] testShouldCallBeforeSwap() (gas: 5694)
[@bush.fi/v3-vault]: [PASS] testShouldCallComputeDynamicSwapFee() (gas: 5579)
[@bush.fi/v3-vault]: [PASS] testToHooksConfig() (gas: 34595)
[@bush.fi/v3-vault]: [PASS] testZeroConfigBytes() (gas: 21553)
[@bush.fi/v3-vault]: Suite result: ok. 22 passed; 0 failed; 0 skipped; finished in 617.13µs (511.79µs CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 28 tests for test/foundry/unit/HooksConfigLibHelpers.t.sol:HooksConfigLibHelpersTest
[@bush.fi/v3-vault]: [PASS] testCallAfterAddLiquidity() (gas: 33223)
[@bush.fi/v3-vault]: [PASS] testCallAfterAddLiquidityRevertIfAdjustedAmountsInRawAboveMaxAmountsIn() (gas: 34980)
[@bush.fi/v3-vault]: [PASS] testCallAfterAddLiquidityRevertIfAdjustedAmountsInRawHaveDifferentLength() (gas: 33823)
[@bush.fi/v3-vault]: [PASS] testCallAfterAddLiquidityRevertIfCallIsNotSuccess() (gas: 32540)
[@bush.fi/v3-vault]: [PASS] testCallAfterAddLiquidityWithAdjustedAmounts() (gas: 34756)
[@bush.fi/v3-vault]: [PASS] testCallAfterInitialize() (gas: 14290)
[@bush.fi/v3-vault]: [PASS] testCallAfterInitializeRevertIfCallIsNotSuccess() (gas: 14893)
[@bush.fi/v3-vault]: [PASS] testCallAfterRemoveLiquidity() (gas: 32994)
[@bush.fi/v3-vault]: [PASS] testCallAfterRemoveLiquidityRevertIfAdjustedAmountsOutRawAboveMinAmountsOut() (gas: 34759)
[@bush.fi/v3-vault]: [PASS] testCallAfterRemoveLiquidityRevertIfAdjustedAmountsOutRawHaveDifferentLength() (gas: 33621)
[@bush.fi/v3-vault]: [PASS] testCallAfterRemoveLiquidityRevertIfCallIsNotSuccess() (gas: 32317)
[@bush.fi/v3-vault]: [PASS] testCallAfterRemoveLiquidityWithAdjustedAmounts() (gas: 34528)
[@bush.fi/v3-vault]: [PASS] testCallAfterSwapExactIn() (gas: 24265)
[@bush.fi/v3-vault]: [PASS] testCallAfterSwapExactInRevertAdjustedSwapLimit() (gas: 25273)
[@bush.fi/v3-vault]: [PASS] testCallAfterSwapExactInWithAdjustedAmounts() (gas: 25415)
[@bush.fi/v3-vault]: [PASS] testCallAfterSwapExactOut() (gas: 24318)
[@bush.fi/v3-vault]: [PASS] testCallAfterSwapExactOutRevertAdjustedSwapLimit() (gas: 25353)
[@bush.fi/v3-vault]: [PASS] testCallAfterSwapExactOutWithAdjustedAmounts() (gas: 25399)
[@bush.fi/v3-vault]: [PASS] testCallAfterSwapRevertIfCallIsNotSuccess() (gas: 23914)
[@bush.fi/v3-vault]: [PASS] testCallBeforeAddLiquidity() (gas: 25338)
[@bush.fi/v3-vault]: [PASS] testCallBeforeAddLiquidityRevertIfCallIsNotSuccess() (gas: 25988)
[@bush.fi/v3-vault]: [PASS] testCallBeforeInitialize() (gas: 14292)
[@bush.fi/v3-vault]: [PASS] testCallBeforeInitializeRevertIfCallIsNotSuccess() (gas: 14917)
[@bush.fi/v3-vault]: [PASS] testCallBeforeSwap() (gas: 17355)
[@bush.fi/v3-vault]: [PASS] testCallBeforeSwapRevertIfCallIsNotSuccess() (gas: 18022)
[@bush.fi/v3-vault]: [PASS] testCallComputeDynamicSwapFee() (gas: 18147)
[@bush.fi/v3-vault]: [PASS] testCallComputeDynamicSwapFeeAboveMax() (gas: 18130)
[@bush.fi/v3-vault]: [PASS] testCallComputeDynamicSwapFeeRevertIfCallIsNotSuccess() (gas: 18178)
[@bush.fi/v3-vault]: Suite result: ok. 28 passed; 0 failed; 0 skipped; finished in 503.32ms (3.82ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 7 tests for test/foundry/Initializer.t.sol:InitializerTest
[@bush.fi/v3-vault]: [PASS] testInitializeEmitsPoolBalanceChangedEvent() (gas: 364127)
[@bush.fi/v3-vault]: [PASS] testInitializeWithDust() (gas: 380751)
[@bush.fi/v3-vault]: [PASS] testNoRevertWithZeroConfig() (gas: 388422)
[@bush.fi/v3-vault]: [PASS] testOnAfterInitializeHook() (gas: 361907)
[@bush.fi/v3-vault]: [PASS] testOnAfterInitializeHookRevert() (gas: 246207)
[@bush.fi/v3-vault]: [PASS] testOnBeforeInitializeHook() (gas: 361688)
[@bush.fi/v3-vault]: [PASS] testOnBeforeInitializeHookRevert() (gas: 103679)
[@bush.fi/v3-vault]: Suite result: ok. 7 passed; 0 failed; 0 skipped; finished in 636.91ms (5.86ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 29 tests for test/foundry/AggregatorRouter.t.sol:AggregatorRouterTest
[@bush.fi/v3-vault]: [PASS] testAddLiquidityCustom() (gas: 463456)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportional() (gas: 472841)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalRevertIfInsufficientPayment() (gas: 320829)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalWithERC7702() (gas: 487063)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOut() (gas: 447654)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalanced() (gas: 460396)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalancedRevertIfInsufficientPayment() (gas: 324364)
[@bush.fi/v3-vault]: [PASS] testDonate() (gas: 424715)
[@bush.fi/v3-vault]: [PASS] testQuerySwapExactIn() (gas: 29024)
[@bush.fi/v3-vault]: [PASS] testQuerySwapExactIn__Fuzz(uint256) (runs: 10001, μ: 235272, ~: 235531)
[@bush.fi/v3-vault]: [PASS] testQuerySwapExactOut() (gas: 28918)
[@bush.fi/v3-vault]: [PASS] testQuerySwapExactOut__Fuzz(uint256) (runs: 10001, μ: 241030, ~: 241290)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityProportional() (gas: 452090)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityRecovery() (gas: 438835)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactIn() (gas: 440816)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactOut() (gas: 468176)
[@bush.fi/v3-vault]: [PASS] testRouterVersion() (gas: 12237)
[@bush.fi/v3-vault]: [PASS] testSendEth() (gas: 16931)
[@bush.fi/v3-vault]: [PASS] testSwapExactInDeadline() (gas: 44132)
[@bush.fi/v3-vault]: [PASS] testSwapExactInMinAmountOut() (gas: 94826)
[@bush.fi/v3-vault]: [PASS] testSwapExactInWrongTransferAndBalanceInVault() (gas: 119127)
[@bush.fi/v3-vault]: [PASS] testSwapExactInWrongTransferAndNoBalanceInVault() (gas: 101156)
[@bush.fi/v3-vault]: [PASS] testSwapExactIn__Fuzz(uint256) (runs: 10001, μ: 192191, ~: 192413)
[@bush.fi/v3-vault]: [PASS] testSwapExactOutDeadline() (gas: 44746)
[@bush.fi/v3-vault]: [PASS] testSwapExactOutMaxAmountIn() (gas: 95543)
[@bush.fi/v3-vault]: [PASS] testSwapExactOutWithoutPayment() (gas: 101650)
[@bush.fi/v3-vault]: [PASS] testSwapExactOutWrongTransferAndBalanceInVault() (gas: 121038)
[@bush.fi/v3-vault]: [PASS] testSwapExactOutWrongTransferAndNoBalanceInVault() (gas: 122247)
[@bush.fi/v3-vault]: [PASS] testSwapExactOut__Fuzz(uint256) (runs: 10001, μ: 201945, ~: 202155)
[@bush.fi/v3-vault]: Suite result: ok. 29 passed; 0 failed; 0 skipped; finished in 73.98s (60.23s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 24 tests for test/foundry/Hooks.t.sol:HooksTest
[@bush.fi/v3-vault]: [PASS] testOnAfterAddLiquidityFlag() (gas: 234290)
[@bush.fi/v3-vault]: [PASS] testOnAfterAddLiquidityHook() (gas: 261756)
[@bush.fi/v3-vault]: [PASS] testOnAfterAddLiquidityHookEmptyHookAdjustedAmounts() (gas: 188758)
[@bush.fi/v3-vault]: [PASS] testOnAfterAddLiquidityHookRevert() (gas: 204095)
[@bush.fi/v3-vault]: [PASS] testOnAfterRemoveLiquidityFlag() (gas: 292198)
[@bush.fi/v3-vault]: [PASS] testOnAfterRemoveLiquidityHook() (gas: 319961)
[@bush.fi/v3-vault]: [PASS] testOnAfterRemoveLiquidityHookEmptyHookAdjustedAmounts() (gas: 318581)
[@bush.fi/v3-vault]: [PASS] testOnAfterRemoveLiquidityHookRevert() (gas: 333187)
[@bush.fi/v3-vault]: [PASS] testOnAfterSwapHook() (gas: 274855)
[@bush.fi/v3-vault]: [PASS] testOnAfterSwapHookRevert() (gas: 181590)
[@bush.fi/v3-vault]: [PASS] testOnBeforeAddLiquidityFlag() (gas: 234413)
[@bush.fi/v3-vault]: [PASS] testOnBeforeAddLiquidityHook() (gas: 270894)
[@bush.fi/v3-vault]: [PASS] testOnBeforeAddLiquidityHookRevert() (gas: 142666)
[@bush.fi/v3-vault]: [PASS] testOnBeforeRemoveLiquidityFlag() (gas: 293419)
[@bush.fi/v3-vault]: [PASS] testOnBeforeRemoveLiquidityHook() (gas: 330498)
[@bush.fi/v3-vault]: [PASS] testOnBeforeRemoveLiquidityHookRevert() (gas: 316554)
[@bush.fi/v3-vault]: [PASS] testOnBeforeSwapHook() (gas: 201190)
[@bush.fi/v3-vault]: [PASS] testOnBeforeSwapHookRevert() (gas: 144842)
[@bush.fi/v3-vault]: [PASS] testOnComputeDynamicSwapFeeHook() (gas: 174363)
[@bush.fi/v3-vault]: [PASS] testOnComputeDynamicSwapFeeHookReturningStaticFee() (gas: 230650)
[@bush.fi/v3-vault]: [PASS] testOnComputeDynamicSwapFeeHookRevert() (gas: 121448)
[@bush.fi/v3-vault]: [PASS] testOnRegisterAllowedFactory() (gas: 286824)
[@bush.fi/v3-vault]: [PASS] testOnRegisterHookAdjustedWithUnbalancedLiquidity() (gas: 247115)
[@bush.fi/v3-vault]: [PASS] testOnRegisterNotAllowedFactory() (gas: 195294)
[@bush.fi/v3-vault]: Suite result: ok. 24 passed; 0 failed; 0 skipped; finished in 943.22ms (15.76ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 3 tests for test/foundry/HooksAlteringBalances.t.sol:HooksAlteringBalancesTest
[@bush.fi/v3-vault]: [PASS] testOnBeforeAddLiquidityHookAltersBalances() (gas: 358898)
[@bush.fi/v3-vault]: [PASS] testOnBeforeRemoveLiquidityHookAlterBalance() (gas: 428393)
[@bush.fi/v3-vault]: [PASS] testOnBeforeSwapHookAltersBalances() (gas: 291812)
[@bush.fi/v3-vault]: Suite result: ok. 3 passed; 0 failed; 0 skipped; finished in 599.87ms (4.29ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 8 tests for test/foundry/BufferRouter.t.sol:BufferRouterTest
[@bush.fi/v3-vault]: [PASS] testAddLiquidityToBuffer() (gas: 366809)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityToBufferAboveMaxAmountsInUnderlying() (gas: 281016)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityToBufferAboveMaxAmountsInWrapped() (gas: 280158)
[@bush.fi/v3-vault]: [PASS] testInitializeBuffer() (gas: 285556)
[@bush.fi/v3-vault]: [PASS] testInitializeBufferBelowMinShares() (gas: 165096)
[@bush.fi/v3-vault]: [PASS] testQueryAddLiquidityToBuffer__Fuzz(uint256,uint256,uint256,uint256) (runs: 10001, μ: 424111, ~: 424384)
[@bush.fi/v3-vault]: [PASS] testQueryInitializeBuffer__Fuzz(uint256,uint256,uint256) (runs: 10001, μ: 441515, ~: 441849)
[@bush.fi/v3-vault]: [PASS] testQueryRemoveLiquidityFromBuffer__Fuzz(uint256,uint256,uint256,uint256) (runs: 10001, μ: 427313, ~: 427741)
[@bush.fi/v3-vault]: Suite result: ok. 8 passed; 0 failed; 0 skipped; finished in 33.93s (33.56s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 4 tests for test/foundry/HooksAlteringRates.t.sol:HooksAlteringRatesTest
[@bush.fi/v3-vault]: [PASS] testOnBeforeAddLiquidityHookAltersRate() (gas: 360410)
[@bush.fi/v3-vault]: [PASS] testOnBeforeInitializeHookAltersRate() (gas: 2529071)
[@bush.fi/v3-vault]: [PASS] testOnBeforeRemoveLiquidityHookAlterRate() (gas: 402014)
[@bush.fi/v3-vault]: [PASS] testOnBeforeSwapHookAltersRate() (gas: 255030)
[@bush.fi/v3-vault]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 751.05ms (106.75ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 25 tests for test/foundry/Router.t.sol:RouterTest
[@bush.fi/v3-vault]: [PASS] testAddLiquidityNative() (gas: 249252)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityNativeExcessEth() (gas: 281406)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityNativeNoBalance() (gas: 161907)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityWETH() (gas: 233986)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityWETHNoBalance() (gas: 177489)
[@bush.fi/v3-vault]: [PASS] testDisableQueries() (gas: 125721)
[@bush.fi/v3-vault]: [PASS] testGetSingleInputArray() (gas: 60321)
[@bush.fi/v3-vault]: [PASS] testInitBalanceOverflow() (gas: 2210107)
[@bush.fi/v3-vault]: [PASS] testInitializeBelowMinimum() (gas: 76700)
[@bush.fi/v3-vault]: [PASS] testInitializeNative() (gas: 331652)
[@bush.fi/v3-vault]: [PASS] testInitializeNativeExcessEth() (gas: 363793)
[@bush.fi/v3-vault]: [PASS] testInitializeNativeNoBalance() (gas: 238570)
[@bush.fi/v3-vault]: [PASS] testInitializeWETH() (gas: 316339)
[@bush.fi/v3-vault]: [PASS] testInitializeWETHNoBalance() (gas: 230876)
[@bush.fi/v3-vault]: [PASS] testQuerySwap() (gas: 31206)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityNative() (gas: 312279)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityRecovery() (gas: 694976)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityRecovery__Fuzz(uint256,uint256,uint256) (runs: 10001, μ: 556651, ~: 556821)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityWETH() (gas: 295279)
[@bush.fi/v3-vault]: [PASS] testRouterVersion() (gas: 12430)
[@bush.fi/v3-vault]: [PASS] testSwapExactInNative() (gas: 167135)
[@bush.fi/v3-vault]: [PASS] testSwapExactInWETH() (gas: 149563)
[@bush.fi/v3-vault]: [PASS] testSwapExactOutNative() (gas: 172237)
[@bush.fi/v3-vault]: [PASS] testSwapExactOutWETH() (gas: 154645)
[@bush.fi/v3-vault]: [PASS] testSwapNativeExcessEth() (gas: 199383)
[@bush.fi/v3-vault]: Suite result: ok. 25 passed; 0 failed; 0 skipped; finished in 61.53s (61.13s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 13 tests for test/foundry/RouterCommon.t.sol:RouterCommonTest
[@bush.fi/v3-vault]: [PASS] testConstructor() (gas: 1759037)
[@bush.fi/v3-vault]: [PASS] testNestedMulticall() (gas: 17477)
[@bush.fi/v3-vault]: [PASS] testPermitBatchReentrancy() (gas: 10396)
[@bush.fi/v3-vault]: [PASS] testSaveSenderAndCall() (gas: 13385)
[@bush.fi/v3-vault]: [PASS] testSaveSenderAndCallWithReentrancyAttack() (gas: 20561)
[@bush.fi/v3-vault]: [PASS] testSaveSenderAndManageEthModifierWithMultipleFunctions() (gas: 45946)
[@bush.fi/v3-vault]: [PASS] testSaveSenderAndManageEthModifierWithSingleFunction() (gas: 30218)
[@bush.fi/v3-vault]: [PASS] testSendTokenOutWethIsEth() (gas: 151511)
[@bush.fi/v3-vault]: [PASS] testSendTokenOutWethIsNotEth() (gas: 48136)
[@bush.fi/v3-vault]: [PASS] testSenderSlot() (gas: 8823)
[@bush.fi/v3-vault]: [PASS] testTakeTokenInTooLarge() (gas: 59474)
[@bush.fi/v3-vault]: [PASS] testTakeTokenInWethIsEth() (gas: 13423)
[@bush.fi/v3-vault]: [PASS] testTakeTokenInWethIsNotEth() (gas: 141125)
[@bush.fi/v3-vault]: Suite result: ok. 13 passed; 0 failed; 0 skipped; finished in 850.55ms (86.05ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 32 tests for test/foundry/BufferVaultPrimitive.t.sol:BufferVaultPrimitiveTest
[@bush.fi/v3-vault]: [PASS] testAddLiquidityToBuffer() (gas: 396949)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityToBufferWithDecreasedRate__Fuzz(uint128,uint128,uint128,uint64) (runs: 10001, μ: 416877, ~: 422732)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityToBufferWithIncreasedRate__Fuzz(uint128,uint128,uint128,uint64) (runs: 10001, μ: 416979, ~: 422732)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityToBufferWithRateChange() (gas: 421579)
[@bush.fi/v3-vault]: [PASS] testChangeAssetOfWrappedTokenAddLiquidityToBuffer() (gas: 286615)
[@bush.fi/v3-vault]: [PASS] testChangeAssetOfWrappedTokenRemoveLiquidityFromBuffer() (gas: 294603)
[@bush.fi/v3-vault]: [PASS] testChangeAssetOfWrappedTokenWrapUnwrap() (gas: 310763)
[@bush.fi/v3-vault]: [PASS] testDepositBufferBalancedNotEnoughLiquidity() (gas: 565034)
[@bush.fi/v3-vault]: [PASS] testDepositBufferMoreUnderlyingNotEnoughLiquidity() (gas: 565094)
[@bush.fi/v3-vault]: [PASS] testDepositBufferMoreWrappedNotEnoughLiquidity() (gas: 565092)
[@bush.fi/v3-vault]: [PASS] testDepositMaliciousRouter() (gas: 375623)
[@bush.fi/v3-vault]: [PASS] testDepositUsingBufferLiquidity() (gas: 523349)
[@bush.fi/v3-vault]: [PASS] testDisableVaultBuffer() (gas: 474421)
[@bush.fi/v3-vault]: [PASS] testDisableVaultBufferAuthentication() (gas: 82615)
[@bush.fi/v3-vault]: [PASS] testExactInOverflow() (gas: 35501)
[@bush.fi/v3-vault]: [PASS] testIsERC4626BufferInitialized() (gas: 275046)
[@bush.fi/v3-vault]: [PASS] testMintBufferBalancedNotEnoughLiquidity() (gas: 603014)
[@bush.fi/v3-vault]: [PASS] testMintBufferMoreUnderlyingNotEnoughLiquidity() (gas: 603140)
[@bush.fi/v3-vault]: [PASS] testMintBufferMoreWrappedNotEnoughLiquidity() (gas: 603139)
[@bush.fi/v3-vault]: [PASS] testMintMaliciousRouter() (gas: 352472)
[@bush.fi/v3-vault]: [PASS] testMintWithBufferLiquidity() (gas: 558642)
[@bush.fi/v3-vault]: [PASS] testNativeEthSwapExactIn() (gas: 568395)
[@bush.fi/v3-vault]: [PASS] testNativeEthSwapExactOut() (gas: 623462)
[@bush.fi/v3-vault]: [PASS] testRedeemBufferBalancedNotEnoughLiquidity() (gas: 557248)
[@bush.fi/v3-vault]: [PASS] testRedeemBufferMoreUnderlyingNotEnoughLiquidity() (gas: 557351)
[@bush.fi/v3-vault]: [PASS] testRedeemBufferMoreWrappedNotEnoughLiquidity() (gas: 557375)
[@bush.fi/v3-vault]: [PASS] testRedeemWithBufferLiquidity() (gas: 527843)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityFromBuffer() (gas: 349765)
[@bush.fi/v3-vault]: [PASS] testWithdrawBufferBalancedNotEnoughLiquidity() (gas: 576743)
[@bush.fi/v3-vault]: [PASS] testWithdrawBufferMoreUnderlyingNotEnoughLiquidity() (gas: 566304)
[@bush.fi/v3-vault]: [PASS] testWithdrawBufferMoreWrappedNotEnoughLiquidity() (gas: 576825)
[@bush.fi/v3-vault]: [PASS] testWithdrawWithBufferLiquidity() (gas: 545126)
[@bush.fi/v3-vault]: Suite result: ok. 32 passed; 0 failed; 0 skipped; finished in 61.74s (61.49s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 3 tests for test/foundry/UninitializedBufferTest.sol:UnInitializedBufferTest
[@bush.fi/v3-vault]: [PASS] testAddLiquidityToBufferUninitialized() (gas: 34834)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityFromBufferUninitialized() (gas: 33564)
[@bush.fi/v3-vault]: [PASS] testWrapUnwrapBufferUninitialized() (gas: 72295)
[@bush.fi/v3-vault]: Suite result: ok. 3 passed; 0 failed; 0 skipped; finished in 640.67ms (1.29ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 6 tests for test/foundry/LinearBasePoolMathRounding.sol:LinearBasePoolMathRoundingTest
[@bush.fi/v3-vault]: [PASS] testComputeAddLiquiditySingleTokenExactOut__Fuzz(uint256,uint256,uint256,uint64) (runs: 10001, μ: 46577, ~: 46545)
[@bush.fi/v3-vault]: [PASS] testComputeAddLiquidityUnbalanced__Fuzz(uint256[2],uint256[2],uint64) (runs: 10001, μ: 68711, ~: 68742)
[@bush.fi/v3-vault]: [PASS] testComputeProportionalAmountsIn__Fuzz(uint256[2],uint256) (runs: 10001, μ: 31615, ~: 31746)
[@bush.fi/v3-vault]: [PASS] testComputeProportionalAmountsOut__Fuzz(uint256[2],uint256) (runs: 10001, μ: 31584, ~: 31714)
[@bush.fi/v3-vault]: [PASS] testComputeRemoveLiquiditySingleTokenExactIn__Fuzz(uint256,uint256,uint256,uint64) (runs: 10001, μ: 46307, ~: 46277)
[@bush.fi/v3-vault]: [PASS] testComputeRemoveLiquiditySingleTokenExactOut__Fuzz(uint256,uint256,uint256,uint64) (runs: 10001, μ: 62620, ~: 62571)
[@bush.fi/v3-vault]: Suite result: ok. 6 passed; 0 failed; 0 skipped; finished in 39.75s (39.68s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 8 tests for test/foundry/unit/VaultStateLib.t.sol:VaultStateLibTest
[@bush.fi/v3-vault]: [PASS] testAreBuffersPaused() (gas: 3790)
[@bush.fi/v3-vault]: [PASS] testIsQueryDisabled() (gas: 3426)
[@bush.fi/v3-vault]: [PASS] testIsVaultPaused() (gas: 3615)
[@bush.fi/v3-vault]: [PASS] testOffsets() (gas: 212443)
[@bush.fi/v3-vault]: [PASS] testSetBuffersPaused() (gas: 3818)
[@bush.fi/v3-vault]: [PASS] testSetQueryDisabled() (gas: 3490)
[@bush.fi/v3-vault]: [PASS] testSetVaultPaused() (gas: 3664)
[@bush.fi/v3-vault]: [PASS] testZeroConfigBytes() (gas: 5057)
[@bush.fi/v3-vault]: Suite result: ok. 8 passed; 0 failed; 0 skipped; finished in 188.92µs (117.25µs CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 3 tests for test/foundry/VaultStorage.t.sol:VaultStorageTest
[@bush.fi/v3-vault]: [PASS] testGetIsUnlockedSlot() (gas: 10655)
[@bush.fi/v3-vault]: [PASS] testGetNonzeroDeltaCountSlot() (gas: 9291)
[@bush.fi/v3-vault]: [PASS] testGetTokenDeltasSlot() (gas: 9445)
[@bush.fi/v3-vault]: Suite result: ok. 3 passed; 0 failed; 0 skipped; finished in 346.57ms (405.08µs CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 24 tests for test/foundry/VaultSwap.t.sol:VaultSwapTest
[@bush.fi/v3-vault]: [PASS] testCannotSwapWhenPaused() (gas: 74671)
[@bush.fi/v3-vault]: [PASS] testCollectAggregateFees() (gas: 339912)
[@bush.fi/v3-vault]: [PASS] testProtocolSwapFeeAccumulation() (gas: 299584)
[@bush.fi/v3-vault]: [PASS] testReentrancySwap() (gas: 260642)
[@bush.fi/v3-vault]: [PASS] testSwapDeadlineExactIn() (gas: 26699)
[@bush.fi/v3-vault]: [PASS] testSwapDeadlineExactOut() (gas: 26831)
[@bush.fi/v3-vault]: [PASS] testSwapEventExactIn() (gas: 161298)
[@bush.fi/v3-vault]: [PASS] testSwapEventExactInRecovery() (gas: 170036)
[@bush.fi/v3-vault]: [PASS] testSwapEventExactOut() (gas: 147042)
[@bush.fi/v3-vault]: [PASS] testSwapLimitExactIn() (gas: 71415)
[@bush.fi/v3-vault]: [PASS] testSwapLimitExactOut() (gas: 71658)
[@bush.fi/v3-vault]: [PASS] testSwapNotInitialized() (gas: 30541)
[@bush.fi/v3-vault]: [PASS] testSwapSingleTokenExactIn() (gas: 190819)
[@bush.fi/v3-vault]: [PASS] testSwapSingleTokenExactInWithDust() (gas: 212466)
[@bush.fi/v3-vault]: [PASS] testSwapSingleTokenExactInWithFee() (gas: 213753)
[@bush.fi/v3-vault]: [PASS] testSwapSingleTokenExactInWithFeeInRecoveryMode() (gas: 227387)
[@bush.fi/v3-vault]: [PASS] testSwapSingleTokenExactInWithProtocolFee() (gas: 238939)
[@bush.fi/v3-vault]: [PASS] testSwapSingleTokenExactOut() (gas: 191176)
[@bush.fi/v3-vault]: [PASS] testSwapSingleTokenExactOutWithDust() (gas: 212782)
[@bush.fi/v3-vault]: [PASS] testSwapSingleTokenExactOutWithFee() (gas: 199669)
[@bush.fi/v3-vault]: [PASS] testSwapSingleTokenExactOutWithFeeInRecoveryMode() (gas: 215229)
[@bush.fi/v3-vault]: [PASS] testSwapSingleTokenExactOutWithProtocolFee() (gas: 224855)
[@bush.fi/v3-vault]: [PASS] testSwapSymmetry() (gas: 295774)
[@bush.fi/v3-vault]: [PASS] testSwapTooSmallAmountGiven() (gas: 63425)
[@bush.fi/v3-vault]: Suite result: ok. 24 passed; 0 failed; 0 skipped; finished in 347.05ms (13.07ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 7 tests for test/foundry/UnbalancedLiquidityBounds.t.sol:UnbalancedLiquidityBounds
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalInvariantRatio__Fuzz(uint256,uint256,uint256) (runs: 10001, μ: 241885, ~: 242011)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAboveMaxInvariantRatio() (gas: 82542)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalancedAboveMaxInvariantRatio() (gas: 81700)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityProportionalInvariantRatio__Fuzz(uint256) (runs: 10001, μ: 205596, ~: 205665)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityRecoveryInvariantRatio__Fuzz(uint256) (runs: 10001, μ: 195546, ~: 195620)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactInBelowMinInvariantRatio() (gas: 97498)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactOutBelowMinInvariantRatio() (gas: 114503)
[@bush.fi/v3-vault]: Suite result: ok. 7 passed; 0 failed; 0 skipped; finished in 38.63s (38.11s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 4 tests for test/foundry/RouterWethLib.t.sol:RouterWethLibTest
[@bush.fi/v3-vault]: [PASS] testUnwrapWethAndTransferToSenderInsufficientBalance() (gas: 30835)
[@bush.fi/v3-vault]: [PASS] testUnwrapWethAndTransferToSenderSuccess() (gas: 131620)
[@bush.fi/v3-vault]: [PASS] testWrapEthAndSettleInsufficientBalance() (gas: 7414)
[@bush.fi/v3-vault]: [PASS] testWrapEthAndSettleSuccess() (gas: 102141)
[@bush.fi/v3-vault]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 512.32ms (783.88µs CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 4 tests for test/foundry/unit/Scaling.t.sol:ScalingTest
[@bush.fi/v3-vault]: [PASS] testToRawUndoRateRoundDown__Fuzz(uint256,uint8,uint256) (runs: 10001, μ: 11219, ~: 10928)
[@bush.fi/v3-vault]: [PASS] testToRawUndoRateRoundUp__Fuzz(uint256,uint8,uint256) (runs: 10001, μ: 11335, ~: 11045)
[@bush.fi/v3-vault]: [PASS] testToScaled18ApplyRateRoundDown__Fuzz(uint256,uint8,uint256) (runs: 10001, μ: 11247, ~: 10956)
[@bush.fi/v3-vault]: [PASS] testToScaled18ApplyRateRoundUp__Fuzz(uint256,uint8,uint256) (runs: 10001, μ: 11154, ~: 10866)
[@bush.fi/v3-vault]: Suite result: ok. 4 passed; 0 failed; 0 skipped; finished in 6.20s (6.19s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 8 tests for test/foundry/VaultLiquidityRate.t.sol:VaultLiquidityWithRatesTest
[@bush.fi/v3-vault]: [PASS] testAddLiquidityCustomWithRate() (gas: 218740)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutWithRate() (gas: 187089)
[@bush.fi/v3-vault]: [PASS] testLastLiveBalanceInitialization() (gas: 2705037)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityCustomWithRate() (gas: 315201)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityProportionalWithRate() (gas: 276751)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactInWithRate() (gas: 306513)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactInWithRate__Fuzz(uint256,uint256) (runs: 10001, μ: 664523, ~: 664662)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactOutWithRate__Fuzz(uint256,uint256,uint256) (runs: 10001, μ: 627178, ~: 627442)
[@bush.fi/v3-vault]: Suite result: ok. 8 passed; 0 failed; 0 skipped; finished in 147.20s (146.73s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 8 tests for test/foundry/HookAdjustedLiquidity.t.sol:HookAdjustedLiquidityTest
[@bush.fi/v3-vault]: [PASS] testHookDiscountAddLiquidity__Fuzz(uint256,uint256) (runs: 10001, μ: 531500, ~: 532244)
[@bush.fi/v3-vault]: [PASS] testHookDiscountRemoveLiquidity__Fuzz(uint256,uint256) (runs: 10001, μ: 640795, ~: 641503)
[@bush.fi/v3-vault]: [PASS] testHookFeeAddLiquidityIgnoreHookAdjusted() (gas: 334099)
[@bush.fi/v3-vault]: [PASS] testHookFeeAddLiquidityLimitViolation() (gas: 269779)
[@bush.fi/v3-vault]: [PASS] testHookFeeAddLiquidity__Fuzz(uint256,uint256) (runs: 10001, μ: 549768, ~: 550887)
[@bush.fi/v3-vault]: [PASS] testHookFeeRemoveLiquidityIgnoreHookAdjusted() (gas: 445734)
[@bush.fi/v3-vault]: [PASS] testHookFeeRemoveLiquidityLimitViolation() (gas: 405706)
[@bush.fi/v3-vault]: [PASS] testHookFeeRemoveLiquidity__Fuzz(uint256,uint256) (runs: 10001, μ: 658301, ~: 659646)
[@bush.fi/v3-vault]: Suite result: ok. 8 passed; 0 failed; 0 skipped; finished in 248.15s (234.47s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 11 tests for test/foundry/RouterQueriesDiffRates.t.sol:RouterQueriesDiffRatesTest
[@bush.fi/v3-vault]: [PASS] testQueryAddLiquidityCustomDiffRates__Fuzz(uint256,uint256) (runs: 10001, μ: 373313, ~: 373371)
[@bush.fi/v3-vault]: [PASS] testQueryAddLiquidityProportionalDiffRates__Fuzz(uint256,uint256) (runs: 10001, μ: 365516, ~: 365577)
[@bush.fi/v3-vault]: [PASS] testQueryAddLiquiditySingleTokenExactOutDiffRates__Fuzz(uint256,uint256) (runs: 10001, μ: 340609, ~: 340667)
[@bush.fi/v3-vault]: [PASS] testQueryAddLiquidityUnbalancedDiffRates__Fuzz(uint256,uint256) (runs: 10001, μ: 382450, ~: 382509)
[@bush.fi/v3-vault]: [PASS] testQueryRemoveLiquidityCustomDiffRates__Fuzz(uint256,uint256) (runs: 10001, μ: 325236, ~: 325296)
[@bush.fi/v3-vault]: [PASS] testQueryRemoveLiquidityProportionalDiffRates__Fuzz(uint256,uint256) (runs: 10001, μ: 315835, ~: 315895)
[@bush.fi/v3-vault]: [PASS] testQueryRemoveLiquidityRecoveryDiffRates__Fuzz(uint256,uint256) (runs: 10001, μ: 272499, ~: 272561)
[@bush.fi/v3-vault]: [PASS] testQueryRemoveLiquiditySingleTokenExactInDiffRates__Fuzz(uint256,uint256) (runs: 10001, μ: 298869, ~: 298928)
[@bush.fi/v3-vault]: [PASS] testQueryRemoveLiquiditySingleTokenExactOutDiffRates__Fuzz(uint256,uint256) (runs: 10001, μ: 318643, ~: 318700)
[@bush.fi/v3-vault]: [PASS] testQuerySwapSingleTokenExactInDiffRates__Fuzz(uint256,uint256) (runs: 10001, μ: 269373, ~: 269431)
[@bush.fi/v3-vault]: [PASS] testQuerySwapSingleTokenExactOutDiffRates__Fuzz(uint256,uint256) (runs: 10001, μ: 269688, ~: 269748)
[@bush.fi/v3-vault]: Suite result: ok. 11 passed; 0 failed; 0 skipped; finished in 233.35s (232.83s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 6 tests for test/foundry/DynamicFeePoolTest.t.sol:DynamicFeePoolTest
[@bush.fi/v3-vault]: [PASS] testExternalComputeFee() (gas: 122841)
[@bush.fi/v3-vault]: [PASS] testExternalComputeFeeInvalid() (gas: 56943)
[@bush.fi/v3-vault]: [PASS] testSwapCallsComputeFeeExactIn() (gas: 203732)
[@bush.fi/v3-vault]: [PASS] testSwapCallsComputeFeeExactOut() (gas: 202699)
[@bush.fi/v3-vault]: [PASS] testSwapCallsComputeFeeWithSender() (gas: 278894)
[@bush.fi/v3-vault]: [PASS] testSwapChargesFees__Fuzz(uint256) (runs: 10001, μ: 278152, ~: 277850)
[@bush.fi/v3-vault]: Suite result: ok. 6 passed; 0 failed; 0 skipped; finished in 19.87s (18.73s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 1 test for test/foundry/fork/ERC4626MainnetAaveUsdc.t.sol:ERC4626MainnetAaveUsdcTest
[@bush.fi/v3-vault]: [PASS] testPreConditions__Fork() (gas: 27503)
[@bush.fi/v3-vault]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 10.34s (401.83µs CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 1 test for test/foundry/Fungibility.t.sol:FungibilityTest
[@bush.fi/v3-vault]: [PASS] testFungibilityAddUnbalanced__Fuzz(uint256) (runs: 10001, μ: 367280, ~: 367330)
[@bush.fi/v3-vault]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 14.68s (14.19s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 1 test for test/foundry/GetBptRate.t.sol:GetBptRateTest
[@bush.fi/v3-vault]: [PASS] testGetBptRateWithRateProvider() (gas: 286510)
[@bush.fi/v3-vault]: Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 1.07s (1.76ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 27 tests for test/foundry/unit/ERC20MultiTokenTest.t.sol:ERC20MultiTokenTest
[@bush.fi/v3-vault]: [PASS] testAllowanceForNotTokenContractWithZeroValue() (gas: 11188)
[@bush.fi/v3-vault]: [PASS] testAllowanceForTokenContract() (gas: 11221)
[@bush.fi/v3-vault]: [PASS] testApprove() (gas: 38802)
[@bush.fi/v3-vault]: [PASS] testApproveRevertIfOwnerIsZero() (gas: 9088)
[@bush.fi/v3-vault]: [PASS] testApproveRevertIfSpenderIsZero() (gas: 9088)
[@bush.fi/v3-vault]: [PASS] testBalanceOfWithZeroValue() (gas: 11122)
[@bush.fi/v3-vault]: [PASS] testBurn() (gas: 67889)
[@bush.fi/v3-vault]: [PASS] testBurnRevertIfFromIsZeroAddress() (gas: 8733)
[@bush.fi/v3-vault]: [PASS] testBurnRevertIfInsufficientBalance() (gas: 59032)
[@bush.fi/v3-vault]: [PASS] testBurnRevertIfTotalSupplyIsLessThanMinimum() (gas: 58620)
[@bush.fi/v3-vault]: [PASS] testDoubleBurnToCheckTotalSupply() (gas: 102541)
[@bush.fi/v3-vault]: [PASS] testDoubleMintToCheckTotalSupply() (gas: 90711)
[@bush.fi/v3-vault]: [PASS] testMint() (gas: 62432)
[@bush.fi/v3-vault]: [PASS] testMintMinimumSupplyReserve() (gas: 62158)
[@bush.fi/v3-vault]: [PASS] testMintRevertIfToIsZeroAddress() (gas: 8784)
[@bush.fi/v3-vault]: [PASS] testMintRevertIfTotalSupplyIsLessThanMinimum() (gas: 33543)
[@bush.fi/v3-vault]: [PASS] testQueryModeBalanceIncrease() (gas: 32771)
[@bush.fi/v3-vault]: [PASS] testQueryModeBalanceIncreaseRevertIfCallIsNotStatic() (gas: 8899)
[@bush.fi/v3-vault]: [PASS] testSpendAllowance() (gas: 44277)
[@bush.fi/v3-vault]: [PASS] testSpendAllowanceRevertIfInsufficientAllowance() (gas: 36514)
[@bush.fi/v3-vault]: [PASS] testSpendAllowanceWhenAllowanceIsMax() (gas: 39628)
[@bush.fi/v3-vault]: [PASS] testSpendAllowanceWhenOwnerIsSender() (gas: 11676)
[@bush.fi/v3-vault]: [PASS] testTotalSupplyWithZeroValue() (gas: 10989)
[@bush.fi/v3-vault]: [PASS] testTransfer() (gas: 70047)
[@bush.fi/v3-vault]: [PASS] testTransferRevertIfFromIsZeroAddress() (gas: 8889)
[@bush.fi/v3-vault]: [PASS] testTransferRevertIfInsufficientBalance() (gas: 58367)
[@bush.fi/v3-vault]: [PASS] testTransferRevertIfToIsZeroAddress() (gas: 8933)
[@bush.fi/v3-vault]: Suite result: ok. 27 passed; 0 failed; 0 skipped; finished in 851.46ms (1.82ms CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 5 tests for test/foundry/E2eBatchSwap.t.sol:E2eBatchSwapTest
[@bush.fi/v3-vault]: [PASS] testDoUndoExactIn__Fuzz(uint256,uint256,uint256,uint256) (runs: 10001, μ: 973616, ~: 973860)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOut__Fuzz(uint256,uint256,uint256,uint256) (runs: 10001, μ: 995182, ~: 995420)
[@bush.fi/v3-vault]: [PASS] testExactInRepeatEachOperation__Fuzz(uint256,uint256,uint256,uint256) (runs: 10001, μ: 796110, ~: 796341)
[@bush.fi/v3-vault]: [PASS] testExactInRepeatExactOut__Fuzz(uint256,uint256) (runs: 10001, μ: 738971, ~: 739118)
[@bush.fi/v3-vault]: [PASS] testExactOutRepeatEachOperation__Fuzz(uint256,uint256,uint256,uint256) (runs: 10001, μ: 798147, ~: 798384)
[@bush.fi/v3-vault]: Suite result: ok. 5 passed; 0 failed; 0 skipped; finished in 166.99s (186.73s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 24 tests for test/foundry/LiquidityApproximation.t.sol:LiquidityApproximationTest
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalAndRemoveExactInNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10001, μ: 435426, ~: 435483)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalAndRemoveExactInNoSwapFee__Fuzz(uint256) (runs: 10001, μ: 434815, ~: 434873)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalAndRemoveExactInSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10001, μ: 449314, ~: 454771)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalAndRemoveExactIn__Fuzz(uint256,uint256) (runs: 10001, μ: 448535, ~: 454211)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalAndRemoveExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10001, μ: 526712, ~: 526770)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalAndRemoveExactOutNoSwapFee__Fuzz(uint256) (runs: 10001, μ: 526146, ~: 526204)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalAndRemoveExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10001, μ: 540479, ~: 546061)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalAndRemoveExactOut__Fuzz(uint256,uint256) (runs: 10001, μ: 539858, ~: 545496)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10001, μ: 429232, ~: 429290)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutNoSwapFee__Fuzz(uint256) (runs: 10001, μ: 428645, ~: 428702)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10001, μ: 442916, ~: 448538)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOut__Fuzz(uint256,uint256) (runs: 10001, μ: 442327, ~: 447976)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalancedNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10001, μ: 432166, ~: 432229)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalancedNoSwapFee__Fuzz(uint256) (runs: 10001, μ: 431556, ~: 431618)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalancedSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10001, μ: 444699, ~: 449326)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalanced__Fuzz(uint256,uint256) (runs: 10001, μ: 444125, ~: 448763)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactInNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10001, μ: 520466, ~: 520528)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactInNoSwapFee__Fuzz(uint256) (runs: 10001, μ: 519839, ~: 519898)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactInSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10001, μ: 534281, ~: 539776)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactIn__Fuzz(uint256,uint256) (runs: 10001, μ: 533660, ~: 539236)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactOutNoSwapFeeSpecific__Fuzz(uint256,uint256[5]) (runs: 10001, μ: 531218, ~: 531279)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactOutNoSwapFee__Fuzz(uint256) (runs: 10001, μ: 530641, ~: 530700)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactOutSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10001, μ: 545092, ~: 550568)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquiditySingleTokenExactOut__Fuzz(uint256,uint256) (runs: 10001, μ: 544371, ~: 549993)
[@bush.fi/v3-vault]: Suite result: ok. 24 passed; 0 failed; 0 skipped; finished in 499.19s (592.89s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 18 tests for test/foundry/WeightedPoolExtremeAmounts.t.sol:WeightedPoolExtremeAmountsTest
[@bush.fi/v3-vault]: [PASS] testAddAndRemoveLiquidityProportionalMaxBPTAmount__FuzzSwapFee(uint256) (runs: 10001, μ: 845876, ~: 845880)
[@bush.fi/v3-vault]: [PASS] testAddAndRemoveLiquidityProportional__Fuzz(uint256,uint256[2],uint256) (runs: 10001, μ: 848889, ~: 849046)
[@bush.fi/v3-vault]: [PASS] testAddAndRemoveLiquidityProportional__FuzzBPTAmount(uint256) (runs: 10001, μ: 845965, ~: 846112)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactIn__Fuzz(uint256,uint256[2],uint256) (runs: 10001, μ: 851185, ~: 851345)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactIn__FuzzBPTAmount(uint256) (runs: 10001, μ: 845340, ~: 845382)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactIn__FuzzSwapFee(uint256) (runs: 10001, μ: 844707, ~: 844711)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactOut__Fuzz(uint256,uint256[2],uint256) (runs: 10001, μ: 960096, ~: 960429)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactOut__FuzzBPTAmount(uint256) (runs: 10001, μ: 952746, ~: 952872)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactOut__FuzzSwapFee(uint256) (runs: 10001, μ: 951870, ~: 951874)
[@bush.fi/v3-vault]: [PASS] testAddProportionalAndRemoveLiquidityExactIn__Fuzz(uint256,uint256[2],uint256) (runs: 10001, μ: 904173, ~: 912336)
[@bush.fi/v3-vault]: [PASS] testAddProportionalAndRemoveLiquidityExactIn__FuzzBPTAmount(uint256) (runs: 10001, μ: 898235, ~: 907502)
[@bush.fi/v3-vault]: [PASS] testAddProportionalAndRemoveLiquidityExactIn__FuzzSwapFee(uint256) (runs: 10001, μ: 887586, ~: 887590)
[@bush.fi/v3-vault]: [PASS] testAddUnbalancedAndRemoveLiquidityProportional__Fuzz(uint256[2],uint256[2],uint256) (runs: 10001, μ: 884064, ~: 883790)
[@bush.fi/v3-vault]: [PASS] testAddUnbalancedAndRemoveLiquidityProportional__FuzzAmountsIn(uint256[2]) (runs: 10001, μ: 877786, ~: 877565)
[@bush.fi/v3-vault]: [PASS] testAddUnbalancedAndRemoveLiquidityProportional__FuzzSwapFee(uint256) (runs: 10001, μ: 872218, ~: 872222)
[@bush.fi/v3-vault]: [PASS] testSwap__Fuzz(uint256,uint256,uint256[2]) (runs: 10001, μ: 831210, ~: 831442)
[@bush.fi/v3-vault]: [PASS] testSwap__FuzzSwapAmount(uint256) (runs: 10001, μ: 825314, ~: 825334)
[@bush.fi/v3-vault]: [PASS] testSwap__FuzzSwapFee(uint256) (runs: 10001, μ: 823772, ~: 823777)
[@bush.fi/v3-vault]: Suite result: ok. 18 passed; 0 failed; 0 skipped; finished in 691.95s (866.95s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 23 tests for test/foundry/E2eSwapRateProvider.t.sol:E2eSwapRateProviderTest
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10001, μ: 631471, ~: 633090)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10001, μ: 659913, ~: 661103)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10001, μ: 628386, ~: 630091)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10001, μ: 619627, ~: 621237)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10001, μ: 541106, ~: 541150)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10001, μ: 528257, ~: 528299)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10001, μ: 576068, ~: 576121)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10001, μ: 540923, ~: 541037)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10001, μ: 528047, ~: 528165)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInSwapRateComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10001, μ: 714332, ~: 714694)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInSwapRate__Fuzz(uint256,uint256) (runs: 10001, μ: 614880, ~: 614975)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10001, μ: 719634, ~: 721209)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10001, μ: 748094, ~: 749409)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10001, μ: 716483, ~: 718194)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10001, μ: 707672, ~: 709307)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10001, μ: 629146, ~: 629188)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10001, μ: 616264, ~: 616306)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10001, μ: 664160, ~: 664214)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10001, μ: 628989, ~: 629097)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10001, μ: 616078, ~: 616193)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutSwapRateComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10001, μ: 802553, ~: 802896)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutSwapRate__Fuzz(uint256,uint256) (runs: 10001, μ: 702971, ~: 703069)
[@bush.fi/v3-vault]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10001, μ: 380551, ~: 380704)
[@bush.fi/v3-vault]: Suite result: ok. 23 passed; 0 failed; 0 skipped; finished in 166.45s (379.59s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 9 tests for test/foundry/E2eErc4626Swaps.t.sol:E2eErc4626SwapsTest
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256) (runs: 10001, μ: 940898, ~: 966898)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10001, μ: 883718, ~: 883760)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10001, μ: 952060, ~: 961704)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10001, μ: 861167, ~: 881603)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256) (runs: 10001, μ: 977030, ~: 1009554)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10001, μ: 926331, ~: 926373)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10001, μ: 993798, ~: 1004339)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10001, μ: 898633, ~: 924258)
[@bush.fi/v3-vault]: [PASS] testERC4626BufferPreconditions() (gas: 192913)
[@bush.fi/v3-vault]: Suite result: ok. 9 passed; 0 failed; 0 skipped; finished in 203.12s (252.54s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 7 tests for test/foundry/YieldFees.t.sol:YieldFeesTest
[@bush.fi/v3-vault]: [PASS] testComputeYieldFeesDue__Fuzz(uint256,uint8,uint256,uint256,uint256) (runs: 10001, μ: 23965, ~: 23824)
[@bush.fi/v3-vault]: [PASS] testLiveBalancesWithRates__Fuzz(uint256,uint256,bool) (runs: 10001, μ: 2737402, ~: 2737397)
[@bush.fi/v3-vault]: [PASS] testNoYieldFeesIfExempt__Fuzz(uint256,uint256,uint256,bool) (runs: 10001, μ: 2836046, ~: 2836007)
[@bush.fi/v3-vault]: [PASS] testPoolDataAfterInitialization__Fuzz(bool) (runs: 10001, μ: 2730369, ~: 2730417)
[@bush.fi/v3-vault]: [PASS] testUpdateLiveTokenBalanceInPoolData__Fuzz(uint256,uint8,uint256,bool) (runs: 10001, μ: 28997, ~: 28773)
[@bush.fi/v3-vault]: [PASS] testYieldFeesOnSwap() (gas: 2809119)
[@bush.fi/v3-vault]: [PASS] testYieldFeesOnSwap__Fuzz(uint256,uint256,uint256) (runs: 10001, μ: 2813514, ~: 2813597)
[@bush.fi/v3-vault]: Suite result: ok. 7 passed; 0 failed; 0 skipped; finished in 635.41s (1978.73s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 19 tests for test/foundry/E2eSwap.t.sol:E2eSwapTest
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10001, μ: 607746, ~: 609291)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10001, μ: 632059, ~: 633394)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10001, μ: 604726, ~: 606598)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInDecimals__Fuzz(uint256,uint256) (runs: 10001, μ: 595815, ~: 597745)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10001, μ: 525957, ~: 526000)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInFees__Fuzz(uint256) (runs: 10001, μ: 513063, ~: 513103)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInLiquidity__Fuzz(uint256,uint256) (runs: 10001, μ: 554664, ~: 554719)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10001, μ: 525777, ~: 525887)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactInSwapAmount__Fuzz(uint256) (runs: 10001, μ: 512856, ~: 512969)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutCompleteSpecific__Fuzz(uint256,uint256,uint256,uint256,uint256[5]) (runs: 10001, μ: 695900, ~: 697420)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutComplete__Fuzz(uint256,uint256,uint256,uint256,uint256,uint256) (runs: 10001, μ: 720099, ~: 721463)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutDecimalsSpecific__Fuzz(uint256,uint256,uint256[5]) (runs: 10001, μ: 692774, ~: 694676)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutDecimals__Fuzz(uint256,uint256) (runs: 10001, μ: 683946, ~: 685768)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutFeesSpecific__Fuzz(uint256,uint256[5]) (runs: 10001, μ: 613995, ~: 614038)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutFees__Fuzz(uint256) (runs: 10001, μ: 601092, ~: 601134)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutLiquidity__Fuzz(uint256,uint256) (runs: 10001, μ: 642708, ~: 642765)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutSwapAmountSpecific__Fuzz(uint256,uint256[5]) (runs: 10001, μ: 613814, ~: 613925)
[@bush.fi/v3-vault]: [PASS] testDoUndoExactOutSwapAmount__Fuzz(uint256) (runs: 10001, μ: 600910, ~: 601020)
[@bush.fi/v3-vault]: [PASS] testExactInRepeatExactOutVariableFees__Fuzz(uint256,uint256,uint256[5]) (runs: 10001, μ: 359434, ~: 359590)
[@bush.fi/v3-vault]: Suite result: ok. 19 passed; 0 failed; 0 skipped; finished in 322.55s (506.55s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 18 tests for test/foundry/LinearPoolExtremeAmounts.t.sol:LinearPoolExtremeAmountsTest
[@bush.fi/v3-vault]: [PASS] testAddAndRemoveLiquidityProportionalMaxBPTAmount__FuzzSwapFee(uint256) (runs: 10001, μ: 765239, ~: 765244)
[@bush.fi/v3-vault]: [PASS] testAddAndRemoveLiquidityProportional__Fuzz(uint256,uint256[2],uint256) (runs: 10001, μ: 766450, ~: 766513)
[@bush.fi/v3-vault]: [PASS] testAddAndRemoveLiquidityProportional__FuzzBPTAmount(uint256) (runs: 10001, μ: 765610, ~: 765478)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactIn__Fuzz(uint256,uint256[2],uint256) (runs: 10001, μ: 770004, ~: 770281)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactIn__FuzzBPTAmount(uint256) (runs: 10001, μ: 766983, ~: 767025)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactIn__FuzzSwapFee(uint256) (runs: 10001, μ: 766350, ~: 766354)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactOut__Fuzz(uint256,uint256[2],uint256) (runs: 10001, μ: 836285, ~: 836565)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactOut__FuzzBPTAmount(uint256) (runs: 10001, μ: 833229, ~: 833273)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactOut__FuzzSwapFee(uint256) (runs: 10001, μ: 832578, ~: 832581)
[@bush.fi/v3-vault]: [PASS] testAddProportionalAndRemoveLiquidityExactIn__Fuzz(uint256,uint256[2],uint256) (runs: 10001, μ: 820981, ~: 829741)
[@bush.fi/v3-vault]: [PASS] testAddProportionalAndRemoveLiquidityExactIn__FuzzBPTAmount(uint256) (runs: 10001, μ: 817746, ~: 808854)
[@bush.fi/v3-vault]: [PASS] testAddProportionalAndRemoveLiquidityExactIn__FuzzSwapFee(uint256) (runs: 10001, μ: 807229, ~: 807233)
[@bush.fi/v3-vault]: [PASS] testAddUnbalancedAndRemoveLiquidityProportional__Fuzz(uint256[2],uint256[2],uint256) (runs: 10001, μ: 778355, ~: 778730)
[@bush.fi/v3-vault]: [PASS] testAddUnbalancedAndRemoveLiquidityProportional__FuzzAmountsIn(uint256[2]) (runs: 10001, μ: 775334, ~: 775522)
[@bush.fi/v3-vault]: [PASS] testAddUnbalancedAndRemoveLiquidityProportional__FuzzSwapFee(uint256) (runs: 10001, μ: 769473, ~: 769478)
[@bush.fi/v3-vault]: [PASS] testSwap__Fuzz(uint256,uint256,uint256[2]) (runs: 10001, μ: 745611, ~: 745844)
[@bush.fi/v3-vault]: [PASS] testSwap__FuzzSwapAmount(uint256) (runs: 10001, μ: 742528, ~: 742548)
[@bush.fi/v3-vault]: [PASS] testSwap__FuzzSwapFee(uint256) (runs: 10001, μ: 740985, ~: 740991)
[@bush.fi/v3-vault]: Suite result: ok. 18 passed; 0 failed; 0 skipped; finished in 589.87s (525.51s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 32 tests for test/foundry/CompositeLiquidityRouterERC4626Pool.t.sol:CompositeLiquidityRouterERC4626PoolTest
[@bush.fi/v3-vault]: [PASS] testAddLiquidityERC4626PoolProportionalIfAmountAboveMax() (gas: 358136)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalToERC4626PoolWhenStaticCall() (gas: 476993)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalToERC4626PoolWithEth__Fuzz(uint256,bool) (runs: 10001, μ: 809665, ~: 806205)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalToERC4626Pool__Fuzz(uint256) (runs: 10001, μ: 770481, ~: 770552)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalToPartialERC4626PoolAboveLimit() (gas: 392201)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalToPartialERC4626PoolWithEth__Fuzz(uint256,bool) (runs: 10001, μ: 747093, ~: 747157)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityProportionalToPartialERC4626Pool__Fuzz(uint256) (runs: 10001, μ: 723181, ~: 723250)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalancedToERC4626PoolWhenStaticCall() (gas: 478809)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalancedToERC4626PoolWithEth__Fuzz(uint256,bool) (runs: 10001, μ: 764034, ~: 760543)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalancedToERC4626PoolWithWrappedToken__Fuzz(uint256) (runs: 10001, μ: 721101, ~: 721173)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalancedToERC4626Pool__Fuzz(uint256) (runs: 10001, μ: 743773, ~: 743843)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalancedToPartialERC4626PoolWithEth__Fuzz(uint256,bool) (runs: 10001, μ: 716081, ~: 718004)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalancedToPartialERC4626Pool__Fuzz(uint256) (runs: 10001, μ: 695772, ~: 695852)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityUnbalancedZeroToERC4626Pool() (gas: 695128)
[@bush.fi/v3-vault]: [PASS] testCompositeLiquidityRouterVersion() (gas: 14438)
[@bush.fi/v3-vault]: [PASS] testERC4626BufferPreconditions() (gas: 192891)
[@bush.fi/v3-vault]: [PASS] testInvalidUnderlyingToken() (gas: 42340)
[@bush.fi/v3-vault]: [PASS] testQueryAddLiquidityProportionalToERC4626Pool() (gas: 491296)
[@bush.fi/v3-vault]: [PASS] testQueryAddLiquidityProportionalToPartialERC4626Pool() (gas: 420381)
[@bush.fi/v3-vault]: [PASS] testQueryAddLiquidityUnbalancedToERC4626Pool() (gas: 483565)
[@bush.fi/v3-vault]: [PASS] testQueryAddLiquidityUnbalancedToPartialERC4626Pool() (gas: 420048)
[@bush.fi/v3-vault]: [PASS] testQueryAddLiquidityUnbalancedZeroToERC4626Pool() (gas: 417768)
[@bush.fi/v3-vault]: [PASS] testQueryRemoveLiquidityProportionalFromERC4626Pool() (gas: 488590)
[@bush.fi/v3-vault]: [PASS] testQueryRemoveLiquidityProportionalFromPartialERC4626Pool() (gas: 483158)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityProportionalFromERC4626PoolIfAmountBelowMin() (gas: 353673)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityProportionalFromERC4626PoolWhenStaticCall() (gas: 456624)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityProportionalFromERC4626PoolWithEth__Fuzz(uint256) (runs: 10001, μ: 761157, ~: 761226)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityProportionalFromERC4626PoolWithWrappedToken__Fuzz(uint256) (runs: 10001, μ: 695010, ~: 695079)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityProportionalFromERC4626Pool__Fuzz(uint256) (runs: 10001, μ: 738206, ~: 738275)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityProportionalFromPartialERC4626PoolBelowLimit() (gas: 349531)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityProportionalFromPartialERC4626PoolWithEth__Fuzz(uint256) (runs: 10001, μ: 689814, ~: 689883)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityProportionalFromPartialERC4626Pool__Fuzz(uint256) (runs: 10001, μ: 666835, ~: 666907)
[@bush.fi/v3-vault]: Suite result: ok. 32 passed; 0 failed; 0 skipped; finished in 683.99s (679.21s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 7 tests for test/foundry/HookAdjustedSwap.t.sol:HookAdjustedSwapTest
[@bush.fi/v3-vault]: [PASS] testBalanceNotSettled() (gas: 231644)
[@bush.fi/v3-vault]: [PASS] testDiscountExactIn__Fuzz(uint256,uint256) (runs: 10001, μ: 478095, ~: 479021)
[@bush.fi/v3-vault]: [PASS] testDiscountExactOut__Fuzz(uint256,uint256) (runs: 10001, μ: 478311, ~: 479365)
[@bush.fi/v3-vault]: [PASS] testFeeExactInLimitViolation() (gas: 211274)
[@bush.fi/v3-vault]: [PASS] testFeeExactIn__Fuzz(uint256,uint256) (runs: 10001, μ: 484411, ~: 486047)
[@bush.fi/v3-vault]: [PASS] testFeeExactOutLimitViolation() (gas: 211760)
[@bush.fi/v3-vault]: [PASS] testFeeExactOut__Fuzz(uint256,uint256) (runs: 10001, μ: 484639, ~: 486414)
[@bush.fi/v3-vault]: Suite result: ok. 7 passed; 0 failed; 0 skipped; finished in 449.57s (173.23s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 18 tests for test/foundry/StablePoolExtremeAmounts.t.sol:StablePoolExtremeAmountsTest
[@bush.fi/v3-vault]: [PASS] testAddAndRemoveLiquidityProportionalMaxBPTAmount__FuzzSwapFee(uint256) (runs: 10001, μ: 826284, ~: 826288)
[@bush.fi/v3-vault]: [PASS] testAddAndRemoveLiquidityProportional__Fuzz(uint256,uint256[2],uint256) (runs: 10001, μ: 827257, ~: 827555)
[@bush.fi/v3-vault]: [PASS] testAddAndRemoveLiquidityProportional__FuzzBPTAmount(uint256) (runs: 10001, μ: 826417, ~: 826520)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactIn__Fuzz(uint256,uint256[2],uint256) (runs: 10001, μ: 854049, ~: 854762)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactIn__FuzzBPTAmount(uint256) (runs: 10001, μ: 850734, ~: 850878)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactIn__FuzzSwapFee(uint256) (runs: 10001, μ: 847256, ~: 847259)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactOut__Fuzz(uint256,uint256[2],uint256) (runs: 10001, μ: 939514, ~: 940920)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactOut__FuzzBPTAmount(uint256) (runs: 10001, μ: 936197, ~: 937000)
[@bush.fi/v3-vault]: [PASS] testAddLiquiditySingleTokenExactOutAndRemoveExactOut__FuzzSwapFee(uint256) (runs: 10001, μ: 926204, ~: 926208)
[@bush.fi/v3-vault]: [PASS] testAddProportionalAndRemoveLiquidityExactIn__Fuzz(uint256,uint256[2],uint256) (runs: 10001, μ: 908532, ~: 911161)
[@bush.fi/v3-vault]: [PASS] testAddProportionalAndRemoveLiquidityExactIn__FuzzBPTAmount(uint256) (runs: 10001, μ: 905378, ~: 908565)
[@bush.fi/v3-vault]: [PASS] testAddProportionalAndRemoveLiquidityExactIn__FuzzSwapFee(uint256) (runs: 10001, μ: 888368, ~: 888373)
[@bush.fi/v3-vault]: [PASS] testAddUnbalancedAndRemoveLiquidityProportional__Fuzz(uint256[2],uint256[2],uint256) (runs: 10001, μ: 859137, ~: 864250)
[@bush.fi/v3-vault]: [PASS] testAddUnbalancedAndRemoveLiquidityProportional__FuzzAmountsIn(uint256[2]) (runs: 10001, μ: 855656, ~: 856779)
[@bush.fi/v3-vault]: [PASS] testAddUnbalancedAndRemoveLiquidityProportional__FuzzSwapFee(uint256) (runs: 10001, μ: 840935, ~: 840938)
[@bush.fi/v3-vault]: [PASS] testSwap__Fuzz(uint256,uint256,uint256[2]) (runs: 10001, μ: 834133, ~: 834380)
[@bush.fi/v3-vault]: [PASS] testSwap__FuzzSwapAmount(uint256) (runs: 10001, μ: 831065, ~: 831084)
[@bush.fi/v3-vault]: [PASS] testSwap__FuzzSwapFee(uint256) (runs: 10001, μ: 825947, ~: 825951)
[@bush.fi/v3-vault]: Suite result: ok. 18 passed; 0 failed; 0 skipped; finished in 621.47s (735.93s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 50 tests for test/foundry/ProtocolFeeController.t.sol:ProtocolFeeControllerTest
[@bush.fi/v3-vault]: [PASS] testAdjustedSwapFeePrecision() (gas: 241806)
[@bush.fi/v3-vault]: [PASS] testAdjustedSwapFeePrecision__Fuzz(uint256,uint256) (runs: 10001, μ: 247606, ~: 247711)
[@bush.fi/v3-vault]: [PASS] testAdjustedYieldFeePrecision() (gas: 243133)
[@bush.fi/v3-vault]: [PASS] testAdjustedYieldFeePrecision__Fuzz(uint256,uint256) (runs: 10001, μ: 248910, ~: 249015)
[@bush.fi/v3-vault]: [PASS] testConstants() (gas: 14543)
[@bush.fi/v3-vault]: [PASS] testFeeInitialization() (gas: 2403685)
[@bush.fi/v3-vault]: [PASS] testInitialization() (gas: 73615)
[@bush.fi/v3-vault]: [PASS] testMaxPoolCreatorAndProtocolSwapFees() (gas: 2403988)
[@bush.fi/v3-vault]: [PASS] testMaxPoolCreatorAndProtocolYieldFees() (gas: 2405416)
[@bush.fi/v3-vault]: [PASS] testPermissionlessWithdrawalByNonPoolCreator() (gas: 2737004)
[@bush.fi/v3-vault]: [PASS] testPoolRegistration() (gas: 2367502)
[@bush.fi/v3-vault]: [PASS] testPoolRegistrationEventsExempt() (gas: 2185298)
[@bush.fi/v3-vault]: [PASS] testPoolRegistrationEventsNonExempt() (gas: 2309512)
[@bush.fi/v3-vault]: [PASS] testPoolRegistrationInvalid() (gas: 11514)
[@bush.fi/v3-vault]: [PASS] testPoolRegistrationWithCreatorFee() (gas: 2640200)
[@bush.fi/v3-vault]: [PASS] testProtocolFeeCollection() (gas: 2924538)
[@bush.fi/v3-vault]: [PASS] testProtocolFeeCollectionEvents() (gas: 2943542)
[@bush.fi/v3-vault]: [PASS] testProtocolFeeCollectionForToken() (gas: 2594582)
[@bush.fi/v3-vault]: [PASS] testProtocolSwapFeeHighResolution__Fuzz(uint16) (runs: 10001, μ: 146382, ~: 146361)
[@bush.fi/v3-vault]: [PASS] testProtocolSwapFeeLowResolution__Fuzz(uint256) (runs: 10001, μ: 224122, ~: 224172)
[@bush.fi/v3-vault]: [PASS] testProtocolYieldFeeHighResolution__Fuzz(uint16) (runs: 10001, μ: 146154, ~: 146133)
[@bush.fi/v3-vault]: [PASS] testProtocolYieldFeeLowResolution__Fuzz(uint256) (runs: 10001, μ: 224643, ~: 224692)
[@bush.fi/v3-vault]: [PASS] testRegisterExistingPoolInMigration() (gas: 5085860)
[@bush.fi/v3-vault]: [PASS] testSelfMigration() (gas: 21310)
[@bush.fi/v3-vault]: [PASS] testSetGlobalProtocolSwapFeePercentageEvent() (gas: 80906)
[@bush.fi/v3-vault]: [PASS] testSetGlobalProtocolSwapFeePercentagePermissioned() (gas: 27824)
[@bush.fi/v3-vault]: [PASS] testSetGlobalProtocolSwapFeePercentageRange() (gas: 91431)
[@bush.fi/v3-vault]: [PASS] testSetGlobalProtocolSwapFeePercentageTooHigh() (gas: 56669)
[@bush.fi/v3-vault]: [PASS] testSetGlobalProtocolYieldFeePercentageEvent() (gas: 81061)
[@bush.fi/v3-vault]: [PASS] testSetGlobalProtocolYieldFeePercentagePermissioned() (gas: 27891)
[@bush.fi/v3-vault]: [PASS] testSetGlobalProtocolYieldFeePercentageRange() (gas: 91347)
[@bush.fi/v3-vault]: [PASS] testSetGlobalProtocolYieldFeePercentageTooHigh() (gas: 56799)
[@bush.fi/v3-vault]: [PASS] testSetMaliciousGlobalFeePercentages() (gas: 97891)
[@bush.fi/v3-vault]: [PASS] testSetPoolCreatorSwapFeePercentageAboveMAx() (gas: 32667)
[@bush.fi/v3-vault]: [PASS] testSetPoolCreatorYieldFeePercentageAboveMAx() (gas: 32777)
[@bush.fi/v3-vault]: [PASS] testSettingPoolProtocolSwapFee() (gas: 187803)
[@bush.fi/v3-vault]: [PASS] testSettingPoolProtocolSwapFeeEvent() (gas: 154071)
[@bush.fi/v3-vault]: [PASS] testSettingPoolProtocolSwapFeeTooHigh() (gas: 59320)
[@bush.fi/v3-vault]: [PASS] testSettingPoolProtocolYieldFee() (gas: 188122)
[@bush.fi/v3-vault]: [PASS] testSettingPoolProtocolYieldFeeEvent() (gas: 154570)
[@bush.fi/v3-vault]: [PASS] testSettingPoolProtocolYieldFeeTooHigh() (gas: 59102)
[@bush.fi/v3-vault]: [PASS] testUpdateProtocolSwapFeePercentage() (gas: 2612028)
[@bush.fi/v3-vault]: [PASS] testUpdateProtocolYieldFeePercentage() (gas: 2613741)
[@bush.fi/v3-vault]: [PASS] testWithdrawProtocolFeesForTokenInvalidToken() (gas: 75662)
[@bush.fi/v3-vault]: [PASS] testWithdrawProtocolFeesForTokenPermissioned() (gas: 34584)
[@bush.fi/v3-vault]: [PASS] testWithdrawProtocolFeesForTokenPoolNotRegistered() (gas: 66179)
[@bush.fi/v3-vault]: [PASS] testWithdrawProtocolFeesPermissioned() (gas: 32422)
[@bush.fi/v3-vault]: [PASS] testWithdrawProtocolFeesPoolNotRegistered() (gas: 65493)
[@bush.fi/v3-vault]: [PASS] testWithdrawalByNonPoolCreator() (gas: 33207)
[@bush.fi/v3-vault]: [PASS] testWithdrawalWithNoCreator() (gas: 2213221)
[@bush.fi/v3-vault]: Suite result: ok. 50 passed; 0 failed; 0 skipped; finished in 670.89s (93.30s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 91 test suites in 698.36s (7036.52s CPU time): 1127 tests passed, 0 failed, 0 skipped (1127 total tests)
[@bush.fi/v3-vault]: No files changed, compilation skipped
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 11 tests for test/foundry/fork/ERC4626MainnetAaveUsdc.t.sol:ERC4626MainnetAaveUsdcTest
[@bush.fi/v3-vault]: [PASS] testAddAndRemoveLiquidityFromBuffer__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 465133, ~: 467073)
[@bush.fi/v3-vault]: [PASS] testAddLiquidityToBuffer__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 408483, ~: 408400)
[@bush.fi/v3-vault]: [PASS] testDeposit__Fork__Fuzz(uint256) (runs: 1001, μ: 249478, ~: 249794)
[@bush.fi/v3-vault]: [PASS] testMint__Fork__Fuzz(uint256) (runs: 1001, μ: 254698, ~: 254896)
[@bush.fi/v3-vault]: [PASS] testPreviewDepositRounding__Fork__Fuzz(uint256) (runs: 1001, μ: 39359, ~: 39071)
[@bush.fi/v3-vault]: [PASS] testPreviewMintRounding__Fork__Fuzz(uint256) (runs: 1001, μ: 39469, ~: 39198)
[@bush.fi/v3-vault]: [PASS] testPreviewRedeemRounding__Fork__Fuzz(uint256) (runs: 1001, μ: 39559, ~: 39249)
[@bush.fi/v3-vault]: [PASS] testPreviewWithdrawRounding__Fork__Fuzz(uint256) (runs: 1001, μ: 39399, ~: 39116)
[@bush.fi/v3-vault]: [PASS] testRedeem__Fork__Fuzz(uint256) (runs: 1001, μ: 243392, ~: 243703)
[@bush.fi/v3-vault]: [PASS] testRemoveLiquidityFromBuffer__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 396245, ~: 398452)
[@bush.fi/v3-vault]: [PASS] testWithdraw__Fork__Fuzz(uint256) (runs: 1001, μ: 243535, ~: 243885)
[@bush.fi/v3-vault]: Suite result: ok. 11 passed; 0 failed; 0 skipped; finished in 13.22s (12.49s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 12 tests for test/foundry/fork/YieldBearingPoolMainnetGearbox.t.sol:YieldBearingPoolMainnetGearboxTest
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutBufferUnbalancedExactIn__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 762789, ~: 767806)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutBufferUnbalancedExactOut__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 781076, ~: 786173)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutOutOfBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 654604, ~: 654626)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutOutOfBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 673102, ~: 673125)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutWithinBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 519385, ~: 519409)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutWithinBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 534807, ~: 534831)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutBufferUnbalancedExactIn__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 755498, ~: 759007)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutBufferUnbalancedExactOut__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 771261, ~: 775254)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutOutOfBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 645783, ~: 645802)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutOutOfBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 662022, ~: 662049)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutWithinBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 512788, ~: 512814)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutWithinBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 526072, ~: 526093)
[@bush.fi/v3-vault]: Suite result: ok. 12 passed; 0 failed; 0 skipped; finished in 36.40s (35.67s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 12 tests for test/foundry/fork/YieldBearingPoolMainnetYearn.t.sol:YieldBearingPoolMainnetYearnTest
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutBufferUnbalancedExactIn__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 810217, ~: 815976)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutBufferUnbalancedExactOut__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 825941, ~: 831149)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutOutOfBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 700847, ~: 700870)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutOutOfBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 716041, ~: 716065)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutWithinBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 574223, ~: 574246)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutWithinBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 585336, ~: 585356)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutBufferUnbalancedExactIn__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 817723, ~: 824845)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutBufferUnbalancedExactOut__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 834379, ~: 842164)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutOutOfBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 709697, ~: 709718)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutOutOfBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 727015, ~: 727033)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutWithinBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 580710, ~: 580733)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutWithinBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 594052, ~: 594072)
[@bush.fi/v3-vault]: Suite result: ok. 12 passed; 0 failed; 0 skipped; finished in 55.91s (40.80s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 12 tests for test/foundry/fork/YieldBearingPoolMainnetFrax.t.sol:YieldBearingPoolMainnetFraxTest
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutBufferUnbalancedExactIn__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 732475, ~: 736103)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutBufferUnbalancedExactOut__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 747460, ~: 750801)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutOutOfBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 628077, ~: 628097)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutOutOfBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 642794, ~: 642815)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutWithinBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 521011, ~: 521034)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutWithinBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 533636, ~: 533654)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutBufferUnbalancedExactIn__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 725743, ~: 728632)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutBufferUnbalancedExactOut__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 738626, ~: 741500)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutOutOfBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 620583, ~: 620603)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutOutOfBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 633453, ~: 633469)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutWithinBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 515129, ~: 515146)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutWithinBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 524975, ~: 525000)
[@bush.fi/v3-vault]: Suite result: ok. 12 passed; 0 failed; 0 skipped; finished in 56.47s (26.73s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 12 tests for test/foundry/fork/YieldBearingPoolMainnetAave.t.sol:YieldBearingPoolMainnetAaveTest
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutBufferUnbalancedExactIn__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 1052755, ~: 1058710)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutBufferUnbalancedExactOut__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 1073148, ~: 1078990)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutOutOfBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 943385, ~: 943408)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutOutOfBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 963686, ~: 963710)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutWithinBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 571317, ~: 571338)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutWithinBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 581987, ~: 582008)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutBufferUnbalancedExactIn__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 1065001, ~: 1073521)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutBufferUnbalancedExactOut__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 1087869, ~: 1095735)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutOutOfBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 958174, ~: 958198)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutOutOfBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 980391, ~: 980408)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutWithinBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 577559, ~: 577576)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutWithinBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 590241, ~: 590263)
[@bush.fi/v3-vault]: Suite result: ok. 12 passed; 0 failed; 0 skipped; finished in 60.68s (53.89s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 12 tests for test/foundry/fork/YieldBearingPoolMainnetAave2.t.sol:YieldBearingPoolMainnetAave2Test
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutBufferUnbalancedExactIn__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 1051797, ~: 1059002)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutBufferUnbalancedExactOut__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 1070843, ~: 1079282)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutOutOfBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 944128, ~: 944146)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutOutOfBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 964431, ~: 964448)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutWithinBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 571447, ~: 571468)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutWithinBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 582112, ~: 582138)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutBufferUnbalancedExactIn__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 1052608, ~: 1061642)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutBufferUnbalancedExactOut__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 1075141, ~: 1079178)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutOutOfBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 946742, ~: 946765)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutOutOfBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 968511, ~: 968529)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutWithinBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 571401, ~: 571425)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutWithinBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 585644, ~: 585666)
[@bush.fi/v3-vault]: Suite result: ok. 12 passed; 0 failed; 0 skipped; finished in 65.67s (55.64s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 12 tests for test/foundry/fork/YieldBearingPoolMainnetMorpho.t.sol:YieldBearingPoolMainnetMorphoTest
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutBufferUnbalancedExactIn__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 2322789, ~: 2353019)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutBufferUnbalancedExactOut__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 2317446, ~: 2347883)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutOutOfBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 2175000, ~: 2175018)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutOutOfBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 2171291, ~: 2169902)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutWithinBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 883748, ~: 883799)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutWithinBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 852741, ~: 852761)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutBufferUnbalancedExactIn__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 2319655, ~: 2348134)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutBufferUnbalancedExactOut__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 2312686, ~: 2342113)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutOutOfBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 2174130, ~: 2175710)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutOutOfBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 2163833, ~: 2163855)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutWithinBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 879957, ~: 879978)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutWithinBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 848107, ~: 848146)
[@bush.fi/v3-vault]: Suite result: ok. 12 passed; 0 failed; 0 skipped; finished in 65.67s (193.27s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 12 tests for test/foundry/fork/YieldBearingPoolMainnetMorpho2.t.sol:YieldBearingPoolMainnetMorpho2Test
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutBufferUnbalancedExactIn__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 2721716, ~: 2754018)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutBufferUnbalancedExactOut__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 2716734, ~: 2748045)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutOutOfBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 2568660, ~: 2571286)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutOutOfBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 2562156, ~: 2559501)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutWithinBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 901102, ~: 901139)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutWithinBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 868392, ~: 868419)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutBufferUnbalancedExactIn__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 2391441, ~: 2423921)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutBufferUnbalancedExactOut__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 2387092, ~: 2420648)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutOutOfBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 2239150, ~: 2241446)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutOutOfBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 2234876, ~: 2232173)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutWithinBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 902999, ~: 903022)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutWithinBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 873319, ~: 873368)
[@bush.fi/v3-vault]: Suite result: ok. 12 passed; 0 failed; 0 skipped; finished in 65.67s (199.79s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 12 tests for test/foundry/fork/YieldBearingPoolSepoliaAave.t.sol:YieldBearingPoolSepoliaAaveTest
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutBufferUnbalancedExactIn__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 1044664, ~: 1051167)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutBufferUnbalancedExactOut__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 1065168, ~: 1071302)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutOutOfBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 938549, ~: 938571)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutOutOfBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 958701, ~: 958724)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutWithinBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 562959, ~: 562982)
[@bush.fi/v3-vault]: [PASS] testToken1InToken2OutWithinBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 573575, ~: 573598)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutBufferUnbalancedExactIn__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 1045189, ~: 1051202)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutBufferUnbalancedExactOut__Fork__Fuzz(uint256,uint256,uint256) (runs: 1001, μ: 1065208, ~: 1071293)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutOutOfBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 938558, ~: 938581)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutOutOfBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 958646, ~: 958672)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutWithinBufferExactIn__Fork__Fuzz(uint256) (runs: 1001, μ: 562905, ~: 562926)
[@bush.fi/v3-vault]: [PASS] testToken2InToken1OutWithinBufferExactOut__Fork__Fuzz(uint256) (runs: 1001, μ: 573567, ~: 573589)
[@bush.fi/v3-vault]: Suite result: ok. 12 passed; 0 failed; 0 skipped; finished in 65.67s (51.20s CPU time)
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Ran 9 test suites in 65.78s (485.39s CPU time): 107 tests passed, 0 failed, 0 skipped (107 total tests)
[@bush.fi/v3-vault]: Solidity 0.8.26, 0.8.27 are not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Learn more at https://hardhat.org/hardhat-runner/docs/reference/solidity-support
[@bush.fi/v3-vault]: 
[@bush.fi/v3-vault]: Process exited (exit code 0), completed in 44m 52s
Done in 44m 52s
```
