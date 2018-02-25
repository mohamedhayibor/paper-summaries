[Storj - A Peer-to-Peer Cloud Storage Network](https://storj.io/storj.pdf)

A p2p cloud storage network implementing client-side encryption would allow users to transfer and share data without reliance on a 3rd party provider.

### Problem

p2p networks are unfeasible for production storage systems, as data availability is a function of popularity, rather than utility.

### Solution

A challenge response verification system coupled with direct payments (periodically checking data integrity, and offer rewards to peers maintaining data).

### Design

Storj protocol enables peers on the network to negotiate contracts, transfer data, verify the integrity and availability of remote data, retrieve data, and pay other nodes.

* a shard is a portion of an encrypted file to be stored on the network.
* the data owner retains complete control over the encryption key, and thus over access to the data.
* security of a file is proportional to the square of the size of the network.
* shard size a negotiable contract parameter.
* standard sizes dissuade side-channel attempts to determine the content of a given shard, and can mask the flow of shards through the network.
* Bandwidth demands are distributed more evenly across the network. (user can take advantage of parallel transfer).
* availability is proportional to the number of nodes storing the data.

Built on Kademlia (dht), which creates a distributed network with efficient message routing and other desirable qualities.

* nodes sign all messages and validate message signatures before processing messages. (each node creates a ECDSA pair).
* proof of retrievability guarantee the existence of a certain piece of data on a remote host.
* an audit or heartbeat: a standard format for issuing and verifying proofs of retrievability.
* Data storage is negotiated via a standard contract format. (a versioned data structrure that describes the relationship between data owner and farmer).


Quasar offers topic based p2p pub/sub utilizing bloom filters.



