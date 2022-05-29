# Examples

```ts
// ethers
import { Exchange__factory } from "@orionprotocol/contracts/ethers";
import { ethers } from "ethers";

const ethers = new ethers.providers.StaticJsonRpcProvider(
  "https://bsc-dataseed.binance.org/"
);
const exchangeContractAddress = "0xe9d1d2a27458378dd6c6f0b2c390807aed2217ca";
const exchangeContract = ethersContracts.ethers.Exchange__factory.connect(
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
```

```ts
// web3
import Web3 from "web3";
import { Exchange } from "@orionprotocol/contracts/web3";
import ExchangeContractABI from "@orionprotocol/contracts/abis/Exchange.json.d"; // "d" is make sense

const web3 = new Web3("https://bsc-dataseed.binance.org/");
const exchangeContractAddress = "0xe9d1d2a27458378dd6c6f0b2c390807aed2217ca";

const exchangeContract = new web3.eth.Contract(
  ExchangeContractABI,
  exchangeContractAddress
) as unknown as Exchange;

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
