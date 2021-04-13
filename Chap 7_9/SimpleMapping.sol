pragma solidity ^0.6.0;

contract SimpleMapping {

    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;
    function seValue(uint _index) public {
        myMapping[_index] = true;
    }
    
    function setMyAddressTotrue() public {
        myAddressMapping[msg.sender]=true;
    }
}