// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IChallenge10 {
    function mintFlag() external;
}

contract Challenge10Caller {
    function attack(address challenge) external {
        IChallenge10(challenge).mintFlag();
    }
}
