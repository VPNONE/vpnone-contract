pragma solidity ^0.4.17;
import "zeppelin-solidity/contracts/ownership/Ownable.sol";

/**
 * 服务中控合约
 */
contract ServiceControl is Ownable {

    /************** 定义变量 **************/

    // 记录单个合约绑定关系
    mapping (address => address) public contractBinds;

    // VOT代币合约地址
    address public votTokenContractAddr = 0x0;
    
    /************** 定义事件 **************/

    // 绑定合约
    event BindContract(address indexed invoker, address indexed userAddr, address indexed contractAddr);

     // 修改token合约地址
    event SetVotTokenContractAddr(address indexed sender, address indexed oldVotTokenAddr, address indexed newVotTokenAddr);
    
    /************** 定义修饰符 **************/
    
    // 是否已经绑定合约
    modifier isBindContract(address _userAddr) {
        require(contractBinds[_userAddr] == 0x0);
        _;
    }

    /************** 定义方法 **************/

    /**
     * 修改token合约地址
     */
    function setVOTTokenContractAddr(address _contractAddr) public onlyOwner {
        SetVotTokenContractAddr(msg.sender, votTokenContractAddr, _contractAddr);
        votTokenContractAddr = _contractAddr;
    }
    
    /**
     * 绑定用户与充值合约地址
     */
    function bindContract(address _userAddr, address _contractAddr) public isBindContract(_userAddr) {
        BindContract(msg.sender, _userAddr, _contractAddr);
        contractBinds[_userAddr] = _contractAddr;
    }

    /**
     * 获取用户的绑定的充值合约地址
     */
    function getBindContract(address _userAddr) public view returns(address) {
        return contractBinds[_userAddr];
    }

    /**
     * 获取中控合约所有者
     */
    function getControlOwner() public view returns(address) {
        return owner;
    }

    /**
     * 获取代币合约地址
     */
    function getVotTokenContractAddr() public view returns(address) {
        return votTokenContractAddr;
    }
}