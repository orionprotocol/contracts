# Examples

```ts
// ethers
import { Exchange__factory, ERC20__factory } from "@orionprotocol/contract";
import { ethers } from "ethers";

const provider = new ethers.providers.StaticJsonRpcProvider(
  "https://bsc-dataseed.binance.org/"
);
const exchangeContractAddress = "0xe9d1d2a27458378dd6c6f0b2c390807aed2217ca";
const exchangeContract = Exchange__factory.connect(
  exchangeContractAddress,
  provider
);

exchangeContract
  .getBalance(
    "0xe4ca1f75eca6214393fce1c1b316c237664eaa8e",
    "0x000000000000000000000000000000000000dead"
  )
  .then((howMuchORNOnDeadAddress) => {
    console.log(howMuchORNOnDeadAddress);
  });

const erc20Contract = ERC20__factory.connect(tokenAddress, provider);
```

```ts
// web3
import Web3 from "web3";
import { Web3Exchange } from "@orionprotocol/contracts/web3";
import ExchangeContractABI from "@orionprotocol/contracts/abis/Exchange.json";

const web3 = new Web3("https://bsc-dataseed.binance.org/");
const exchangeContractAddress = "0xe9d1d2a27458378dd6c6f0b2c390807aed2217ca";

const exchangeContract = new web3.eth.Contract(
  ExchangeContractABI,
  exchangeContractAddress
) as unknown as Web3Exchange;

exchangeContract.methods
  .getBalance(
    "0xe4ca1f75eca6214393fce1c1b316c237664eaa8e",
    "0x000000000000000000000000000000000000dead"
  )
  .call()
  .then((howMuchORNOnDeadAddress) => {
    console.log(howMuchORNOnDeadAddress);
  });
```
