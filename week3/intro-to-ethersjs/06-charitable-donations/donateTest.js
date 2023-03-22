const { utils, providers, Wallet } = require('ethers');
const { ganacheProvider } = require('./config');

const provider = new providers.Web3Provider(ganacheProvider);

async function donate(privateKey, charities) {
    const oneEther = utils.parseEther("1.0");
    const wallet = new Wallet(privateKey, provider);
    for(let i = 0; i < charities.length; i++) {
        const charity = charities[i];
        await wallet.sendTransaction({
            value: oneEther,
            to: charity
        });
    } 
}

module.exports = donate;