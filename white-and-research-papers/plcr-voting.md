[PLCR](https://medium.com/adchain/a-walkthrough-of-plcr-voting-in-solidity-92420bd5b87c)

Partial lock commit/reveal: PLCR

* efficient system for token-weighted voting
* which enables a user to participate in multiple polls simultaneously
* with their tokens while preventing the double voting of tokens within polls
* allows users to withdraw at any time the maximum number of tokens not being actively used for voting

---

# [Voting in Ethereum](https://blog.colony.io/towards-better-ethereum-voting-protocols-7e54cb5a0119)

### Tocken Locking 

* Prevent tokens to be transferred after voting
* Allow them to be moved again after the polls and the result is in.

To harness wisdom of crowds:

* Diversity of opinions: Each should have private information even if it's just eccentric interpretation of the known facts
* Independence: people opinions aren't determined by the opinions of those around them
* Decentralization: people are able to specialize and draw on local knowledge

Solution: hide the outcome of the vote, until it has concluded

### Commit / Reveal

Step1: put a ballot in a sealed envelope

Voters generate a signed voting transaction and only submit its hash. **'Commit phase'**

Step2: Unseal your own envelope and count your vote

After the polls close, voters send a second transaction **'reveal'**. The voter submits the original signed vote to which they already committed.

* The vote is only valid if its hashes matches the commit
* A valid reveal transaction adds its vote to the total tally


### Partial-lock voting 


-----

To mitigate Sybil Attack, we must have either a closed assembly which actively manages its membership, or a voting method that does not count addresses.

* voteQuorum: the necessary percentage of votes necessary for a poll to be considered passing
* commitDuration: the duration of the commit period, in seconds
* revealDuration: the duration of the reveal period, in seconds


