# CertiK shentu-rts-2 Testnet Upgrade #
 1. <b>The upgrade height is planned to be 224300, around 18:00 EDT (22:00 UTC) 09-22-2020.</b> 

# How to Upgrade your node #
Caution: make sure you are using the correct certikd binary when following the instructions. from step 5, you should use the new certikd binary.

<b>Make sure you are using the new binary from step 5.</b>

<p align="center">
 <img src="https://github.com/certikfoundation/testnet/blob/master/shentu-rts-2/flowchart.png" width="450" height="400">
</p>

 1. Download relevant binaries according to your OS.
 2. Wait until the upgrade height is reached (224300).
 3. Get the new genesis time using the following command (note you need have `jq` installed beforehand).
    1. for Linux:
       ```
       time=$(certikcli query block 224300 | jq -r '.block["header"]["time"]') && TZ=UTC date -d "$time +60 min" +"%Y-%m-%dT%H:%M:%SZ"
       ```
    2. for macOS:
       ```
       certikcli query block 224300 | jq -r '.block["header"]["time"]'|xargs -0 date -v +60M -j -f "%Y-%m-%dT%H:%M:%S" +"%Y-%m-%dT%H:%M:%SZ"
       ```
 4. terminate all running certikd process. Using the old certikd binary, run the following command:
    ```
    certikd export --for-zero-height --height 224300 > genesis_old.json
    ```
 5. Migrate the new genesis file using the following command, where <genesis_time> refers to the one you retrieved above in step 3:
    ```
    certikd migrate genesis_old.json --chain-id=shentu-rts-2 --genesis-time=”<genesis_time>” > genesis.json
    ```
 6. Make sure to terminate any running certikd process. Copy the new genesis file to certikd config directory (by default .certikd/config/genesis.json).
 7. Run certikd unsafe-reset-all
 8. start certikd.

Note that you can skip 3~5 by waiting out and downloading the new official genesis file, planned to be updated here.

The chain will not start until the genesis time. Once you are done setting things up and started certikd process, wait until the genesis time is reached in UTC to see new blocks being produced.

<b>Make sure you are using the new binary after step 5.</b>

```
shasum genesis.json
48c9257554b6f489d8facb3a9cd3f67974792cbf  genesis.json
sha256sum genesis.json
812ffce25cf38daf693903dbeee760f98ed2425ddb3187eb3f4d8da09cbe6413  genesis.json
```

Future upgrade to shentu-rts-3 will be announced soon.
