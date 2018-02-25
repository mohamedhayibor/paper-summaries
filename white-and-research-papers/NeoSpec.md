Neo consensus

Nodes are elected by NEO holders and vote on validity of transactions (bookeepers).

* Consensus node: participates in consensus activity. Take turns assuming 2 roles:
* Speaker (1): responsible for transmitting a block proposal to the system (aka temp leader)
* Delegates: responsible for reaching consensus on a transaction

### Problem

Delegates must identify if the speaker is honest and what the actual command was as a group.

* minimum threshold of faulty Consensus Nodes within the system

```
f = (n - 1) / 3
```

* safe consensus threshold: below it (exposed to fault)

