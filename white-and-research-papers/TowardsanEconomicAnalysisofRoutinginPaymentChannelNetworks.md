[Towards an Economic Analysis of Routing in
Payment Channel Networks](https://export.arxiv.org/pdf/1711.02597)

### Problem

Payment channels introduce economic routing constraints that limit decentralized scalability.
### Claims

The first formal model of payment channel economics and analyze how the cheapest path can be found.

> We find that even for small routing fees, sometimes it is cheaper to settle the transaction directly on the blockchain.

### Details

* Current public blockchains maintain their secure, unique global state property, by high levels of data replication. They do not scale with respect to transaction throughput, since the coordination and communication overhead for replication significantly reduces performance.

> Payment channels lead to a higher transaction throughput, since only netted transactions are written to the blockchain instead of intermediate states.

[Benefits]
* saving bandwidth
* preventing blockchain bloat
* enabling cheating resistance

* Raiden additionally implements auxilliary smart contracts which are deployed to support for example, the tracking of existing channels and hence facilitate the routing of a payment over multiple hops.
