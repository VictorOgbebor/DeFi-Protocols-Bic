pragma solidity 0.8.0;

import './IDataOracle.sol';

contract Consumer {
  IDataOracle public oracle;

  constructor(address _oracle) {
    oracle = IDataOracle(_oracle);
  }

  function foo() external {
    bytes32 key = keccak256(abi.encodePacked('BTC/USD'));

    (bool result, uint timestamp, uint data) = oracle.getData(key);
    require(result == true, 'could not get price');
    require(timestamp >= block.timestamp - 2 minutes, 'price too old'); 
    //so something with price;

  }
}