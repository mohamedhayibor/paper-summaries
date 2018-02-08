[Orchid: Enabling Decentralized Network Formation and
Probabilistic Micro-Payments](https://orchidprotocol.com/whitepaper.pdf)

With browsing censoring and private browsing leaking, the interest in anonymization has increased.

### Problem

Only a few thousand of unpaid volunteers host relays and exit nodes.

> proposed solution: a market based, fully decentralized, and anonymous p2p system based on "bandwidth mining" which we believe addresses this lack of relay and exit nodes by directly incentivizing participants.

### Terms

Orchid Protocol organizes bandwidth sellers into a structured p2p network termed the Orchid market. Users connect to it and pay bandwidth sellers in order to form a proxy chain to specific resource on the internet.

* proxy chains separate information about the source of data from information about its destination; no single relay or proxy holds both pieces of information, or knows the identity of someone who does.
* provides resistance to collusion attacks: the ability of a group of bandwidth sellers to overcome this seperation of knowledge.
* `fixed rate relaying` to prevent traffic analysis.


3 parts of Orchid's protocol:

* Ethereum based payments
* manifolds
* Orchid market

[firewall avoidance] Ethereum network traffic of clients is likely to be the weak link. Because all nodes must maintain this information, use of the Orchid protocol to distribute Ethereum information seems like a natural fit.

##### Appendix

Types of Attack: The central goal of collusion attacks is the linking of a specific Orchid customer with a specific SSL connection.

1. Relation: the attacker can deduce that a customer is talking to a given website because they observe enough points along the route.
2. Timing: by controlling and then observing the timing of packets.
3. Unburning: the attacker can perform a timing attack in spite of bandwidth burning being employed by the customer.


