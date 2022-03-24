// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Task5Token is ERC20, Ownable {

    constructor() ERC20("Task5 Token", "T5T") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }


    function buyToken(address receiver, uint256 amount) public payable {
        require (balanceOf(owner()) >= amount, "Payment insufficient");
        amount = msg.value;
        _transfer(owner(), receiver, amount);
        emit Transfer(owner(), receiver, amount);

        payable(owner()).transfer(msg.value);
    }


}