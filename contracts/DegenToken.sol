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

