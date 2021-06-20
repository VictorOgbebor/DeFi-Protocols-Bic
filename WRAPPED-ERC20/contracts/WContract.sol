pragma solidity 0.8.0;

import 'openzeppelin/contract/token/ERC20/ERC20.sol;'

contract WToken is ERC20 {
    constructor() ERC20('Wrapped Token', 'WTKN') {}
    function deposit() external payable {
        _mint(msg.sender, msg.value); 
    }

    function withdraw(uint amount) external {
        require(balanceOf(msg.sender) >= amount, 'balance too low');
        _burn(msg.sender, amount);
        msg.sender.transfer(amount);
    }
}
