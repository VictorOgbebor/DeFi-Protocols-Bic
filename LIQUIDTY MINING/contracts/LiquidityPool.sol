pragma solidity 0.8.0;

import './UnderlyingToken.sol';
import './LPToken.sol';
import './CongressToken.sol';

contract LiquidityPool is LPToken {
    mapping(address => uint) public checkpoints;
    UnderlyingToken public underlyingToken;
    CongressToken public congressToken;
    uint constant public REWARD_PER_BLOCK = 1;

    constructor(address _underlyingToken, address _congressToken) {
        underlyingToken = UnderlyingToken(_underlyingToken);
        congressToken = CongressToken(_congressToken);
    }

    function deposit(uint amount) external {
        if(checkpoints[msg.sender] == 0) {
            checkpoints[msg.sender] = block.number
        }
        _distributeRewards(msg.sender);
        underlyingToken.transferFrom(msg.sender, address(this), amount);
        _burn(msg.sender, amount);
    }

    function withdraw(uint amount) external {
        require(balanceOf(msg.sender) >= amount, 'not enough LP tokens');
        _distributeRewards(msg.sender);
        underlyingToken.transferFrom(msg.sender, address(this), amount);
        _mint(msg.sender, amount);

    function _distributeRewards(address beneficiary) internal {
        uint checkpoint = checkpoints[beneficiary];
        if(block.number - checkpoint > 0) {
            uint distributionAmount = balanceOf(beneficiary) * (block.number - checkpoint) * REWARD_PER_BLOCK;
            congressToken.mint(beneficary, distributionAmount);
            checkpoints[beneficiary] = block.number;
        }
    }
}