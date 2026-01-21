// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

interface IChallenge3 {
    function mintFlag() external;
}

contract Challenge3Solver {
    constructor(address challenge3) {
        IChallenge3(challenge3).mintFlag();
    }
}
