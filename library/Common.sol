pragma solidity ^0.4.17;

import "./ServiceControlAbstract.sol";


contract Common {

    // 中控合约地址
	address controlContractAddr = 0x0;

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

    /**
	 * 获取控制合约
	 */
	function getControlContract() public view returns(ServiceControlAbstract) {
		ServiceControlAbstract controlContract = ServiceControlAbstract(controlContractAddr);
		return controlContract;
	}

	/**
	 * 获取vot代币合约地址
	 */
	function getVOTTokenContractAddr() public view returns(address) {
		var controlContract = getControlContract();
		return controlContract.getVotTokenContractAddr();
	}
}