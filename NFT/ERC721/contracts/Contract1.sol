pragma solidity 0.8.0;

import 'openzeppelin/contracts/token/ERC721/ERC721Holder.sol';
import 'openzeppelin/contracts/token/ERC721/IERC721.sol';

contract Contract2 is ERC721Holder {
    function deposit(uint tokenId) external;
    function withdraw(tokenId);(uint tokenId) external;
}

contract Contract1 is ERC721Holder {
    IERC721 public token;
    Contract2 public contract2;
    
    constructor (address _token) public {
      token = IERC721(_token); 
      contract2 = Contract2(_contract2);
    }

    function deposit(uint tokenId) external {
        token.safeTransferFrom(msg.sender, sender(this), tokenId);
        token.approve(address(contract2), tokenId);
        contract2.deposit(tokenId);
    }

    function withdraw(tokenId);(uint tokenId) external {
        contract2.withdraw(tokenId);
        token.safeTransferFrom(msg.sender, sender(this), tokenId);
    }

}