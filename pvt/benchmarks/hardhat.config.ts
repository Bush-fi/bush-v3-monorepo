import '@nomicfoundation/hardhat-ethers';

import { hardhatBaseConfig } from '@bush/v3-common';

export default {
  networks: {
    hardhat: {
      allowUnlimitedContractSize: true,
    },
  },
  solidity: {
    compilers: hardhatBaseConfig.compilers,
  },
};
