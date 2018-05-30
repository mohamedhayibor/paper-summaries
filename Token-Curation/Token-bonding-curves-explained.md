[Token Bonding curves](https://medium.com/@justingoro/token-bonding-curves-explained-7a9332198e0e)

A bonding curve is one that issues its own tokens through buy and sell functions.

##### Buying

To buy tokens, you send ether to the buy function which calculates the average price of the token in ether terms and issues you with the correct amount.

##### Selling

The sell function [in reverse]:

1. provide the bonding curve with permission to take the amount of tokens you want to sell. `Erc20.approve()`
2. trigger the function to take those tokens from you.



##### Specs

* no limit on the number of tokens available
* [limit] amount of ether in the world
* **price curve**

##### Price Dynamics

* token price increases as the number of tokens issued increase
* rewards early adopters and encourages word of mouth marketing
* price of the token is 100% transparent 100% all the times





