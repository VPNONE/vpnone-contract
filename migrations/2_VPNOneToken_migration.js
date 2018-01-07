var VPNOneTokenMigrations = artifacts.require("./VPNOneToken.sol");

module.exports = function(deployer) {
  deployer.deploy(VPNOneTokenMigrations);
};
