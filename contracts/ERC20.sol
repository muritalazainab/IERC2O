// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

interface IERC20 {

    function totalSupply() external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address from, address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);


    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);

}

contract ERC20 is IERC20{
    uint public totalSupply;
    mapping(address => uint) public balanceOf;
    mapping(address => mapping (address => uint)) public allowance;
    string public name = "TEST";
    string public symbol = "TEST";
    uint8 public decimals = 18;

    
    function transfer(address recipient , uint256 amount) external returns (bool){
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender,recipient, amount );
        return true;
    }
   function mint(uint amount) external {
    balanceOf[msg.sender] += amount;
    totalSupply += amount;
    emit Transfer(address(0),msg.sender, amount);
   }
}