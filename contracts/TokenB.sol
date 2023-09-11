// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract TokenB is ERC20{

    address tokenbaddr;
   
     constructor() ERC20("TOKENB", "TKNB"){
        _mint(address(msg.sender),1_000e18);
    }

}