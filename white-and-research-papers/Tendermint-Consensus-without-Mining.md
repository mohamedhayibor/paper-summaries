[Tendermint: Consensus without Mining](https://tendermint.com/static/docs/tendermint.pdf)

### Problem

PoW mining to secure consensus is super wasteful. Yet "nothing at stake" participants have nothing to lose by contributing to multiple forks which does not guarantee consensus on a single blockchain.

### Claims

A new consensus protocol that requires no PoW with a high level protection against double-spend attacks. (based on a modified version of the DLS protocol and is resilient up to 1/3 of Byzantine participants).

### Terms

* nodes are connected to each other in a p2p network and relay new information by gossip.
* each node keeps a complete copy of a totally ordered sequence of events in the form of a blockchain
* users keep an account in the system (identified by public-key)
* validators are users with accounts that have coins locked in a bond deposit by posting a bond transaction.

Long-range double-spend attack: when 2/3 of majority of validators publish a blockchain fork after they had unbonded and sold their coins to an unsuspecting party. (can be avoided by syncing their blockchain periodically within the bounds of the unbounding period).

> a double-spend attack implies a fork in the blockchain.

A short range double-spend attack occurs when a fork happens at a recent height: recent enough that the guilty validators still have their coins locked in bond. 

> Since a fork requires at least a 1/3 majority of validators to have signed duplicitously, the penalty for a short-range double-spend attack is a significant proportion 1/3 of the total amount of bonded coins.


### Tidbits

Newer protocols like BitShares "Delegated Proof of Stake" protocol attempt to address this problem by placing the role ranked-delegate at stake, but security is dependant on the extrinsic ability of stakeholders to accurately predict the future performance of delegates.

