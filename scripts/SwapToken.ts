import { ethers } from "hardhat";
const tokena = '0x5FbDB2315678afecb367f032d93F642f64180aa3'
const tokenb = '0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512'


async function main() {
  //const swapper = '0xe13169f75F3ac186486131862eF89c668Cf57DE9'
  const [a1] = await ethers.getSigners();


  const tokenAamount = ethers.parseEther('500')
  const tokenBamount = ethers.parseEther('200')

  const TokenA = await ethers.getContractAt('IERC20', tokena)
  const TokenB = await ethers.getContractAt('IERC20', tokenb)
  // const amount = ethers.parseEther('1000')


  const swapToken = await ethers.deployContract('SwapToken', [tokena, tokenb]);
  await swapToken.waitForDeployment();

  console.log(`SwapContract deployed to ${swapToken.target}`)

  // let swap = await ethers.getContractAt('swapToken', 'ISWap')
  // const Swapsigner = await ethers.getImpersonatedSigner(swapper)
  const enoughFunds = ethers.parseEther('1000000000000000000');
  
  await TokenA.approve(swapToken, enoughFunds)
  await TokenB.approve(swapToken, enoughFunds)
  console.log("---------Approved-----------");

  async function getBalance() {
    let ownersBalA = ethers.formatEther(await TokenA.balanceOf(a1.address));
    let ownerBalB = ethers.formatEther(await TokenB.balanceOf(a1.address));

    let reserveA = ethers.formatEther(await TokenA.balanceOf(swapToken));
    let reserveB = ethers.formatEther(await TokenB.balanceOf(swapToken));

    return {
      ownersBalA,
      ownerBalB,
      reserveA,
      reserveB
    }
  }

  //console.log(await DAIContract.balanceOf(to))
  console.log({
    "Balance Before Adding Liquidity": await getBalance()
  });

  await swapToken.addLiquidity(tokenAamount, tokenBamount);

  console.log({
    "Balance After Adding Liquidity/ B4 Swap": await getBalance()
  });

  const function1 = await swapToken.swaptokenA4B(ethers.parseEther("50"))
  // let balanceA = await ethers.provider.getBalance(a1.address)

  console.log({
    "Balance After Swapping": await getBalance()
  });
  

  await swapToken.removeLiquidity(ethers.parseEther('100'), ethers.parseEther('100'))

  console.log({
    "Balance After removing Liquidity": await getBalance()
  });



}
main().catch((error) => {
  console.error(error)
  process.exitCode = 1
})