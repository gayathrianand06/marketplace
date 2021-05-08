pragma solidity ^0.5.0;

import "./openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "./openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";

contract MyToken is ERC20, ERC20Mintable {}
contract TokenInteraction {

    address public tokenAddress;

    constructor(address _tokenAdd) public {
        tokenAddress = _tokenAdd;
    }

    function transferToken(address to) public {
        MyToken myToken = MyToken(tokenAddress);
        myToken.transfer(to, 1);
    }

}
