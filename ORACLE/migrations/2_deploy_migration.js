const DataOracle = artifacts.require("DataOracle.sol");
const Consumer = artifacts.require("Consumer.sol");

module.exports = async function (deployer, _network, addresses) {
    const [admin, reporter, _] = addresses;
    await deployer.deploy(DataOracle, admin);
    const dataoracle = await DataOracle.deployed();
    await dataoracle.updateReporter(reporter, true);
    await deployer.deploy(Consumer, dataoracle.address);
};
