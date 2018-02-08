[IPFS - Content Addressed, Versioned, P2P File System](https://github.com/ipfs/papers/raw/master/ipfs-cap2pfs/ipfs-p2p-file-system.pdf)

A peer-to-peer distributed file system that seeks to connect all computing devices with the same system of files.

* similar to web, but could be seen as a single BitTorrent swarm, exchanging objects with one Git repository.

### Problem

We are entering a new era of data distribution with new challenges:

* hosting and distributing petabyte datasets
* computing on large data across organizations
* high-volume high-definition on-demand or real-time media streams
* versioning and linking of massive datasets
* preventing accidental disappearance of important files

### Claim

IPFS provides a high throughput content-addressed block storage model, with content-addressed hyper links.

> a generalized Merkle DAG, a data structure upon which one can build versioned file systems, blockchains or even a Permanent Web.

* It combines a distributed hashtable, an incentivized block exchange, and a self-certifying namespace.
* No single point of failure, nodes do not need to trust each other.


### Background

Distributed Hash Tables (DHT) are widely used to coordinate and maintain metadata about peer-to-peer systems.

###### Kademlia DHT

* Efficient lookup through massive networks: log2(n) nodes (20 hops for a network of 10 million nodes)
* Low coordination overhead
* Resistance to various attack by preferring long-lived nodes
* Wide usage in p2p applications.

###### Coral DSHT: extends Kademlia 

* stores addresses to peers who can provide the data blocks
* relaxes the DHT api from get_value_(key) to get_any_values(key) - can distribute only subsets of the values to the "nearest" nodes, avoiding hot-spots
* organizes a hierarchy of seperate DSHTs called clusters depending on region and size (finding nearby data without querying distant nodes)

###### S/Kademlia DHT: extends Kademlia

* provides schemes to secure NodeId generation, and prevent Sybil Attacks. It requires nodes to create PKI key pair, derive their identity from it, and sign their messages to each other. One scheme includes a proof-of-work puzzle to make generating Sybills expensive.
* S/Kademlia nodes lookup values over disjoint paths, in order to ensure hones nodes can connect to each other in the presence of a large fraction of adversaries in the network. It achieves a success rate of 0.85 even with an advasarial fraction as large as half of the nodes.


###### BitTorrent:

A widefly successful peer-to-peer filesharing system, which succeeds in coordinating networks of un-trusting peers (swarm) to cooperate in distributing pieces to each other.

* it's data exchange protocol uses a quasi tit-for-tat strategy that rewards the nodes who contribute to each other, and punishes nodes who only leech others' resources.
* peers track the availability of file pieces, prioritizing sending rarest pieces first. This takes load off seeds, making non-seed peers capable of trading with each other.
* The tit-for-tat is vulnerable to some exploitative bandwidth sharing strategies.


###### GIT: provides a powerful Merkle DAG object model that captures changes to a filesystem tree in a distributed-friendly way.

1. Immutable objects represent Files (blob), Directories (tree), and Changes (commit)
2. Objects are content-addressed, by the cryptographic hash of their contents
3. Links to other objects are embedded, forming a Merkle DAG.
4. Most versioning metadata (branches, tags, ...) are simply pointer references. (inexpensive to create and update)
5. Version changes only update references or add objects.
6. Distributing version changes to other users is simply transferring objects and updating remote references.


###### Self-Certified Filesystems - SFS

Propose implementations:

1. distributed trust chains
2. egalitarian shared global namespaces

SFS introduced a technique for building Self Certified Filesystems: addressing remote filesystems using the following scheme:

```
   /sfs/<Location>:<HostID>
```

where Location is the server network address:

```
   HostID = hash(public_key || Location)
```

The name of an SFS file system certifies its server.

> The user can verify the public key offered by the server, negotiate a shared secret, and secure all traffic.

All SFS instances share a global namespace where name allocation is cryptographic (not gated by any centralized body).


### IPFS design

* Incorporates successful ideas: DHTs, BitTorrent, Git, SFS.
* Presents a new platform for writing and deploying applications, and a new system for distributing and versioning large data.
* peer-to-peer no nodes are privileged.

Nodes store IPFS objects in local storage. The objects represent files and other data structures.

The IPFS protocol divided into stack of sub-protocols responsible for diff. functionality:

1. Identities: manage node identity generation and verification.
2. Network: manages connections to other peers.
3. Routing: maintains information to locate specific peers and objects.
4. Exchange: a block exchange protocol (BitSwap) that governs efficient block distribution.
5. Objects: a merkle DAG of content-addressed immutable objects with links.
6. Files: versioned file system hierarchy inspired by Git
7. Naming: self-certifying mutable name system.

###### Identities

* Nodes are identified by a `NodeId` (cryptographic hash of a public-key, created by `S/Kademlia's static crypto puzzle`).
* Nodes store their public and private keys (encrypted with passphrase).
* Nodes are incentivized to remain the same (accrued network benefits).
* upon first connecting, peers exchange public keys and check `hash(other.pubkey) == NodeId` (if not connection is terminated).

###### Network

* Transport: any transport protocol (is best suited for WebRTC)
* Reliability: LEDBAT or SCTP
* Connectivity: ICE NAT traversal techniques
* Integrity: optionally checks integrity of messages using a hash checksum.
* Authenticity: optionally checks authenticity of messages using HMAC.

###### Block Exchange

* data distribution happens by exchaning blocks with peers using BitSwap.

BitSwap credit (solution to free-loading nodes)

1. Peers track their balance (in bytes verified) with other nodes.
2. Peers send blocks to debtor peers proballistically, according to a function that falls as debt increases.

The debt ratio (measure of trust):

```
r = bytes_sent / (bytes_recv + 1)
```

> lenient to debts between nodes that have previously exchanged lots of data successfully, and merciless to unknown, untrusted nodes.

###### Object Merkle DAG

The DHT and BitSwap allow IPFS to form a massive peer-to-peer system for storing and distributing blocks quickly and robustly.

1. Content Addressing: all content is uniquely identified by its multihash checksum, including links
2. Tamper resistance: all content verified by its checksum.
3. Deduplication: all objects that hold the exact same content are equal, hence only stored once.


IPFS also defines a set objects for modeling a versioned filesystem on top of the Merkle DAG. Similar to Git.

Self-certified names: a way to construct self-certified names, in a cryptographically assigned global namespace, that are mutable.

