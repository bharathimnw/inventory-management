pragma solidity ^0.4.0;
import "./ERC20.sol";
contract newtoken is ERC20Basic
{
    string standard="Token 1.0";
    string public name;
    string public symbol;
    uint256 public totalsupply;
    uint256  initialallowed;
    uint256 public rate=0.1 ether;
    mapping(address=>uint) public balance;
   
    function newtoken()public
    {
        totalsupply=50000;
        balance[msg.sender]=totalsupply;
        symbol="NT";
        initialallowed=500;
    }
  
    
    function transfer(address to, uint256 value) public returns (bool)
    {
        require(value<=balance[msg.sender]);
        //require(value<=allowed[msg.sender][to]);
        balance[msg.sender]=balance[msg.sender]-value;
        balance[to]=balance[to]+value;
        Transfer(msg.sender,to,value);
        return true;
    }
  
    
    
    function totalSupply() public view returns (uint256)
    {
       return totalsupply;
    }
    function balanceOf(address _addr) public view returns (uint256)
    {
        return balance[_addr];
    }
    
}