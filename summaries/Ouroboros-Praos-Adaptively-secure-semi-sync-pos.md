[Ouroboros - An Adaptively secure sime synchronous POS blockchain](...)

### Claims

A POS blockchain protocol which provides security against `Fully-adaptive corruption` in the semi-synchronous setting:

* Attacker can corrupt any participant of a dynamically evolving population of stakeholders.
* The protocol tolerates an adversiarially-controlled message delivery delay unknown to protocol participants.

> a new form of forward secure digital signatures and a new type of verifiable random function that maintains unpredictability under malicious key generation.


### Specs - details

In Ouroboros Praos, deciding whether a certain participant of the protocol is eligible to issue a block is decided via a private test that is executed locally using a special verifiable random function (VRF) on the current timestamp and a nonce that is determined for a period of time known as "epoch".

