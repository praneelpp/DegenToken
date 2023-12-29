# Shop Contract on Avalanche Fuji testnet

In this repository , the contract- Degen.sol in contracts is deployed to avalanche testnet and verified.

## Description

In this shop contract , a token called 'Degen' is created which has its own special items which are available to be redeemed. The items are - 1. Limited Edition Parker Degen Pen  2. Special Glittering Degen Decorations 3. Special Edition Degen Comic Book . There is also a santa approval function where santa approves certain tokens for the spender address :)). This contract is then deployed and verified using few commands . We have used snowtrace to track the transactions.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., DegenToken.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {
    string public special_dgn_items; 
    modifier balance_check(){
        assert(balanceOf(msg.sender)>100);
        _;
    }
    
    constructor() ERC20("Degen", "DGN") { 
        special_dgn_items="Degen items available for X-mas: 1. Limited Edition Parker Degen Pen  2. Special Glittering Degen Decorations 3. Special Edition Degen Comic Book ";
        
    }

    function mint(address to_address, uint256 amt) public onlyOwner {
        _mint(to_address, amt);
        
    }

    function redeem(uint256 degen_item_no) public balance_check{
        if(degen_item_no<0 && degen_item_no>3){
            revert("More items will be available soon :)) but right now we have only three items.");
        }
        _burn(msg.sender, degen_item_no*100);
    }
    function santa_approval(address spender, uint amount) public returns (string memory){
        _approve(msg.sender, spender, amount);
        return "Santa has approved the spender! Enjoy!";
    } 
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.9" (or another compatible version), and then click on the "Compile DegenToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "DegenToken" contract from the dropdown menu, and then click on the "Deploy" button.

### Deploying contract to testnet

Run this command to deploy to fuji testnet:

```cmd
npx hardhat run/scripts/deploy.js --network fuji
```

### Verification

Run this command to verify the contract address in fuji testnet:
```cmd
npx hardhat verify <address> --network fuji
```
## Testnet Explorer

Head to this website to check for your contract : [https://testnet.snowtrace.io/]

Search for your contract address you got after deploying and check for the verification status next to contracts.
## Authors

Praneel Patel GM

[praneelpatel88@gmail.com]


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
