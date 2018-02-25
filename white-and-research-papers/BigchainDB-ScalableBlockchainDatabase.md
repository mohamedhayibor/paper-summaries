[BigchainDB: A Scalable Blockchain Database](https://www.bigchaindb.com/whitepaper/bigchaindb-whitepaper.pdf)

Single monolithic "blockchain" technologies are being re-framed and re-factored into building blocks at 4 leves of the stack:

1. Applications
2. Decentralized computing platforms
3. Decentralized processing ("smart contracts") and decentralized storage and commnunication
4. Cryptographic primitives, consensus protocols, and other algorithms

### Problem

Bitcoin: only a few transaction per sec (tps), 10mn confirmations, with a doubling of nodes, network traffic quadruples with no improvement in throughput, latency or capacity.

### Solution [claims]

A modern distributed DB can have throughput exceeding 1 million tps, capacity of petabytes, latency of a fraction of a second, and througput and capacity that increases as nodes get added.

BigchainDB: decentralized control, immutability, creation & transfer of assets. The decentralized control is via a federation of nodes with voting permissions that is a super-peer P2P network. The voting operates at a layer above the DB's built-in consensus. Immutability / tamper resistance is achieved via:
* shard replication
* reversion of disallowed updates, deletes,
* regular data backups,
* cryptographic signing of all transactions, blocks & votes


The paxos consensus algorithm is one of many algorithms designed to solve the consensus problem in unreliable distributed systems.
