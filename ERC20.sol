pragma solidity ^0.4.18;
import "./openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "./openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";

contract ERC20 {
    function totalSupply() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract MintableToken is Ownable, ERC20 {
    constructor() public ERC20("Gold", "GLD") { }

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) public onlyOwner {
        _burn(account, amount);
    }
}

contract ButAndSell{

    uint public buyPrice = 1;

    function buy(address _tokenAddress) public payable{
        ERC20 token = ERC20(_tokenAddress);
        uint tokens = msg.value * buyPrice;
        require(token.balanceOf(this) >= tokens);
        uint commission = msg.value/100; 
       require(address(this).send(commission));
        token.transfer(msg.sender, tokens);
    }
}
