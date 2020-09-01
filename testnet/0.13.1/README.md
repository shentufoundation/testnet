![image](https://user-images.githubusercontent.com/52583590/91777687-8d96b800-ebbe-11ea-9024-b3579a6a5045.png)

 1. Download the corresponding binaries.
 2. (Only if you haven't run a node before) Run the following command to initialize certikd environment.
```
certikd init <moniker name>
``` 
 3. Download the genesis from the release notes (will be updated after block height 599000 is reached).
 4. Stop the running certikd process (`killall certikd`), then run the following command <b>from the old certikd binary</b>:
```
certikd export --for-zero-height --height 599000 > genesis_old.json
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
