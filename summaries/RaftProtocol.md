[Raft protocol](http://thesecretlivesofdata.com/raft/)

* node: as a database server that stores a single value.
* client: can send a value to server.

Raft: a protocol for implementing distributed consensus.

A node can be in 1 of 3 states:

* Follower state
* Candidate state
* Leader state

All nodes start in follower state.

### Leader Election [process]

If followers don't hear from a leader then they can become a candidate.
* the candidate then requests votes from other nodes.
* nodes reply with their vote.
* the candidate becomes the leader if it gets votes from a majority of nodes.

> all changes now go to the leader.

### Log Replication [process]

* Each change is added as an entry in the node's log.
* If a log entry is currently uncommitted so it won't update the node's value.
* To commit the entry node first replicates it to the follower nodes...
* Then the leader waits until a majority of nodes have written the entry.
* Only then the entry is committed on the leader node.
* The leader notifies the followers that the entry is committed.

> The cluster has now come to consensus about the system state.


### Leader selection 

In RAFT there are 2 timeout settings which control elections.

###### Election timeout:

amount of time a follower waits until becoming a candidate.

* election timeout is randomized between 150ms - 300ms.
* after the election timeout the follower becomes a candidate and starts a new election term
* votes for itself
* sends out a `Request Vote` messages to other nodes
* if the receiving node hasn't voted yet in this term then it votes for the candidate
* the node resets its election timeout
* majority of votes -> leader


The leader begins sending out `Append Entries` messages to its followers.
These messages are sent in intervals specified by the `heartbeat timeout`.
Follower then respond to each Append Entries message.

> this election term will continue until a follower stops receiving hearbeats and becomes a candidate.

* Requiring a majority of votes guarantees that only one leader can be elected per term.

if 2 nodes become candidates at the same time then a split vote can occur.

* 2 nodes both start an election for the same term
* [re-election again]


###### Log replication

Once we have a leader elected we need to replicate all changes to our system to all nodes.

> done by using the same Append Entries message that was used for heartbeats.

1. client sends a change to the leader.
2. change sent to leader's log
3. the change is sent to the followers on the next heartbeat
4. entry committed once majority of followers acknowledge
5. a response is sent to the client

Raft can stay consistent in the face of network partitions.
