// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SignHelper {
    function hash(address user) external pure returns (bytes32) {
        return keccak256(abi.encode("BG CTF Challenge 9", user));
    }
}