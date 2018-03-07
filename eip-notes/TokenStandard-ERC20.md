#### [ERC 20 Token Standard](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md)

Allows any tokens on Ethereum to be re-used by other applications.

#### name (optional)

```sol
function name() constant returns (string name)
```

#### symbol (optional)

```sol
function symbol() constant returns (string symbol)
```

#### decimals (optional)

```sol
function decimals() constant returns(uint8 decimals)
```

#### totalSupply

```sol
function totalSupply() constant returns (uint256 totalSupply)
```

#### balanceOf

```sol
function balanceOf(address _owner) constant returns (uint256 balance)
```

#### transfer

* _value: amount of tokens to address _to
* must fire the `Transfer` event
* function should throw if _from doesn't have enough tokens to spend
* transfer of 0 values must be treated as any other transfer and fire `Transfer` event

```sol
function transfer(address _to, uint256 _value) returns (bool success)
```

#### transferFrom

* must fire `Transfer` event
* used for a withdraw workflow (allowing contracts to transfer tokens on your behalf)
* should **Throw** unless _from account has deliberately authorized the sender of the message via som e mechanism.

```sol
function transferFrom(address _from, address _to, uint256 _value) returns (bool success)
```

#### approve

* allows _spender to withdraw from your account multiple times, up to the _value amount.
* overwrites the current allowance with _value (if called again)

```sol
function approve(address _spender, uint256 _value) returns (bool success)
```

#### allowance

* retuns the amount which _spender is still allowed to withdraw form owner.

```sol
function allowance(address _owner, address _spender) constant returns (uint256 remaining)
```

## Events

#### Transfer

* must trigger when tokens are transferred, including zero value transfers.
* even when contract creates new tokens (from set to 0x0)

```sol
event Transfer(address indexed _from, address indexed _to, uint256 value)
```

#### Approval

* must trigger on any successful call to approve(address _spender, uint256 _value)

```sol
event Approval(address indexed _owner, address indexed _spender, uint256 _value)
```
