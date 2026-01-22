// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Create2Deployer {
    event Deployed(address addr, bytes32 salt);

    function deploy(bytes32 salt, bytes memory bytecode) external returns (address addr) {
        assembly {
            addr := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
            if iszero(addr) { revert(0, 0) }
        }
        emit Deployed(addr, salt);
    }
}
