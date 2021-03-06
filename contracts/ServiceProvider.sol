pragma solidity ^0.4.17;
import "zeppelin-solidity/contracts/token/ERC20.sol";
import "zeppelin-solidity/contracts/ownership/Ownable.sol";
import "./ServiceCommon.sol";

/**
 * 服务提供者合约
 */
contract ServiceProvider is Ownable {

    /************** 定义变量 **************/
    // 提现地址
    address withdrawAddr = 0x0;

    // common合约地址
	address commonContractAddr = 0x0;

	// common合约
	ServiceCommon commonContract;

    // 中控合约地址

    /************** 定义事件 **************/
    // 收款
    event Receivables(address indexed selfAddr, address indexed sender, uint amount);
    // 提现
    event Withdraw(address indexed sender, address indexed withdrawAddr, uint amount);
    // 设置提现地址
    event SetWithdrawAddr(address indexed sender, address indexed oldWithdrawAddr, address indexed newWithdrawAddr);
   
    /************** 定义修饰符 **************/

    /************** 定义方法 **************/

    function () public payable {
        Receivables(this, msg.sender, msg.value);
    }

    function ServiceProvider(address _commonContractAddr) public {
        withdrawAddr = msg.sender;
        commonContractAddr = _commonContractAddr;
		commonContract = ServiceCommon(commonContractAddr);
    }

    /**
     * 设置提现地址
     */
    function setWithdrawAddr(address _addr) public onlyOwner {
        SetWithdrawAddr(msg.sender, withdrawAddr, _addr);
        withdrawAddr = _addr;
    }

    /**
     * 提现
     */
    function withdraw(uint _amount) public onlyOwner {
        address votTokenAddr = commonContract.getVOTTokenContractAddr();
        ERC20 token = ERC20(votTokenAddr);
        var balance = token.balanceOf(this);
        require(balance < _amount);
        Withdraw(msg.sender, withdrawAddr, _amount);
        token.transfer(owner, _amount);
    }
}
