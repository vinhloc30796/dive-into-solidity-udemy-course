//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    address public owner;

    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "ONLY_OWNER");
        _;
    }

    function changeTokens() external {
        string[] storage t = tokens;
        t[0] = "VET";
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function transferAll(address payable _receiver) public onlyOwner {
        (bool result, ) = _receiver.call{value: getBalance()}("");
        require(result, "TX_FAILED");
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate(string calldata _str1, string calldata _str2) public pure returns (string memory) {
        return string(abi.encodePacked(_str1, _str2));
    }

    receive() external payable {}
}
