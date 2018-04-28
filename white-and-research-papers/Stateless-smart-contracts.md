## [By childsmaidment](https://medium.com/@childsmaidment/stateless-smart-contracts-21830b0cd1b6)

```
contract DataStore {

  mapping(address => mapping(bytes32 => string)) public store;

  event Save(address indexed from, bytes32 indexed key, string value);

  function save(bytes32 key, string value) {
    store[msg.sender][key] = value;
    Save(msg.sender, key, value);
  }

}


// stateless design 

// don't store any contract state or events > implement the rest off-chain
// our data lives in the input of the transaction

contract DataStore {
  function save(bytes32 key, string value) {}
}
```

A filter processes the transactions of a dumb contract and provides an interpretation of that data

Traditional

Frontend > web3 > Eth nodes > web3 > Frontend


Stateless

Frontend > web3 > Eth nodes > Backend > Frontend


When a user interacts with our dumb contract from the frontend (using Metamask), we watch upcoming transactions on the backend and process them.


##### Trade-offs


A stateless design requires a mix of decentralization and centralization (mixed D) to provide the best UX / gas cost

Other contracts cannot access your data

If your contract has no events you must process every block to find relevant transactions. This can be mitigated by firing off empty events with marginal extra gas costs.
