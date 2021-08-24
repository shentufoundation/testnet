## Upgrade Procedure (Without Pre-processed Genesis file)

__Note__: It is assumed you are currently operating a full-node running certik v1.4.0 with v0.39.1 of the _Cosmos SDK_.

The version/commit hash of certik v1.4.0: `331ac5bffc0f8bc3769ff7125f51b871cce58721`

1. Verify you are currently running the correct version (v1.4.0) of _certikd_:

   ```bash
    $ ./certikd version --long
        name: certik
        server_name: certikd
        client_name: certikcli
        version: 1.4.0.0310
        commit: 331ac5bffc0f8bc3769ff7125f51b871cce58721
        build_tags: ""
        go: go version go1.15.6 linux/amd64
   ```

1. Make sure your chain halts at the right block height:
    `4960000`

    ```bash
    perl -i -pe 's/^halt-height =.*/halt-height = TBD/' ~/.certikd/config/app.toml
    ```

1. After the chain has halted, export existing state from `yulei-1`:

   Before exporting state via the following command, the `certikd` binary must be stopped!
   Since we know the last block generated in `yulei-1`, we now export the state.

   ```bash
   $ certikd export --height=4960000 > yulei-1-genesis-exported.json
   ```
   _this might take a while, you can expect up to 30 minutes for this step_
 
1. Make a backup of your `.certikd` directory

    ```bash
    mv ~/.certikd ./certikd_backup
    ```

    **NOTE**: It is recommended for validators and operators to take a full data snapshot at the export
   height before proceeding in case the upgrade does not go as planned or if not enough voting power
   comes online in a sufficient and agreed upon amount of time. In such a case, the chain will fallback
   to continue operating `yulei-1`. See [Recovery](#recovery) for details on how to proceed.


1. Verify the SHA256 of the (sorted) exported genesis file:

    Compare this value with other validators / full node operators of the network. 
    Going forward it will be important that all parties can create the same genesis file export.

   ```bash
   $ jq -S -c -M '' shentu-1-genesis-exported.json | shasum -a 256
   [SHA256_VALUE]  shentu-1-genesis-exported.json
   ```

1. At this point you now have a valid exported genesis state! All further steps now require
v2.0.0 of [certik](https://github.com/certikfoundation/shentu) binary. 
Cross check your genesis hash with other peers (other validators) in the chat rooms.

   **NOTE**: Go [1.15+](https://golang.org/dl/) is required!

   ```bash
   $ git clone https://github.com/certikfoundation/shentu.git && cd shentu && git checkout v2.0.0; make install
   ```

1. Verify you are currently running the correct version (v2.0.0) of the _CertiK_:

   ```bash
    name: certik
    server_name: certik
    version: 2.0.0
    commit: d616107ef56725c17c710eba41342118ca1b6e1b
    build_tags: netgo,ledger
    ...
   ```
    The version/commit hash of CertIK v2.0.0: `d616107ef56725c17c710eba41342118ca1b6e1b`

1. Migrate exported state from the current v1.4.0 version to the new v2.0.0 version <b>WITH THE v2.0.0 BINARY</b>:

   ```bash
   $ certik migrate yulei-1-genesis-exported.json --chain-id=yulei-2 --initial-height 4960001 > genesis.json
   ```

   This will migrate our exported state into the required `genesis.json` file to start the node in shentu-2.

1. Verify the SHA256 of the final genesis JSON:

   ```bash
   $ jq -S -c -M '' genesis.json | shasum -a 256
   [SHA256_VALUE]  genesis.json
   ```

    Compare this value with other validators / full node operators of the network. 
    It is important that each party can reproduce the same genesis.json file from the steps accordingly.

1. Initialize new `cerik` directory:

    First we want to  initialize the config and data directories:
    ```bash
    $ certik init <moniker> --chain-id yulei-2
    ```
    
    Then, copy over the existing validator keys and node keys over to the new directory.
    
    ```bash
    $ cp ~/.certikd/config/priv_validator_key.json ~/.certik/config/
    $ cp ~/.certikd/config/node_key.json ~/.certik/config/
    ```

1. (Optional) Reset old chain data:

   **NOTE**: You will lose all your old chain data if you run this step.

   ```bash
   $ certikd unsafe-reset-all
   ```

1. Supply new chain data into the new chain:
    
    Move the new `genesis.json` to your `.certik/config/` directory

    ```bash
    cp genesis.json ~/.certik/config/
    ```
    
    Modify `config.toml` to provide some seed nodes or persistent peers
    
    ```bash
    # Comma separated list of seed nodes to connect to
    seeds = "<node_id@addr:port,...>"
 
    # Comma separated list of nodes to keep persistent connections to
    persistent_peers = "<node_id@addr:port,...>"
    ```

1. Start your blockchain 

    ```bash
    certik start
    ```

    Automated audits of the genesis state can take a few seconds using the crisis module. This can be disabled by 
    `certik start --x-crisis-skip-assert-invariants`.

## Notes for Service Providers & Node Runners

# REST server

In case you have been running REST server with the command `certikcli rest-server` previously, running this command will not be necessary anymore.
API server is now in-process with daemon and can be enabled/disabled by API configuration in your `.certik/config/app.toml`:

```
[api]
# Enable defines if the API server should be enabled.
enable = false
# Swagger defines if swagger documentation should automatically be registered.
swagger = false
```

`swagger` setting refers to enabling/disabling swagger docs API, i.e, /swagger/ API endpoint.

# gRPC Configuration

gRPC configuration in your `.certik/config/app.toml`

```yaml
[grpc]
# Enable defines if the gRPC server should be enabled.
enable = true
# Address defines the gRPC server address to bind to.
address = "0.0.0.0:9090"
```

# State Sync

State Sync Configuration in your `.certik/config/app.toml`

```yaml
# State sync snapshots allow other nodes to rapidly join the network without replaying historical
# blocks, instead downloading and applying a snapshot of the application state at a given height.
[state-sync]
# snapshot-interval specifies the block interval at which local state sync snapshots are
# taken (0 to disable). Must be a multiple of pruning-keep-every.
snapshot-interval = 0
# snapshot-keep-recent specifies the number of recent snapshots to keep and serve (0 to keep all).
snapshot-keep-recent = 2
```


