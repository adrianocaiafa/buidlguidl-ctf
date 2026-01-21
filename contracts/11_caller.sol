// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IChallenge11 {
    function mintFlag() external;
}

contract Caller11 {
    function go(address challenge11) external {
        IChallenge11(challenge11).mintFlag();
    }
}
