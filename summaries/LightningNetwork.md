[The Bitcoin Lightning Network](https://lightning.network/lightning-network-paper.pdf)

Lightning is a decentralized network using smart contract functionality in the blockchain to enable instant payments across network participants.

* for instant, high volume micro-payments that removes the risk of delegating custody of funds to trusted third parties.

* The innovation of Lightning Network is the use of time-locked transactions and cryptographic nonces to allow many 2 party payment channels to form a connected network where payments can be sent over many channels without trusting the intermediate nodes.
(similar to IP networks like the internet: packets are routed over many physical links, the communicating end-nodes don't worry about the route as long as data gets to the destination.)


## Quick Claims

* Instant payments: Lightning fast blockchain payments without worrying about block confirmation times. Security is enforced by blockchain smart-contracts without creating a on-blockchain transaction for individual payments. Payment speed measured in milliseconds to seconds.

* Scalability: Capable of millions to billions of transactions per second across the network. Capacity blows away legacy payment rails by many orders of magnitude. Attaching payment per action/click is now possible without custodians.

* Low Cost: By transacting and settling off-blockchain, the lightning network allows for exceptionally low fees, which allows for emerging use cases such as instant micro-payments.

* Cross Blockchains: Cross-chain atomic swaps can occur off-chain instantly with heterogeneous blockchain consensus rules. So long as the chains can support the same cryptographic hash function, it is possible to make transactions across blockchains without trust in 3rd party custodian.