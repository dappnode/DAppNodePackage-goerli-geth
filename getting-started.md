## Goerli Geth (Execution Client)

Goerli is now ready for the merge!

There are now two APIs in the Geth Execution Client:
1. RPC API `http://goerli-geth.dappnode:8545`. Use this endpoint to query transactions on your node and connect to your web3 wallet.
2. Engine API `http//goerli-geth.dappnode:8551`. Use this enpoint to connect your Beacon Chain (Consensus Layer) client.

After the merge, if your Execution Client is not connected to a Consensus Layer client, you won't be able to use it to query the blockchain nor to connect it to your wallet!
