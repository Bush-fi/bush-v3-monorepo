# <img src="../../logo.svg" alt="Bush" height="128px">

# Bush V3 Pool Testing

This package has no contracts of its own. It exists purely so that a project building a **new** pool type or
hook, in its own repo, can pull in everything needed to write a Foundry test suite for it with a single
install, instead of having to work out which of the core packages holds which piece.

Installing it brings in:

- **`@bush/v3-vault`** – `BaseVaultTest.sol` / `BasePoolTest.sol` (the base test contracts every pool/hook test
  extends), `VaultContractsDeployer.sol`, `Permit2Helpers.sol`, and the Vault mocks (`VaultMock`, `RouterMock`,
  `PoolHooksMock`, `PoolFactoryMock`, etc.) needed to stand up a working Vault in a test.
- **`@bush/v3-pool-utils`** – `BasePoolFactory.sol` / `BasePoolAuthentication.sol` / `PoolInfo.sol`, the base
  contracts a new pool factory extends.
- **`@bush/v3-pool-hooks`** – `SurgeHookCommon.sol` and the worked hook examples (`StableSurgeHook`,
  `MevCaptureHook`, etc.) as reference implementations, plus their test deployers.
- **`@bush/v3-interfaces`** – `IHooks`, `IBasePool`, and friends, plus mock interfaces used by the Vault mocks.
- **`@bush/v3-solidity-utils`** – shared math libraries and `ArrayHelpers.sol`.

## Install

```bash
yarn add -D @bush/v3-pool-testing
# or: npm install --save-dev @bush/v3-pool-testing
```

## Foundry setup

Add remappings so these packages resolve the way they do inside this monorepo (each contract imports its
sibling packages by their npm scope, e.g. `@bush/v3-interfaces/contracts/...`):

```toml
# foundry.toml
[profile.default]
libs = ["node_modules"]
remappings = [
    "@bush/v3-vault/=node_modules/@bush/v3-vault/",
    "@bush/v3-pool-utils/=node_modules/@bush/v3-pool-utils/",
    "@bush/v3-pool-hooks/=node_modules/@bush/v3-pool-hooks/",
    "@bush/v3-interfaces/=node_modules/@bush/v3-interfaces/",
    "@bush/v3-solidity-utils/=node_modules/@bush/v3-solidity-utils/",
    "@openzeppelin/=node_modules/@openzeppelin/",
    "permit2/=node_modules/permit2/",
    "forge-std/=node_modules/forge-std/src/",
]
```

`forge-std` isn't pulled in transitively — install it yourself (`forge install foundry-rs/forge-std` or
`yarn add -D forge-std`), same as for any Foundry project.

## Writing a test for a new pool

```solidity
import { BaseVaultTest } from "@bush/v3-vault/test/foundry/utils/BaseVaultTest.sol";
import { MyPoolFactory } from "../contracts/MyPoolFactory.sol";

contract MyPoolTest is BaseVaultTest {
    function setUp() public override {
        super.setUp();
        // deploy MyPoolFactory + a pool against the mock vault, as the existing
        // *ContractsDeployer.sol files in @bush/v3-pool-weighted / @bush/v3-pool-stable
        // demonstrate for the pools already in this repo.
    }
}
```

## Licensing

[GNU General Public License Version 3 (GPL v3)](../../LICENSE).
