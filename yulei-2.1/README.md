## To sync to yulei-2.1 network you can either:
 1. download the binary located [here](https://github.com/shentuchain/testnet/raw/master/yulei-2.1/shentud) and start syncing with the seeds and genesis.
 1. (UNSTABLE AND UNTESTED) Use the state snapshot sync below with a normal v2.2.0 binary. 

Due to validator set matching in the init chainer, normal binary with genesis + seeds initialization will result in a panic. The second method's binary disabled a check during initializing genesis to bypass that error, and the binary is identical with the normal 2.2.0 binary otherwise. Make sure your shentud data directory is clean (or you can reset it through `shentud unsafe-reset-all`

## Upgrades on Yulei-2.1

Refer to the upgrades section for detailed information on planned/finished software upgrades on yulei-2.1 network.

# State Sync using Trusted Data Snapshots (Unstable)

Based on [cosmos-sdk-state-sync-guide](https://blog.cosmos.network/cosmos-sdk-state-sync-guide-99e4cf43be2f)

##

 - 2 RPC endpoints: `44.199.242.245:26657,44.192.7.96:26657`
 
    ```
    curl -s http://44.199.242.245:26657/block | jq -r '.result.block.header.height + "\n" + .result.block_id.hash'
    <some_height>
    <some_hash>
    ```

 - Edit `config.toml` under `.shentud/config`
 
    ```
    [statesync]
    enable = true
    rpc_servers = "44.199.242.245:26657,44.192.7.96:26657"
    trust_height = <some_height>
    trust_hash = "<some_hash>"
    trust_period = "336h"  # 2/3 of unbonding time
    ```

The node will start the peer exchange protocol once you start the shentud daemon, and will soon start to sync using the snapshot.
The snapshots are taken every 500 blocks on both nodes.

Pros:
 - Less chain data size (only stored from the snapshot height)
 - Much faster state sync

Cons:
 - Need to trust the RPC endpoint for the height and block hash

