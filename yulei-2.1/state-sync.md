# State Sync using Trusted Data Snapshots

Based on [cosmos-sdk-state-sync-guide](https://blog.cosmos.network/cosmos-sdk-state-sync-guide-99e4cf43be2f)

##

 - 2 RPC endpoints: `3.239.220.130:26657,44.193.30.206:26657`
 
    ```
    curl -s http://3.239.220.130:26657/block | jq -r '.result.block.header.height + "\n" + .result.block_id.hash'
    <some_height>
    <some_hash>
    ```

 - Edit `config.toml` under `.certik/config`
 
    ```
    [statesync]
    enable = true
    rpc_servers = "3.239.220.130:26657,44.193.30.206:26657"
    trust_height = <some_height>
    trust_hash = "<some_hash>"
    trust_period = "336h"  # 2/3 of unbonding time
    ```

The node will start the peer exchange protocol once you start the certik daemon, and will soon start to sync using the snapshot.
The snapshots are taken every 1000 blocks on both nodes.

Pros:
 - Less chain data size (only stored from the snapshot height)
 - Much faster state sync

Cons:
 - Need to trust the RPC endpoint for the height and block hash
