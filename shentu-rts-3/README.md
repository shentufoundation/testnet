# CertiK shentu-rts-3 Testnet Upgrade #
 1. <b>The upgrade height is planned to be 28200, around 23:30 09-24-2020 EDT(03:30 09-25-2020 UTC) .</b> 
 2. Essentially should be identical with shentu-rts-2 upgrade, but with a different height and no genesis time modification.
# How to Upgrade your node #
<b>Caution: make sure you are using the correct certikd binary when following the instructions. from step 5, you should use the new certikd binary.</b>

<b>Make sure you are using the new binary from step 5.</b>

 1. Download relevant binaries according to your OS. The version <b>should be</b> 0.13.5 (to be published in https://github.com/certikfoundation/shentu)
 2. Wait until the upgrade height is reached (28200).
 4. terminate all running certikd process. Using the new certikd binary, run the following command:
    ```
    certikd export --for-zero-height --height 28200 > genesis_old.json
    ```
 5. Migrate the new genesis file using the following command:
    ```
    certikd migrate genesis_old.json --chain-id=shentu-rts-3 --genesis-time=2020-09-22T23:23:39Z > genesis.json
    ```
 6. Make sure to terminate any running certikd process. Copy the new genesis file to certikd config directory (by default .certikd/config/genesis.json).
 7. Run certikd unsafe-reset-all
 8. start certikd.

Note that you can skip 3~5 by waiting out and downloading the new official genesis file, planned to be updated here.

<b>Make sure you are using the new binary after step 5.</b>
```
shasum genesis.json
0c62e919bd2acd440cdaa7b93f10e0348482af14  genesis.json
sha256sum genesis.json
7664c9ef8a0abf0475ac8c3df6266422aa2471a7fac2054988d39817bad68de4  genesis.json
```
