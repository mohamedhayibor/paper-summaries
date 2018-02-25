[HashGraph Consensus Algorithm](http://www.swirlds.com/downloads/SWIRLDS-TR-2016-01.pdf)

> proposed for replicated state machines with guaranteed BFT.

### Claims:

* fairness: difficult for an attacker to manipulate which two transactions will be chosen to be first in the consensus order.
* complete asynchrony, no POW, no leaders - fast - BFT
* eventual consistency with probability 1
* participants don't just gossip transactions [they gossip about gossip]

They jointly build a hashgraph reflecting all gossip events, allowing Byzantine agreement trhough `virtual voting`. (Bob calculates what vote Alice would have sent, based on his knowledge of what Alice knows).

> Yields fair Byzantine agreement on a total order for all transactions, with very little communication overhead beyond the transactions themselves.

### Core Concepts

* Transactions: any member can create a signed transaction at any time. All members get a copy of it (gossiped) the community reaches Byzantine agreement on the order of those transactions.
* Fairness: it should be difficult for a small group of attackers to unfairly influence the order of transactions (chosen as the consensus)
* Gossip: information spreads to each member repeatedly choosing another member at random, and telling them all they know.
* Hashgraph: a data structure that records who gossiped to whom and in what order.
* Gossip about gossip: the hashgraph is spread through the gossip protocol. The information being gossiped is the history of the gossip itself (gossip about gossip).
* Virtual voting: every member has a copy of the hashgraph, so Alice can calculate what vote Bob would have sent her. (zero bandwidth is used, beyond simply gossiping the hashgraph).
* Famous witnesses: Once Byzantine agreement is reached on the exact set of famous witnesses, it is easy to derive from the hashgraph a fair total order for all events.
