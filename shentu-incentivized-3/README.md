Caution: make sure you keep your validator operator key, validator private key, and node ID somewhere safe before you proceed. Any loss of those files may cause loss of the validator account.

You can find the corresponding files at `$HOME/.certikd/config/node_id.json $HOME/.certikd/config/priv_validator_key.json` and the key seed of your validator operator account (the one you used in `create-validator`

<b> The upgrade height is set to 615000, which should be around Tuesday 22:00UTC. The actual time might vary due to block time fluctuation.</b>


![image](https://user-images.githubusercontent.com/52583590/91777687-8d96b800-ebbe-11ea-9024-b3579a6a5045.png)

 1. Download the corresponding binaries.
 2. (Only if you haven't run a node before) Run the following command to initialize certikd environment.
```
certikd init <moniker name>
``` 
 3. Download the genesis from the release notes (will be updated after block height 614000 is reached).
 4. Stop the running certikd process (`killall certikd`), then run the following command <b>from the old certikd binary</b>:
```
certikd export --for-zero-height --height 615000 > genesis_old.json
```
 5. Migrate the new genesis file <b>from the new certikd binary</b> using the following command:
```
certikd migrate genesis_old.json --chain-id=shentu-incentivized-3 > genesis.json
```
 6. Make sure to terminate any running certikd process. Copy the new genesis file to certikd config directory (by default `$HOME/.certikd/config/genesis.json`).
 7. run the following command:
```
certikd unsafe-reset-all
```
 8. Start the certikd process <b>from the new certikd binary</b> (`certikd start`)
