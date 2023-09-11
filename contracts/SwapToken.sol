// SPDX-License-Identifier: UNLICENSED
 pragma solidity 0.8.19;

import "./TokenA.sol";
import "./TokenB.sol";
import "./interfaces/ISWap.sol";

contract SwapToken {
    struct LiquidityProvider {
     uint256 amountA;
     uint256 amountB;
 }
    address payable tokenaaddr;
    address payable tokenbaddr;
    address owner;
    uint reserveA;
    uint reserveB;
    receive() external payable {}
     constructor(address payable TOKENAaddr, address payable TOKENBaddr){
        tokenaaddr = TOKENAaddr;
        tokenbaddr = TOKENBaddr;
    }
     mapping(address => LiquidityProvider) public liquidityProviders;
     
    function addLiquidity(uint256 amountA, uint256 amountB) public payable{
        ISWap(tokenaaddr).transferFrom(msg.sender, address(this), amountA);
        ISWap(tokenbaddr).transferFrom(msg.sender, address(this), amountB);
        
        reserveA += amountA;
        reserveB += amountB;
        
        LiquidityProvider storage provider = liquidityProviders[msg.sender];
        provider.amountA += amountA;
        provider.amountB += amountB;
       // provideLiquidityCal(amountA, amountB);
}
    function removeLiquidity(uint256 amountA, uint256 amountB) external payable{
        ISWap(tokenaaddr).transfer(msg.sender, amountA);
        ISWap(tokenbaddr).transfer(msg.sender, amountB);

        reserveA -= amountA;
        reserveB -= amountB;
    
        LiquidityProvider storage provider = liquidityProviders[msg.sender];
        provider.amountA -= amountA;
        provider.amountB -= amountB;
        //provideLiquidityCal(amountA, amountB);
    }
    
    
   
    function swaptokenA4B(uint tokenAamount) external payable {
         ISWap(tokenaaddr).transferFrom(msg.sender, address(this), tokenAamount);
         uint ReservoirA = reserveA + tokenAamount;
         uint kconstant = reserveA * reserveB;
         uint gettokenB = reserveB - (kconstant / ReservoirA);

        reserveA += tokenAamount;
        reserveB -= gettokenB;
         ISWap(tokenbaddr).transfer(msg.sender, gettokenB);
    }
    function swaptokenB4A(uint tokenBAmount) external payable {
         ISWap(tokenbaddr).transferFrom(msg.sender, address(this), tokenBAmount);
         uint ReservoirB = reserveB + tokenBAmount;
         uint kconstant = reserveA * reserveB;
         uint gettokenA = reserveA - (kconstant / ReservoirB);

        reserveA -= gettokenA;
        reserveB += tokenBAmount;
       // w3btoken.transferFrom(address(this), msg.sender, getW3B);
         ISWap(tokenaaddr).transfer(msg.sender, gettokenA);
    }
    
}


// solidity
// struct LiquidityProvider {
//     uint256 amountA;
//     uint256 amountB;
// }

// mapping(address => LiquidityProvider) public liquidityProviders;

// function addLiquidity(uint256 amountA, uint256 amountB) external {
//     IERC20(tokenA).transferFrom(msg.sender, address(this), amountA);
//     IERC20(tokenB).transferFrom(msg.sender, address(this), amountB);
    
//     reserveA += amountA;
//     reserveB += amountB;
    
//     LiquidityProvider storage provider = liquidityProviders[msg.sender];
//     provider.amountA += amountA;
//     provider.amountB += amountB;
// }
// To complete the task:

// 1. Deploy two token contracts, TokenA and TokenB, to your chosen testnet.
// 2. Create the swap contract with the required functions mentioned in the first paragraph.
// 3. Write a script to fork the testnet and test your swap contract with the 
// deployed TokenA and TokenB contracts.
// 4. Once you're satisfied with the testing on the testnet, 
// deploy the swap contract and perform transactions on a live network.

// Make sure to include a README file in your GitHub repository with the verified contract address of your swap contract.