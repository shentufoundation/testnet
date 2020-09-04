# Shentu Raise the Stakes #

 - Go version: [1.14.x](https://golang.org/dl/)
 - `certik` binary versions: [0.13.x](https://github.com/certikfoundation/chain/releases)

This directory is for joining and accumulating the data for shentu Raise the Stakes validator program.

You should find all participants' genesis accounts as well as genesis transactions here.

Note the genesis transactions are named `gentx-PR#.json` under `gentx/`. You can verify the final genesis through copying the genesis transactions to `certikd collect-gentxs --home <certikd home>`, which should update the genesis file to the final version at the config directory (`<certikd home>/config/genesis.json`).

List of seed nodes:
```
1564296ac09e12fd8a7c84c43d2a26abfb0d1f41@3.235.225.172:26656
a5fb59fd0b4c591ffa69f20f01f132f040dd68b4@100.27.49.255:26656
84b9549ecd001623c7688426d14e111d0cd593d4@34.236.38.150:26656
6a02b945f8ea620bbf7e46bb07ff4953cdfff1f3@3.236.253.202:26656
7e20eea8e072cbfd3830063a2a1fbc762929a95e@3.236.144.53:26656
```

When the final genesis released with all genesis transactions included, you can start your node and participate as a validator in `shentu-rts` by following the steps below.

 1. Copy the final genesis file to your certikd config directory
    ```
    cp genesis.json $HOME/.certikd/config/genesis.json
    ```
 2. Edit `config.toml` in the config directory to include the seeds above.
    ```
    seeds = "<some seeds above separated by comma>"
    ```
    example:
    ```
    seeds = "1564296ac09e12fd8a7c84c43d2a26abfb0d1f41@3.235.225.172:26656,a5fb59fd0b4c591ffa69f20f01f132f040dd68b4@100.27.49.255:26656"
    ```
 3. Start certikd daemon.
 
Note that the `genesis_time` in the genesis file is set to September 7th 07:00 UTC, which means the chain will not start until that time.
If you have everything set up correctly, if you run 
```
certikd start --home <your shentu-rts home> --log_level=info
```
The output will contain
```
.....

I[2020-09-04|19:43:44.403] This node is a validator .....

.....
```
Showing that you're correctly running a validator node, and 

```
I[2020-09-04|19:43:44.414] Genesis time is in the future. Sleeping until then... module=node genTime=2020-09-07T07:00:00Z
```
Showing that everything is set up correctly and the daemon is waiting for the genesis time.

The genesis file and its hash will be updated here when it's ready.