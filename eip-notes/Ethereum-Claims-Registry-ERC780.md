[Ethereum Claims Registry - ERC780](https://github.com/ethereum/EIPs/issues/780)

allows persons, smart contracts to issue claims about each other, as well as self issued claims.

Goal: a central point of reference for on-chain claims on Ethereum.

* a standardized registry makes claim lookup simple and gas efficient.
* Less code: no need for verifying signatures, lookup identity signing keys... (only one external call)


* provides an interface for adding, getting, and removing claims
* claims are stored as type `bytes 32`

Interface:

```sol
// used by an issuer to set claim value with the key about the subject
function setClaim(address subject, bytes32 key, bytes32 value) public;

// convenience function for an issuer to set a claim about themself
function setSelfClaim(bytes32 key, bytes32 value) public;


// used by anyone to get a specific claim
function getClaim(address issuer, address subject, bytes32 key) public constant returns(bytes32);

// used by issuer to remove a claim it has made, or by a subject to remove a claim made by someone to the subject
function removeClaim(address issuer, address subject, bytes32 key) public;

```

Registry implementation

```
// as of Mon Mar  5 00:27:29 EST 2018
contract EthereumClaimsRegistry {

  mapping(address => mapping(address => mapping(bytes32 => bytes32))) public registry;

  event ClaimSet(
    address indexed issuer,
    address indexed subject,
    bytes32 indexed key,
    bytes32 value,
    uint updatedAt);

  event ClaimRemoved(
    address indexed issuer,
    address indexed subject,
    bytes32 indexed key,
    uint removedAt);

  function setClaim(address subject, bytes32 key, bytes32 value) public {
    registry[msg.sender][subject][key] = value;
    ClaimSet(msg.sender, subject, key, value, now);
  }

  function setSelfClaim(bytes32 key, bytes32 value) public {
    setClaim(msg.sender, key, value);
  }

  function getClaim(address issuer, address subject, bytes32 key) public constant returns(bytes32) {
    return registry[issuer][subject][key];
  }

  function removeClaim(address issuer, address subject, bytes32 key) public {
    require(msg.sender == issuer || msg.sender == subject);
    delete registry[msg.sender][subject][key];
    ClaimRemoved(msg.sender, subject, key, now);
  }
```