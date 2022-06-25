pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract MintkkToken is ERC721Enumerable{

    constructor() ERC721("KillMeter","KM"){}
    
    mapping(uint256 => uint256 ) public kkTypes;

    function minKiloMeterToken() public{
        uint256 KiloMeterTokenId = totalSupply() + 1;

        uint256 kkType = uint256(keccak256(abi.encodePacked(block.timestamp,msg.sender,KiloMeterTokenId))) % 5 + 1;
        
        kkTypes[KiloMeterTokenId]=kkType;

        _mint(msg.sender,KiloMeterTokenId);

        
    }
}