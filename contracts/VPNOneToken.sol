pragma solidity ^0.4.17;
import "zeppelin-solidity/contracts/token/MintableToken.sol";

/**
 * The VPNOneToken contract does this and that...
 */
contract VPNOneToken is MintableToken {
	
	string 	public name 		= "VPNONEToken";
	string 	public symbol 		= "VOC";
	uint 	public decimaals	= 18;
	uint	public INITIAL_SUPPLY = 10000 * ( 10 ** decimaals);

	function VPNONEToken() public {
		totalSupply = INITIAL_SUPPLY;
		balances[msg.sender] = INITIAL_SUPPLY;
	}
}
