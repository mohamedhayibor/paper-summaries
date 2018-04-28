[Structured data hashing and signing](https://github.com/0xProject/EIPs/blob/master/EIPS/eip-signTypedData.md)
=======


A signature scheme consists of hashing algorithm and a signing algorithm.

* signing -> `secp256k1`
* hashing -> `keccak256`

The encoding function must be deterministic and injective.

* deterministic: if it is not deterministic then the hash might differ from the moment of signing to the moment of verifying, causing the signature to incorrectly be rejected.
* injective: if 2 different elements in our input set that hash to the same value, causing a signature to be valid for a different unrelated message.



----------

[wikipedia - injective function](https://en.wikipedia.org/wiki/Injective_function)

In mathematics, an injective function or injection or one-to-one function is a function that preserves distinctness: it never maps distinct elements of its domain to the same element of its co-domain. 

(ie: every element of the function's codomain is the image of at most one element of its domain).