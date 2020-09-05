# Shentu Raise the Stakes #

 - Go version: [1.14.x](https://golang.org/dl/)
 - `certik` binary versions: [0.13.x](https://github.com/certikfoundation/testnet/releases)

This directory is for joining and accumulating the data for shentu Raise the Stakes validator program.

You should find all participants' genesis accounts as well as genesis transactions here.

Note the genesis transactions are named `gentx-PR#.json` under `gentx/`. You can verify the final genesis through copying the genesis transactions to `certikd collect-gentxs --home <certikd home>`, which should update the genesis file to the final version at the config directory (`<certikd home>/config/genesis.json`).

List of seed nodes:
```
7d4a3761d0d725b5522ff00c926b95f36f481aaa@3.235.225.172:26656,e1820e5fd23e43d18be3e3e13a64b9383fb56a81@100.27.49.255:26656,b5ee0d27762dd1f1d4ea4b262b39ebd4ec02e5dc@34.236.38.150:26656,cf24fa8b46e01963f34c2ba885b4f70e2a88a857@3.236.253.202:26656,d70bd3f35a0c1c20e6a8fc57bc46c0ed02e7b381@3.236.144.53:26656
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
3. <b>Reset certikd data through the following command:</b>
```
certikd unsafe-reset-all
```
Append `--home <certik_home_directory>` if you default home directory is NOT `~/.certikd`.
4. Start certikd daemon.
```
certikd start --log_level=info
```
Append `--home <certik_home_directory>` if you default home directory is NOT `~/.certikd`.

Note that the `genesis_time` in the genesis file is set to `September 7th 07:00 UTC`, which means the chain will not start until that time.
If you have everything set up correctly, you should see the following after starting the daemon:
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

shasum of genesis.json:
```
> shasum testnet/shentu-rts/genesis.json
90b9a79d4a795e1c8d343480a71578ad60253588  testnet/shentu-rts/genesis.json
```
