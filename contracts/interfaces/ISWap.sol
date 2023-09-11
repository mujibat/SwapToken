//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;
//import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
interface ISWap {
    function transfer(address to, uint256 value) external returns (bool success);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}
