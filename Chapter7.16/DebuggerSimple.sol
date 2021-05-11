pragma solidity ^0.5.11;

contract EventSimple {
    mapping(address => uint) public tokenBalance;
    
    constructor() public{
        tokenBalance[msg.sender] = 100;
    }
    
    event tokensSend(address _from, address _to, uint _amount);
    
    function sendToken(address _to, uint _amount) public returns(bool){
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[_to] += _amount;
        
        emit tokensSend(msg.sender, _to, _amount);
        
        return true;
    }
}