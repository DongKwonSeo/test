pragma solidity ^0.8.0;

import "MintkkToken.sol";

contract SaleToken {
    MintkkToken public mintkkTokenAddress;

    constructor(address _mintkkTokenAddress){
        mintkkTokenAddress = MintkkToken(_mintkkTokenAddress);
    }

    mapping(uint256 => uint256) public kkTokenPrices;

    uint256[] public onSaleKkTokenArry;


    function setForSaleKkToken(uint256 _kkTokenId, uint256 _price) public{
        address kkTokenOwner = mintkkTokenAddress.ownerOf(_kkTokenId);


        require(kkTokenOwner == msg.sender, "not token owner.");
        require(_price > 0,"price is zore or lower.");
        require(kkTokenPrices[_kkTokenId] == 0, "this kk token is already on sale.");
        require(mintkkTokenAddress.isApprovedForAll(kkTokenOwner, address(this)),"token owner did not approve token.");

        kkTokenPrices[_kkTokenId] = _price;

        onSaleKkTokenArry.push(_kkTokenId);

    }
}