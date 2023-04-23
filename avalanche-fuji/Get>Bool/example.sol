// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

/**
 * @notice DO NOT USE THIS CODE IN PRODUCTION. This is an example contract.
 */
contract GetBool is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    uint256 private constant ORACLE_PAYMENT = ((0 * LINK_DIVISIBILITY) / 100); // n * 10**18 // 1 LINK
    bool public value;

    event RequestValue(bytes32 indexed requestId, bool indexed value);

    string constant jobId = "c4cb120c4e7046d28eab580423a9643d"; // Fuji Testnet

    constructor() ConfirmedOwner(msg.sender) {
        // Fuji Testnet
        setChainlinkToken(0x0b9d5D9136855f6FEc3c0993feE6E9CE8a297846);
        setChainlinkOracle(0x26a03479361c43ecC94602ea67672a42625efb11);
    }

    function requestValue(string memory _url, string memory _path)
        public
        onlyOwner
        returns (bytes32 requestId)
    {
        Chainlink.Request memory req = buildChainlinkRequest(
            stringToBytes32(jobId),
            address(this),
            this.fulfillValue.selector
        );
        req.add("get", _url);
        req.add("path", _path);
        return sendChainlinkRequest(req, ORACLE_PAYMENT);
    }

    function fulfillValue(bytes32 _requestId, bool _value)
        public
        recordChainlinkFulfillment(_requestId)
    {
        emit RequestValue(_requestId, _value);
        value = _value;
    }

    function stringToBytes32(string memory source)
        private
        pure
        returns (bytes32 result)
    {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            // solhint-disable-line no-inline-assembly
            result := mload(add(source, 32))
        }
    }

  
    
}
