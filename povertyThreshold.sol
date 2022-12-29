// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Mycontract {
    address owner;
    uint amount;

    constructor() {
        owner = msg.sender;
    }

    modifier OnlyOwner {
        require(owner == msg.sender, "only owner can assign");
        _;
    }

    function assignAmount(uint _amount) public OnlyOwner {
        amount = _amount;
    }

    function message(address _address) public view returns(string memory alaram) {
        uint Balance = address(_address).balance;

        if(Balance == amount) {
            return "Middle";
        }

        if(Balance > amount) {
            return "Rich";
        }

        if(Balance < amount) {
            return "Poor";
        }
    }

    function getAmount() public view returns(uint) {
        return amount;
    }

    function getBalance(address _address) public view returns(uint) {
        return address(_address).balance;
    }
}
