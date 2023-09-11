# SwapToken
# SwapToken Smart Contract

## Overview

The SwapToken smart contract is a Solidity contract designed for token swapping and liquidity provision. It facilitates the exchange of two different ERC20 tokens (TokenA and TokenB) while also allowing users to contribute liquidity to the contract. This README provides an overview of the contract's functionality and how to use it.

## Prerequisites

Before using the SwapToken contract, ensure you have the following prerequisites in place:

- Solidity Compiler: Make sure you have a Solidity compiler compatible with version 0.8.19 or later.

## Contract Structure

The contract is structured as follows:

- `struct LiquidityProvider`: This struct represents a liquidity provider and tracks the amounts of TokenA and TokenB they have contributed to the pool.

- `tokenaaddr` and `tokenbaddr`: These variables store the addresses of the TokenA and TokenB ERC20 contracts.

- `owner`: The address that deploys the contract is set as the owner.

- `reserveA` and `reserveB`: These variables keep track of the reserves of TokenA and TokenB in the liquidity pool.

## Usage

To use the SwapToken contract, follow these steps:

1. **Deployment**: Deploy the SwapToken contract by providing the addresses of TokenA and TokenB ERC20 contracts during deployment.

2. **Adding Liquidity**: Liquidity providers can add liquidity to the contract by calling the `addLiquidity` function, specifying the amounts of TokenA and TokenB they want to contribute. In return, they receive liquidity tokens representing their share of the pool.

3. **Removing Liquidity**: Liquidity providers can remove their liquidity by calling the `removeLiquidity` function, specifying the amounts of liquidity tokens they want to redeem. This will also transfer the corresponding amounts of TokenA and TokenB back to them.

4. **Swapping Tokens**: Users can swap TokenA for TokenB using the `swaptokenA4B` function or TokenB for TokenA using the `swaptokenB4A` function. These functions calculate the appropriate token amounts based on the current reserves in the pool and the constant-product formula (used for automated market makers like Uniswap).

## Testing

Thoroughly test the contract's functionality, including adding liquidity, removing liquidity, and swapping tokens, on a testnet before deploying it on the Ethereum mainnet.
