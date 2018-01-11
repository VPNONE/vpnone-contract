pragma solidity ^0.4.17;
import "zeppelin-solidity/contracts/token/MintableToken.sol";

/**
 * The VPNOneToken contract does this and that...
 */
contract VPNOneToken is MintableToken {
	
	string 	public name 		= "VPNONEToken";
	string 	public symbol 		= "VOT";	// VPNONE Token
	uint 	public decimaals	= 18;
	uint	public INITIAL_SUPPLY = 10 * (10 ** 8) * ( 10 ** decimaals);

	function VPNONEToken() public {
		totalSupply = INITIAL_SUPPLY;
		balances[msg.sender] = INITIAL_SUPPLY;
	}

	// 修改合约名称
	function editTokenName(string _name) public onlyOwner returns(bool) {
		require(keccak256(_name) != keccak256(name) || keccak256(_name) != keccak256(""));
		name = _name;
		return true;
	}

	function editSymbol(string _symbol) public onlyOwner returns(bool) {
		require(keccak256(_symbol) != keccak256(symbol) || keccak256(_symbol) != keccak256(""));
		symbol = _symbol;
		return true;
	}

	function getName() public view returns(string) {
		return name;
	}
}
