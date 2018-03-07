### [ERC721 - NFT tokens](https://github.com/ethereum/EIPs/issues/721)

#### ownerOf

```sol
function ownerOf(uint256 _tokenId) constant returns (address owner)
```

* returns the address marked as owner of tokenID
* must throw if not currently tracked by contract
* must not return 0


#### approve

```sol
function approve(address _to, uint256 _tokenId)
```

* only one address can "have approval" at any given time
* + calling approveTransfer with a new address revokes approval for the previous address
* calling it with 0 as the _to argument clears approval for any address
* successful completion must emit an `Approval` event (unless caller attempting to clear approval when there is some outstanding approval.


#### takeOwnership

```sol
function takeOwnership(uint256 _tokenId)
```

Assigns the ownership of the NFT with ID _tokenId to `msg.sender` (if only it has approval, via a previous call to approveTransfer)

A successful event must fire the Transfer event, must transfer ownership to `msg.sender` or throw, no other outcomes can be possible.

Reasons for failure:

* msg.sender does not have approval for _tokenId
* _tokenId does not represent an NFT currently tracked by this contract
* msg.sender already has ownership of _tokenId

** A successful transfer must clear pending approval.**

#### transfer

```sol
function transfer(address _to, uint256 _tokenId)
```

Assigns ownership of the NFT with ID _tokenId to _to && only if msg.sender == ownerOf(_tokenId).

A successful transfer must fire the Transfer event. Must transfer ownership to _to or throw.

Reasons for failure:

* msg.sender is not the owner of _tokenId
* _tokenId currently not tracked by contract
* _to is 0

A confirming contract must allow the current owner to "transfer" a token to themselves, as a way of affirming ownership in the event stream.

> the "no-op" must be considered as a successful transfer, therefore must fire a transfer event with the same address for _from and _to


#### tokenOfOwnerByIndex

```sol
tokenOfOwnerByIndex(address _owner, uint256 _index) constant returns (uint tokenId)
```

Returns the nth NFT assigned to the address _owner, with n specified by the _index argument.

Recommended usage:

```sol
uint256 ownerBalance = nonFungibleContract.balanceOf(owner);

uint256 memory ownerTokens = new uint256[](ownerBalance);

for (uint256 i=0; i < ownerBalance; i++) {
  ownerTokens[i] = nonFungibleContract.tokenOfOwnerByIndex(owner, i);
}
```


#### tokenMetadata     (optional)


```sol
function tokenMetadata(uint256 _tokenId) constant returns (string infoUrl)
```

returns a multi address string referencing an external resource bundle that contains (optionally localized) metadata about the NFT associated with _tokenId

