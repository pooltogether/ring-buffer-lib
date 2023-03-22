// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import { RingBufferLib } from "src/RingBufferLib.sol";
import { RingBufferLibWrapper } from "test/RingBufferLibWrapper.sol";

contract RingBufferLibTest is Test {

    RingBufferLibWrapper wrapper;

    function setUp() public {
        wrapper = new RingBufferLibWrapper();
    }

    function testWrap() public {
        assertEq(wrapper.wrap(15, 10), 5);
    }

    function testOffset_fromEnd() public {
        assertEq(wrapper.offset(4, 2, 5), 2);
    }

    function testOffset_withWrapAround() public {
        assertEq(wrapper.offset(1, 3, 4), 2);
    }

    function testNewestIndex_when_nextIndex_is_first() public {
        assertEq(wrapper.newestIndex(0, 4), 3);
    }

    function testNewestIndex_when_nextIndex_is_last() public {
        assertEq(wrapper.newestIndex(3, 4), 2);
    }

    function testNewestIndex_when_onlyOne() public {
        assertEq(wrapper.newestIndex(0, 1), 0);
    }

    function testNewestIndex_when_zero() public {
        assertEq(wrapper.newestIndex(2, 0), 0);
    }

    function testOldestIndex_when_nextIndex_is_first() public {
        assertEq(wrapper.oldestIndex(0, 4, 4), 0);
    }

    function testOldestIndex_when_count_lt_card() public {
        assertEq(wrapper.oldestIndex(1, 2, 4), 0);
    }

    function testNextIndex_when_zero() public {
        assertEq(wrapper.nextIndex(0, 3), 1);
    }

    function testNextIndex_at_end() public {
        assertEq(wrapper.nextIndex(2, 3), 0);
    }

    function testPrevIndex_when_zero() public {
        assertEq(wrapper.prevIndex(0, 3), 2);
    }

    function testPrevIndex_at_end() public {
        assertEq(wrapper.prevIndex(2, 3), 1);
    }

}
