// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.17;

import { RingBufferLib } from "src/RingBufferLib.sol";

contract RingBufferLibWrapper {

    function wrap(uint256 _index, uint256 _cardinality) external pure returns (uint256) {
        uint256 result = RingBufferLib.wrap(_index, _cardinality);
        return result;
    }

    function offset(
        uint256 _index,
        uint256 _amount,
        uint256 _cardinality
    ) external pure returns (uint256) {
        uint256 result = RingBufferLib.offset(_index, _amount, _cardinality);
        return result;
    }

    function newestIndex(uint256 _nextIndex, uint256 _cardinality)
        external
        pure
        returns (uint256)
    {
        uint256 result = RingBufferLib.newestIndex(_nextIndex, _cardinality);
        return result;
    }

    function oldestIndex(uint256 _nextIndex, uint256 _length, uint256 _cardinality)
        external
        pure
        returns (uint256)
    {
        uint256 result = RingBufferLib.oldestIndex(_nextIndex, _length, _cardinality);
        return result;
    }

    /// @notice Computes the ring buffer index that follows the given one, wrapped by cardinality
    /// @param _index The index to increment
    /// @param _cardinality The number of elements in the Ring Buffer
    /// @return The next index relative to the given index.  Will wrap around to 0 if the next index == cardinality
    function nextIndex(uint256 _index, uint256 _cardinality)
        external
        pure
        returns (uint256)
    {
        uint256 result = RingBufferLib.nextIndex(_index, _cardinality);
        return result;
    }
}
