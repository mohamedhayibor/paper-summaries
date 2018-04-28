

eth sign: calculates an ethereum specific signature:

```
sign(keccak256("\x19Ethereum Signed Message:\n" + len(message) + message))
```

