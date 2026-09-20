// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.24;

import { IAuthorizer } from "@bush.fi/v3-interfaces/contracts/vault/IAuthorizer.sol";


contract BootstrapAuthorizer is IAuthorizer {
    address public immutable owner;

    constructor(address owner_) {
        owner = owner_;
    }

    /// @inheritdoc IAuthorizer
    function canPerform(bytes32, address account, address) external view returns (bool) {
        return account == owner;
    }
}
