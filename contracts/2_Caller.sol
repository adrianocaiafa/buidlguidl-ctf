// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

interface IChallenge2 {
    function justCallMe() external;
}

contract Challenge2Caller {
    function solve(address challenge2) external {
        IChallenge2(challenge2).justCallMe();
    }
}
