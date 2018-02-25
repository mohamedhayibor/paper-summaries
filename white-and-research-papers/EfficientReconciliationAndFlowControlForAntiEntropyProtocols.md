[Efficient Reconciliation And Flow Control For Anti Entropy Protocols](http://www.cs.cornell.edu/home/rvr/papers/flowgossip.pdf)

Anti-entropy, or gossip, is an attractive way of replicating state that does not have strong consistency requirements.

With few limitations, updates spread in expected time that grows logarithmic in the number of participating hosts, even in the face of host failures and message loss. (some synchronous guarantees)

### Problem

Like any other synchronous communication channel, gossip has the capacity that is limited by:
* available bandwidth for transporting gossip data
* and CPU cycles for generating and processing the gossip messages.

> Under high update load, a gossip protocol may not be able to send all updates required to reconcile differences between peers. Updates would take arbitrary time to propagate as the gossip channel gets backed up.

Gossip protocols are designed to be non-invasive and have predictable performance, and for this a designer has to fix not only the gossip rate per participant but also the maximum size of gossip messages (e.g. maximum UDP packet size)

> tradoff: while this avoids network and CPU overload, it also limits the capacity of the gossip channel.

### 2 Contributions

1. a new state reconciliation mechanism that is designed both for minimal CPU overhead and in which only limited bandwidth is available.
2. It proposes and analyzes a flow control scheme for gossip.

2 classes of gossip:

1. Anti-entropy: gossip information until it is made obsolete by newer information, and are useful for reliably sharing information among a group of participants.
2. Rumor-mongering: participants gossip information for some amount of time chosen sufficiently high so that with high likelihood all participants receive the information.


### Solutions

* a new reconciliation mechanism that, in the face of overload, aggressively selects updates that have not been made obsolete by later updates, but without starving updates that are not yet obsolete.

* a flow control mechanism where each participant locally adapts its rate of updates. (assures fairness by dividing the available network capacity among the participants that are actively gossiping new updates.

