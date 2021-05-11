pragma solidity ^ 0.5.13;

contract DebuggSimple {
    uint public myUint;
    
    function setMyUint(uint _myuint) public {
        myUint = _myuint;
    }
}