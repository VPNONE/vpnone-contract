var VPNOneToken     = artifacts.require("./VPNOneToken.sol");
var ServiceControl  = artifacts.require("./ServiceControl.sol");
var ServiceCommon   = artifacts.require("./ServiceCommon.sol");
var ServiceProvider = artifacts.require("./ServiceProvider.sol");
var ServiceUser     = artifacts.require("./ServiceUser.sol");

var VPNOneTokenInstance, ServiceControlInstance, ServiceCommonInstance, ServiceProviderInstance, ServiceUserInstance;

module.exports = function(deployer) {

    deployer.deploy(VPNOneToken);
    deployer.deploy(ServiceControl);
    deployer.deploy(ServiceCommon);
    // deployer.deploy(ServiceProvider);
    // deployer.deploy(ServiceUser);
        

    deployer.then(function() {
        return VPNOneToken.deployed();
    }).then(function(instance) {
        VPNOneTokenInstance = instance;
        return ServiceControl.deployed();
    }).then(function(instance) {
        ServiceControlInstance = instance;
        console.log(VPNOneTokenInstance.address);
        ServiceControlInstance.setVOTTokenContractAddr(VPNOneTokenInstance.address);
        return ServiceCommon.deployed();
    }).then(function(instance) {
        ServiceCommonInstance = instance;
        console.log(ServiceControlInstance.address);
        ServiceCommonInstance.setControlContractAddr(ServiceControlInstance.address);
        return deployer.deploy(ServiceProvider, [ServiceCommonInstance.address]);
    }).then(function(){
        return ServiceProvider.deployed();
    }).then(function(instance) {
        ServiceProviderInstance = instance;
        return deployer.deploy(ServiceUser, [ServiceCommonInstance.address]);
    }).then(function() {
        return ServiceUser.deployed();
    }).then(function(instance) {
        ServiceUserInstance = instance;
    }).then(function() {
        console.log("vot addr:" + VPNOneTokenInstance.address);
        console.log("control addr:" + ServiceControlInstance.address);
        console.log("common addr:" + ServiceCommonInstance.address);
        console.log("provider addr:" + ServiceProviderInstance.address);
        console.log("user addr:" + ServiceUserInstance.address);
    });
};
