var ServiceUser = artifacts.require("./ServiceUser.sol");

module.exports = function(deployer) {
  deployer.deploy(ServiceUser);
};
