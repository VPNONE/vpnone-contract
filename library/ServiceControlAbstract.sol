pragma solidity ^0.4.17;

/**
 * 服务中控抽象合约
 */
contract ServiceControlAbstract {

    /************** 定义变量 **************/

    // 记录单个合约绑定关系
    mapping (address => address) contractBinds;

    // VOT代币合约地址
    address votTokenContractAddr;

    // 所有者
    address owner;

    /************** 定义方法 **************/
    
    /**
     * 绑定用户与充值合约地址
     */
    function bindContract(address _userAddr, address _contractAddr) public;

    /**
     * 获取用户的绑定的充值合约地址
     */
    function getBindContract(address _userAddr) public view returns(address);

    /**
     * 获取中控合约的owner
     */
    function getControlOwner() public view returns(address);

    /**
     * 获取代币合约地址
     */
    function getVotTokenContractAddr() public view returns(address);
}