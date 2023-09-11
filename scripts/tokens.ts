import { ethers } from "hardhat";

async function main() {

  const Token1 = await ethers.deployContract("TokenA", []);

  await Token1.waitForDeployment();

  console.log(
    `TokenA with deployed to ${Token1.target}`
  );
  const Token2 = await ethers.deployContract("TokenB", []);

  await Token2.waitForDeployment();

  console.log(
    `TokenB with deployed to ${Token2.target}`
  );

  const tokens = [
    Token1.target, Token2.target
  ]

  console.log(tokens);
  
}


// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
/*
TokenA with deployed to 0x2215d796B855cA8e8b08991033d4F74b08Be4F8a
TokenB with deployed to 0xC2e453c481E755fdB95070E29a4f63fbcBA2a467
*/
