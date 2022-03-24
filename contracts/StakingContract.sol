//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Task5.sol";

contract StakingContract {

    string public name = "StakingContract";
    address private owner;
    Task5Token public task5Token;

    address[] public stakers;

    mapping (address => uint256) public stakingBalance;
    mapping (address => bool) public staker;

    constructor(Task5Token _task5Token) {
        task5Token = _task5Token;
        owner = msg.sender;
    }

    function stakeToken(uint _amount) public {
        require(_amount > 0, "Amount must be greater than 0");

        task5Token.transferFrom(msg.sender, address(this), _amount);

        stakingBalance[msg.sender] = stakingBalance[msg.sender] + _amount;

        staker[msg.sender] = true;

        stakers.push(msg.sender);
        
    }

    function unstakeToken(uint _amount) public {
        uint balance = stakingBalance[msg.sender];
        require (staker[msg.sender] = true, "No tokens staked");

        require(balance >= _amount, "Insufficient balance!");

        stakingBalance[msg.sender] = balance - _amount;

        if(stakingBalance[msg.sender] == 0) {
            staker[msg.sender] = false;
        }

        task5Token.transfer(msg.sender, _amount);

    }

    function claimStakeReward(address _address) public {
       // require(stakers[msg.sender] = true, "You do not have any tokens staked");
        uint256 reward;
        uint256 rate = 1 * 10**16;
        
        require(stakingBalance[msg.sender] > 0, "No staked Balance");

        uint balance = stakingBalance[msg.sender];

        reward = rate * balance;
        task5Token.transfer(_address, reward);
    
    }
}