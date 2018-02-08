[Thunderella: Blockchains with Optimistic
Instant Confirmation](https://eprint.iacr.org/2017/913.pdf)

State machine replication, or "consensus" is a central abstraction for distributed systems where a set of nodes seek to agree on an ever-growing, linearly-ordered log.

### Claims

Thunderella: a new paradigm for achieving state machine replication by combining a fast, asynchronous path with a (slow) synchronous "fall-back" path (which only gets executed when something goes wrong).

> a simple state machine replications that essentially are as robust as the best synchronous protocols, yet "optimistically" and "instantly" confirms transactions. (while majority of nodes are honest).


### Terms

In a state machine replication protocol, a set of servers seek to agree on an ever-growing, `linearly-ordered log`:

1. consistency: all servers must have the same view of the log.
2. liveness: whenever a client submits a transaction, the transaction is quickly incorporated into the log.

> state machine replication == consensus


#### 2 broad classes for consensus

* classical style protocols [PBFT, Byzantine-Paxos] confirm transactions quickly in the normal case. (notoriously complicated - achieve `fast confirmation` by adopting the asynchronous model, inherently can tolerate at most 1/3 corruptions.)

* blockchain style protocols (conceptually simple, tolerate minority corruptions).

#### New notion

> optimistic responsiveness: achieve responsiveness most of the time in practice and yet tolerate up to minority corruptions in the worst case.

#### The Thunderella Paradigm

A consensus protocol is said to be responsive if any transaction input to an honest node is confirmed in time that depends only on the `actual network delay`, but not on any a-priori known `upper-bound` on the network delay.


