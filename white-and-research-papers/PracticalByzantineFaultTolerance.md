[Practical Byzantine Fault Tolerance - PBFT](http://pmg.csail.mit.edu/papers/osdi99.pdf)

A new replication algorithm able to tolerate Byzantine faults.

> pratical: works in async environments and incorporates several important optimizations that improve the response time of previous algorithms by an order of magnitude.

### Problem

Malicious attacks, software errors are becoming increasingly common and can cause faulty nodes to exhibit arbitrary errors.

Reliance on sychronicity for correctness is dangerous in the presence of attacks.

### Claims

* doesn't rely on synchrony for safety.
* improves the security of Rampart and SecureRing.
* uses only 1 message round-trip to execute read-only operations and 2 for read-write operations.
* uses an efficient authentication scheme based on message authentication codes during normal operation


### Contributions

* first state-machine replication protocol that correctly survives Byzantine faults in async networks.
* important optimizations for real systems
* description of a BFT distributed file system
* experimental results that quantify the cost of the replication technique

