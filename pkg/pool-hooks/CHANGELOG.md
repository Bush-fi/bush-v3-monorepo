# @bush.fi/v3-pool-hooks

## 0.1.2

### Patch Changes

- Republished with resolved `@bush.fi` workspace dependency versions. The previous release was published with unresolved `workspace:*` ranges in its `dependencies`, which made it uninstallable outside this monorepo.

## 0.1.1

### Patch Changes

- b74b1bf: Fix StableSurgeMedianMath.findMedian in-place sort mutation. calculateImbalance now deletes the input array after use, converting potential silent misuse into a revert.
- Updated dependencies [4c716b3]
- Updated dependencies [6d56efe]
  - @bush.fi/v3-vault@1.0.1
  - @bush.fi/v3-pool-stable@1.0.1
  - @bush.fi/v3-pool-utils@1.0.1
