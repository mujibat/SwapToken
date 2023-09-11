 // SPDX-License-Identifier: UNLICENSED
 pragma solidity 0.8.19;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract TokenA is ERC20{
    
    address tokenaaddr;

     constructor() ERC20("TOKENA", "TKNA"){
        tokenaaddr = msg.sender; 
        _mint(msg.sender,1_000e18);
    }

}