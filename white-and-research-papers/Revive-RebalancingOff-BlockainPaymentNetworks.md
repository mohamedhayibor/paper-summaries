[Revive: Rebalancing O-Blockchain Payment Networks](https://eprint.iacr.org/2017/823.pdf)

Two-party duplex payment channels have been designed and used as building blocks to construct linked payment networks, which allow atomic and trust free payments between parties without exhausting the resources of the blockchain.

### Problem

Once a payment channel is depleted (ie mostly unidirectional transactions) the channel would need to be closed and re-funded to allow for new transactions... a user should be able to leverage his exiting channels to rebalance a poorly funded channel.

* One fundamental flaw of existing payment channels however remains the inability to re-fund a payment channel without performing transactions on the blockchain. (requiring at least 2 expensive on-chain transactions).

### Claim

Presents the first solution that allows an arbitrary set of users in a payment channel network to securely rebalance their channels, according to the preferences of the channel owners.

* from security analysis: an honest participant cannot lose any of its funds while rebalancing.
* POC implementation for the ethereum network


### Details

* Because payment channels avoid transacting on the blockchain, they can in practice significantly improve the transaction throughput. (transaction rate only limited by network bandwidthbetween participating peers).


* they do not require the direct service of the blockchain miners, and therefore can perform transactions with lower transaction fees (enabling micro payments).


* For a channel to be to be established between 2 parties, initial deposits representing the total the total amounts that can be transacted in this channel have to be put on the blockchain escrow.


> [security]: in case of a dispute of payment or need to withdraw deposits, the latest state of the ledger that the parties have agreed upon can be submitted to the blockchain and each party can claim its rightful balance.


### Payment networks

Instead of having to open payment channels between every pair of individuals that wish to make off-chain payments to each other, a linked payment which utilizes a network of payment channels to find an indirect path from the sender to the receiver can be used.

> envisioned to improve the usability and practicality of payment channels.

Finding routes over a payment network can be considered similar to packet routing. Restrictions apply:

* Intermediate nodes that route the linked payment need to have a sufficient balance in the payment channel that will act as the outgoing edge for the payment.
* A routed payment moreover either atomically succeeds or fails.
* The individual payments along each channel need to all be bound together, such that they all succeed or fail, no one loses any money.
* intermediate nodes are typically not involved in the payment between the sender and the receiver, they need to be incentivised to forward a payment. (current designs allow for intermediate hops to collect fees for forwarding a payment).

### Existing Payment Network Designs

* Duplex Micropayment Channels: rely on the timelock functionality of modern Bitcoin transactions. (support routed payments that can be confirmed without any confirmation delay)

* Lightning: similar to duplex, it allows to perform off-chain payments between Bitcoin participants. Instead of timelock, it relies on punishment to promote honest behavior. (an honest participant is able to claim all funds of the concerned channel.

* Raiden: aims to implement the same concepts in Lightning but on the Ethereum blockchain using smart contracts. (enabling micro-payments: transaction costs estimated to be 7 orders of magnitude lower).

* Sprites: payment channels designed for Ethereum. Aims to minimize the worst case collateral costs of indirect off-chain payments.

> collateral cost is calculated as the amount of time funds are frozen, or held in escrow, instead of being utilized or invested, multiplied by the amount of money that is suspended from use.

##### Requirement amongst the 3

When performing a linked payment, the amount of money that is to be transacted has to be frozen across the entire chain of payment channels involved, until the transaction completes or terminates.

The achieved worst case time in Sprites is not proportional to the length of the chain of intermediaries used to execute the payment, but is instead constant.


* Because the total funds held in escrow during a linked payment using Sprites is proportional to the length of the transaction chain, and the upper bound on the amount of time is constant, the worst case collateral cost per payment that is only linearly rather than quadratically.

* The turing completeness that Ethereum provides, enables Sprites to provide its cost optimization.


### Ledger Rebalancing Scheme

The extensive reuse of the same payment route may lead to an unfavorably skewed network structure in which payment routing becomes costly and inneficient.

* Even though intermediate nodes that participate in the routing of a payment maintain their total balances, they are required to transfer the transacted amount from one payment channel to another.

* If the intermediate nodes in a linked payment charge fees for routing the payment, then the skewness of the channels leads to an increased transaction cost because of the usage of longer paths in routing.

* The intermediate payment channels involved in a payment routing must freeze the transaction amount as collateral in order to guarantee the safe execution of the linked payment.

* possibility: negative routing fees in one direction as to promote that direction to cause rebalancing.


### Rebalancing protocol

