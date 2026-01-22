// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ICh8 {
    function mintFlag(bytes32 _password) external payable;
}

contract S2C8Solver {
    address public immutable ch;

    constructor(address _ch) payable {
        ch = _ch;
    }

    // O Challenge vai tentar te mandar 1 wei (tem que falhar) e 2 wei (tem que funcionar)
    receive() external payable {
        if (msg.value == 1) {
            revert("reject 1 wei");
        }
        // aceita qualquer outro valor (inclui 2 wei)
    }

    function solve(bytes32 pw) external {
        // precisa ter >= 4 wei antes do call:
        // - 2 wei vão como msg.value
        // - lock2 exige que ainda sobrem >= 2 wei no msg.sender
        require(address(this).balance >= 4, "fund me with >=4 wei");

        ICh8(ch).mintFlag{value: 2}(pw);
    }

    // opcional: pra você mandar mais wei depois do deploy
    function fund() external payable {}
}
