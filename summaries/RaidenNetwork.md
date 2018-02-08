[Raiden](https://raiden.network/faq.html)

Aims to scale Ethereum by using state channel technology:

* off-chain transfer network for Ethereum ERC20 tokens
* fast, scalable and cheap alternative to on-chain transfers
* guarantees of finality, security and decentralization

### Problems it's trying to address

Scalibility: the bigger the network, the higher the maximum throughput.

Latency: finality of transactions: the moment you receive a signed Raiden transfer, you can be certain that you now hold the amount included in the transfer.

Transaction fees: Instead of paying for global consensus, you only pay for forwarding peer-to-peer consensus.

Improving privacy: When channels are settled, only the sum of transactions will become visible to the world.

### Terms

Payment channels: technology that enables off-chain transfers of on-chain tokens.

Sharding: will allow Ethereum to significantly scale overall transaction capacity, basically by partitioning state over multiple chains. (it will still have suboptimal latency, cost, privacy properties for token transfers, compared to the raiden network.)

Plasma: a proposed concept to scale transaction capacity using hierarchical trees of side chains.

* Raiden transfers are quick to create, requiring only a single elliptic curve signature to be computed.

RaidEx is a PoC of a decentralized exchange built on top of the Raiden Network based on its atomic token swap feature.

### Fees

2 kind of fees in raiden:

* Protocol level fees: necessary to keep the payment channel network balanced
* Peripheral fees: payable to services in the network, that, for example, assist with finding path with sufficient capacity or services that provide channel monitoring services for offline users.
