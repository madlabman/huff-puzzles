// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import {NonMatchingSelectorHelper} from "./test-utils/NonMatchingSelectorHelper.sol";

interface Emitter {
    function value(uint256, uint256) external;
}

contract EmitterTest is Test, NonMatchingSelectorHelper {
    Emitter public emitter;

    event Value(uint256 indexed, uint256);

    function setUp() public {
        emitter = Emitter(HuffDeployer.config().deploy("Emitter"));
    }

    function testEmitter(uint256 a, uint256 b) public {
        vm.expectEmit(true, true, true, true);
        emit Value(a, b);
        emitter.value(a, b);
    }

    /// @notice Test that a non-matching selector reverts
    function testNonMatchingSelector(bytes32 callData) public {
        bytes4[] memory func_selectors = new bytes4[](1);
        func_selectors[0] = Emitter.value.selector;

        bool success = nonMatchingSelectorHelper(func_selectors, callData, address(emitter));
        assert(!success);
    }
}
