pragma solidity 0.8.0;

import '@openzeppelin/contracts/token/ERC721/ERC21.sol';

contract TokenNFT1 is ERC721 {
    constructor() ERC721('Token Name', 'Token Symbol') {   
    }
}

contract TokenNFT2 is ERC721 {
    constructor() ERC721('Token Name', 'Token Symbol') { 
        _safemint(msg.sender, 0);  
    }
}

contract TokenNFT3 is ERC721 {
    address public admin;

    constructor() ERC721('Token Name', 'Token Symbol') {   
        admin = msg.sender;  
    }

    function mint(address to, uint tokenId) external {
        require(msg.sender == admin, 'only admin');
        _safemint(to, tokenId);
    }
}

contract TokenNFT4 is ERC721 {
    address public admin;

    constructor() ERC721('Token Name', 'Token Symbol') {

    }

    function faucet(address to, uint tokenId) external {
        _safemint(to, tokenId);
    }
}