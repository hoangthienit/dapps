pragma solidity ^0.5.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.4.0/contracts/ownership/Ownable.sol";

contract SimpleWallet is Ownable{
    
    mapping(address => uint) public allowance;
    
    function addAllowance(address _who, uint _amount) public onlyOwner{
        allowance[_who] = _amount;
    }
    modifier ownerOrAllowed(uint _amount){
        require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed");
        _;
    }
    
    function reduceeAllowance(address _who, uint _amount) internal{
        allowance[_who] -= _amount;
    }
    
    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount){
        require(_amount <= address(this).balance, "There are not enough funds stored in the smart contract");
        if(!isOwner()){
            reduceeAllowance(msg.sender, _amount);
        }
        _to.transfer(_amount);
    }
    function () external payable{
        
    }
}