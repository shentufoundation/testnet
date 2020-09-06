# Shentu Raise the Stakes #

## Prerequisites
- Go version: [1.14.x](https://golang.org/dl/)
- `certik` binary versions: [0.13.x](https://github.com/certikfoundation/testnet/releases)

## Summary
This directory is for joining and accumulating the data for shentu Raise the Stakes validator program. You should find all participants' genesis accounts as well as genesis transactions here.

## Verify Genesis
*This is an optional step. All validators are encouraged to verify the genesis file provided by the Foundation before starting up their nodes*

You can verify the authenticity of the final genesis by performing the following:
1. Copy all genesis transactions [here](https://github.com/certikfoundation/testnet/tree/master/shentu-rts/gentx) to your `<certik_home>`. Note `<certik_home>` defaults to `~/.certikd`
2. Collect Gen-Tx's
    ```
    $ certikd collect-gentxs --home <certik_home>
    ```
3. Check if the shasum matches
    ```
    $ shasum ~/.certikd/config/genesis.json
    909a79d4a795e1c8d343480a71578ad60253588  /home/ubuntu/.certikd/config/genesis.json
    ```

## Seed Nodes
List of seed nodes:
```
7d4a3761d0d725b5522ff00c926b95f36f481aaa@3.235.225.172:26656,e1820e5fd23e43d18be3e3e13a64b9383fb56a81@100.27.49.255:26656,b5ee0d27762dd1f1d4ea4b262b39ebd4ec02e5dc@34.236.38.150:26656,cf24fa8b46e01963f34c2ba885b4f70e2a88a857@3.236.253.202:26656,d70bd3f35a0c1c20e6a8fc57bc46c0ed02e7b381@3.236.144.53:26656
```

## Get Started

1. Copy the final genesis file to your certikd config directory
    ```
    $ cp genesis.json $HOME/.certikd/config/genesis.json
    ```
    Check if you have the correct genesis
    ```
    $ shasum ~/.certikd/config/genesis.json
    90b9a79d4a795e1c8d343480a71578ad60253588  /home/ubuntu/.certikd/config/genesis.json
    ```
2. Edit `config.toml` in the config directory to include the seeds above
    ```
    seeds = "<some seeds above separated by comma>"
    ```
    example:
    ```
    seeds = "1564296ac09e12fd8a7c84c43d2a26abfb0d1f41@3.235.225.172:26656,  a5fb59fd0b4c591ffa69f20f01f132f040dd68b4@100.27.49.255:26656"
    ```
3. <b>Reset certikd data through the following command:</b>
    ```
    $ certikd unsafe-reset-all
    ```
    Append `--home <certik_home>` <b>only if</b> your default home directory is NOT `~/.certikd`.
4. Start certikd daemon.
    ```
    $ certikd start --log_level=info
    ```
    Append `--home <certik_home>` <b>only if</b> you default home directory is NOT `~/.certikd`.

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
