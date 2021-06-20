pragma solidity 0.8.0;

interface IDataOracle {
  //function updateReporter(address reporter, bool isReporter) external;
  //function updateData(bytes32 key, uint payload) external;
  function getData(bytes32 key) 
    external 
    view 
    returns(bool result, uint date, uint payload);
}