pragma solidity 0.8.0;

import '@openzepplin/contracts/token/ERC20/ERC20.sol';
import '@openzepplin/contracts/token/ERC20/IERC20.sol';

contract CollateralToken is ERC20 {
    IERC20 public collateral;
    uint public price = 1;

    constructor(address _collateral) ERC20('Token Backed Token', 'TBT') {
        collateral = IERC20(_collateral);
    }

    function deposit(uint collateralAmount) external {
        collateral.transferFrom(msg.sender, address(this), collateralAmount);
        _mint(msg.sender, collateralAmount * price);
    }

    function withdraw(uint collateralAmount) external {
        require(balanceOf(msg.sender) >= tokenAmount, 'balance too low');
        _burn(msg.sender, tokenAmount);
        collateral.transfer(tokenAmount / price);
    }
}

