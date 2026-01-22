// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IChallenge4 {
    function mintFlag() external;
}

contract S2C4Solver {
    address public immutable challenge;
    uint256 public constant EXPECTED_WEI = 1 gwei;

    constructor(address _challenge) payable {
        challenge = _challenge;
    }

    // O Challenge vai chamar isso com call("") e value=0.
    // Aqui a gente "paga de volta" 1 gwei para o Challenge.
    receive() external payable {
        (bool ok, ) = challenge.call{value: EXPECTED_WEI}("");
        require(ok, "payback failed");
    }

    fallback() external payable {
        (bool ok, ) = challenge.call{value: EXPECTED_WEI}("");
        require(ok, "payback failed");
    }

    function solve() external {
        IChallenge4(challenge).mintFlag();
    }
}
