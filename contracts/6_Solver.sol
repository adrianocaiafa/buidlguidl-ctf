// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

interface IChallenge6 {
    function mintFlag(uint256 code) external;
}

contract Challenge6Solver {
    function name() external pure returns (string memory) {
        return "BG CTF Challenge 6 Solution";
    }

    function callMint(address challenge6, uint256 code, uint256 gasAmount) external {
        // low-level call pra controlar gas com precisão
        (bool ok, bytes memory data) =
            challenge6.call{gas: gasAmount}(abi.encodeWithSelector(IChallenge6.mintFlag.selector, code));

        // se falhar, repassa o revert pra você ver "Wrong gas: X" etc
        if (!ok) {
            assembly {
                revert(add(data, 0x20), mload(data))
            }
        }
    }
}
