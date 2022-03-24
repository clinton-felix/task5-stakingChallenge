const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('Staking Contract', () =>{
    let StakingContract, stakingContract, owner, addr1, addr2;

    beforeEach(async () => {
        StakingContract = await ethers.getContractFactory('StakingContract');
        stakingContract = await StakingContract.deploy();
        [owner, addr1, addr2, _] = await ethers.getSigners();
    });

    describe('Deployment', () => {
        it ('Should set the right owner', async () => {
            expect(await (StakingContract.owner()).to.equal(owner.address));
        });

        it('should assign the total supply of token to the ')
    });
});