pragma solidity ^0.4.17;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";
import "zeppelin-solidity/contracts/token/ERC20.sol";
import "../library/Common.sol";

/**
 * 服务使用者合约 
 */
contract ServiceUser is Ownable, Common {

	/************** 定义变量 **************/

	// 该合约提现地址
	address withdrawAddr = 0x0;

	/************** 定义事件 **************/

	// 充值
	event Recharge(address indexed sender, address indexed contractAddr, uint amount);
	// 提现
	event Withdraw(address indexed contractAddr, address indexed withdrawAddr, uint amount);
	// 提现其他代币
	event WithdrawOtherToken(address indexed sender, address indexed withdrawAddr, uint amount);
	// 购买服务
	event BuyService(address indexed sender, address indexed serviceAddr, uint amount);

	/************** 定义修饰符 **************/


	/************** 定义方法 **************/
	/**
	 * 构造函数
	 */
	function ServiceUser() public {
		withdrawAddr = msg.sender;
		// address controlContract = getControlContract();
		// 绑定合约 TODO：error
		// controlContract.bindContract(msg.sender, this);
	}

	/**
	 * 提现
	 */
	function withdraw(uint _amount) public onlyOwner {

		// 获取账户余额
		address votTokenAddr = getVOTTokenContractAddr();
		ERC20 votTokenContract = ERC20(votTokenAddr);
		var balance = votTokenContract.balanceOf(this);
		require(_amount <= balance);
		Withdraw(msg.sender, withdrawAddr, _amount);
		require(votTokenContract.transfer(withdrawAddr, _amount));
	}

	/**
	 * 留下其他token提现入口
	 * 防止用户误充值入其他token
	 * TODO: 待定实现方式
	 */
	function withdrawOtherToken(address _tokenAddr, address _to, uint _amount) public isControlOwner {

		ERC20 token = ERC20(_tokenAddr);
		var balance = token.balanceOf(this);
		require(balance >= _amount);
		WithdrawOtherToken(_tokenAddr, _to, _amount);
		require(token.transfer(_to, _amount));
	}

	/**
	 * 购买服务
	 * TODO:记录日志
	 */
	function buyService(address _serviceAddr, uint _amount) public payable {
		
		BuyService(msg.sender, _serviceAddr, _amount);
		address votTokenAddr = getVOTTokenContractAddr();
		ERC20 token = ERC20(votTokenAddr);
		require(token.transfer(_serviceAddr, _amount));
	}

	/**
	 * 充值
	 */
	function () payable public {
		Recharge(msg.sender, this, msg.value);
	}
}