// Mines a salt for VaultFactory.create() so the Vault lands at an address with a chosen hex prefix.
//
// The Vault is deployed via CREATE3 (see pkg/solidity-utils/contracts/solmate/CREATE3.sol), so its
// address depends only on the VaultFactory's own address and the salt -- NOT on the Vault's creation
// code or constructor args. That means this script only needs the (already deployed, or about-to-be-
// deployed) VaultFactory address to search for a matching salt.
//
// Usage:
//   node pkg/vault/scripts/mineVaultSalt.mjs --factory 0xYourVaultFactoryAddress --prefix b055 [--workers 8]
//0x6418e85A3fb7CE32B85E09FD5100AC37b9103Cb2
// The found salt is what you pass as `salt` to VaultFactory.create(salt, targetAddress, ...), and
// `targetAddress` is the printed address itself.

import { Worker, isMainThread, parentPort, workerData } from 'node:worker_threads';
import { cpus } from 'node:os';
import { keccak256, concat, getBytes, zeroPadValue, toBeHex, getAddress } from 'ethers';

// _PROXY_BYTECODE from CREATE3.sol: hex"67_36_3d_3d_37_36_3d_34_f0_3d_52_60_08_60_18_f3"
const PROXY_BYTECODE = '0x67363d3d37363d34f03d5260086018f3';
const PROXY_BYTECODE_HASH = keccak256(PROXY_BYTECODE);

// Mirrors CREATE3.getDeployed(salt, creator).
function getDeployedAddress(factory, saltBytes32) {
  const proxy = getBytes(
    keccak256(concat(['0xff', factory, saltBytes32, PROXY_BYTECODE_HASH]))
  ).slice(12);

  const deployed = getBytes(keccak256(concat(['0xd694', proxy, '0x01']))).slice(12);

  return getAddress('0x' + Buffer.from(deployed).toString('hex'));
}

function parseArgs() {
  const args = process.argv.slice(2);
  const opts = { workers: cpus().length };
  for (let i = 0; i < args.length; i++) {
    const key = args[i];
    if (key === '--factory') opts.factory = args[++i];
    else if (key === '--prefix') opts.prefix = args[++i];
    else if (key === '--workers') opts.workers = parseInt(args[++i], 10);
    else if (key === '--case-sensitive') opts.caseSensitive = true;
  }
  if (!opts.factory) throw new Error('--factory <VaultFactory address> is required');
  if (!opts.prefix) throw new Error('--prefix <hex prefix, no 0x needed> is required');
  opts.factory = getAddress(opts.factory);
  opts.prefix = opts.prefix.replace(/^0x/i, '');
  if (!/^[0-9a-fA-F]+$/.test(opts.prefix)) throw new Error('--prefix must be hex');
  if (opts.prefix.length > 40) throw new Error('--prefix is longer than an address (40 hex chars)');
  return opts;
}

if (isMainThread) {
  const opts = parseArgs();

  console.log(`Mining salt for VaultFactory ${opts.factory}`);
  console.log(`Target prefix: 0x${opts.prefix}${opts.caseSensitive ? ' (case-sensitive)' : ' (case-insensitive)'}`);
  console.log(`Workers: ${opts.workers}`);

  const startSeed = BigInt(keccak256(toBeHex(Date.now(), 32)));
  let totalHashes = 0;
  const startTime = Date.now();
  const workers = [];

  const statsTimer = setInterval(() => {
    const elapsed = (Date.now() - startTime) / 1000;
    console.log(`  ... ${totalHashes.toLocaleString()} salts tried (${Math.round(totalHashes / elapsed).toLocaleString()}/s)`);
  }, 5000);

  for (let i = 0; i < opts.workers; i++) {
    const worker = new Worker(new URL(import.meta.url), {
      workerData: {
        factory: opts.factory,
        prefix: opts.prefix,
        caseSensitive: !!opts.caseSensitive,
        start: (startSeed + BigInt(i)).toString(),
        step: opts.workers.toString(),
      },
    });
    workers.push(worker);

    worker.on('message', (msg) => {
      if (msg.type === 'progress') {
        totalHashes += msg.count;
        return;
      }
      if (msg.type === 'found') {
        clearInterval(statsTimer);
        console.log('\nFound a match:');
        console.log(`  salt:    ${msg.salt}`);
        console.log(`  address: ${msg.address}`);
        for (const w of workers) w.terminate();
      }
    });
  }
} else {
  const { factory, prefix, caseSensitive, start, step } = workerData;
  const stepBig = BigInt(step);
  let salt = BigInt(start);
  let count = 0;

  const target = caseSensitive ? prefix : prefix.toLowerCase();

  for (;;) {
    const saltBytes32 = zeroPadValue(toBeHex(salt & ((1n << 256n) - 1n)), 32);
    const address = getDeployedAddress(factory, saltBytes32);
    const addressHex = address.slice(2);
    const candidate = caseSensitive ? addressHex : addressHex.toLowerCase();

    if (candidate.startsWith(target)) {
      parentPort.postMessage({ type: 'found', salt: saltBytes32, address });
      break;
    }

    salt += stepBig;
    count++;
    if (count % 5000 === 0) {
      parentPort.postMessage({ type: 'progress', count: 5000 });
      count = 0;
    }
  }
}
