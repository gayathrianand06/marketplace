pragma solidity ^0.4.18;
import "./openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

function setForSale(uint256 _tokenId) external {
    address owner = ownerOf(_tokenId);

    require(isValidToken(_tokenId));
    require(owner == msg.sender || authorized[owner][msg.sender]);

    allowance[_tokenId] = address(this);
    tokensForSale.push(_tokenId);
    // set the sale price etc

    emit Approval(owner, address(this), _tokenId);
}

function buy(uint256 _tokenId) external payable {
    address buyer = msg.sender;
    uint payedPrice = msg.value;

    require(isValidToken(_tokenId));
    require(getApproved(_tokenId) == address(this));
    // require payedPrice >= salePrice

    // pay the seller
    // remove token from tokensForSale

    transferFrom(ownerOf(_tokenId), buyer, _tokenId);
}

