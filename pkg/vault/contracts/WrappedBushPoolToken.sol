// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import { ERC20Permit } from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import { SafeERC20 } from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import { IWrappedBushPoolToken } from "@bush.fi/v3-interfaces/contracts/vault/IWrappedBushPoolToken.sol";
import { IVault } from "@bush.fi/v3-interfaces/contracts/vault/IVault.sol";

/**
 * @notice ERC20 wrapper for Bush Pool Token (BPT).
 * @dev This allows users to deposit BPT and receive wrapped tokens 1:1, or burn wrapped tokens to redeem the original
 * amount of BPT.
 *
 * Minting and burning are only allowed when the Vault is locked.
 */
contract WrappedBushPoolToken is IWrappedBushPoolToken, ERC20, ERC20Permit {
    using SafeERC20 for *;

    IERC20 public immutable bushPoolToken;
    IVault public immutable vault;

    constructor(
        IVault vault_,
        IERC20 bushPoolToken_,
        string memory name_,
        string memory symbol_
    ) ERC20(name_, symbol_) ERC20Permit(name_) {
        vault = vault_;
        bushPoolToken = bushPoolToken_;
    }

    modifier onlyIfVaultLocked() {
        if (vault.isUnlocked()) {
            revert VaultIsUnlocked();
        }
        _;
    }

    /// @inheritdoc IWrappedBushPoolToken
    function mint(uint256 amount) public onlyIfVaultLocked {
        bushPoolToken.safeTransferFrom(msg.sender, address(this), amount);

        _mint(msg.sender, amount);
    }

    /// @inheritdoc IWrappedBushPoolToken
    function burn(uint256 value) public onlyIfVaultLocked {
        _burnAndTransfer(msg.sender, value);
    }

    /// @inheritdoc IWrappedBushPoolToken
    function burnFrom(address account, uint256 value) public onlyIfVaultLocked {
        _spendAllowance(account, msg.sender, value);

        _burnAndTransfer(account, value);
    }

    function _burnAndTransfer(address account, uint256 value) internal {
        _burn(account, value);

        bushPoolToken.transfer(account, value);
    }
}
