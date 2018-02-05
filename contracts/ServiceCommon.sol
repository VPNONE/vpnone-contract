pragma solidity ^0.4.17;
import "zeppelin-solidity/contracts/ownership/Ownable.sol";
import "../library/ServiceControlAbstract.sol";

contract ServiceCommon is Ownable {

	/************** 定义变量 **************/
    // 中控合约地址
	address public controlContractAddr = 0x0;

	/************** 定义事件 **************/
	event SetControlContractAddr(address indexed sender, address indexed oldAddr, address indexed newAddr);

    /************** 定义修饰符 **************/

	/**
	 * 判断是否是中控合约所有者
	 */
	modifier isControlOwner() {
		var controlContract = getControlContract();
		var controlOwner = controlContract.getControlOwner();
		require(msg.sender == controlOwner);
		_;
	}

	/************** 定义方法 **************/
    /**
	 * 获取控制合约
	 */
	function getControlContract() public view returns(ServiceControlAbstract) {
		ServiceControlAbstract controlContract = ServiceControlAbstract(controlContractAddr);
		return controlContract;
	}

	/**
	 * 判断是否是中控合约所有者
	 */
	function getIsControlOwner() public view isControlOwner returns(bool) {
		return true;
	} 

	/**
	 * 获取vot代币合约地址
	 */
	function getVOTTokenContractAddr() public view returns(address) {
		var controlContract = getControlContract();
		return controlContract.getVotTokenContractAddr();
	}

	/**
	 * 设置中控合约地址
	 */
	function setControlContractAddr(address _contractAddr) public {
		SetControlContractAddr(msg.sender, controlContractAddr, _contractAddr);
		controlContractAddr = _contractAddr;
	}
}