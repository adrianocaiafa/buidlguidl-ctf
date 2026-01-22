// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IChallenge3 {
    function mintFlag() external;
}

contract S2C3Solver {
    // O challenge vai chamar isso em msg.sender
    function accessKey() external pure returns (string memory) {
        return "LET_ME_IN";
    }

    // Você chama isso da sua wallet
    function solve(address challenge) external {
        IChallenge3(challenge).mintFlag();
    }
}
