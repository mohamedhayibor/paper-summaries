[ERC 900 - Simple staking](https://github.com/ethereum/EIPs/issues/900)

Common functionality for staking as well as providing information on stakes.


```sol
interface Staking {
  event Staked(address indexed user, uint256 amount, uint total, bytes data);
  event Unstaked(address indexed user, uint256 amount, uint total, bytes data);

  function stake(uint256 amount, bytes data) public;
  function unstake(uint256 amount, bytes data) public;

  function stakeFor(address user, uint256 amount, bytes data) public;
  function totalStakedFor(address addr) public view returns (uint256);

  function totalStaked(address addr) public view returns (uint256);

  function token() public returns (address);
  function supportsHistory() public pure returns (bool);

  // optional
  function lastStakedFor(address addr) public view returns (uint256);
  function totalStakedForAt(address addr, uint256 blockNumber) public view returns (uint256);
  function totalStakedAt(uint256 blockNumber) public view returns (uint256);
```

* Would make sense to update user->addr as for totalStakedFor??