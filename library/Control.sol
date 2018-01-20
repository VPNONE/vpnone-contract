pragma solidity ^0.4.17;
/**
 * 控制库
 */
contract Control {

    // vot代币合约地址
    address VOTTokenAddr = 0x0;

    // 控制人地址 之后硬编码进去
    address controlAddr = 0x0;

    /**
     * 是否是控制者
     */
    modifier isControl() {
        require(msg.sender == controlAddr);
        _;
    }

    /** 
     * 转移控制者地址
     */
    function transferControl(address _control) public isControl {
        controlAddr = _control;
    }

    /**
     * 修改VOT代币合约地址
     */
    function editVOTTokenAddr(address _votTokenAddr) public isControl {
        VOTTokenAddr = _votTokenAddr;
    }
}