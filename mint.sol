pragma solidity ^0.8.0;

import "@openzepplelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract MinKiloMeterToken is ERC721Enumerable{

    constructor() ERC721("KiloMeter","KM"){}
    function MinKiloMeterToken() public{
        uint256 KiloMeterTokenId = totalSupply() + 1;

        _mint(msg.sender,KiloMeterTokenId);

    }
}