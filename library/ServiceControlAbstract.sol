pragma solidity ^0.4.17;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";

/**
 * 服务中控抽象合约
 */
contract ServiceControlAbstract is Ownable {

    /************** 定义变量 **************/

    // 记录单个合约绑定关系
    mapping (address => address) contractBinds;

    /************** 定义方法 **************/
    
    /**
     * 绑定用户与充值合约地址
     */
    function bindContract(address _userAddr, address _contractAddr) public;

    /**
     * 获取用户的绑定的充值合约地址
     */
    function getBindContract(address _userAddr) public view returns(address);
}