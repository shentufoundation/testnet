# The Upgrade is done. Please refer to below to join `yulei-2` testnet.

## How to Join `yulei-2` Public Testnet:

1. Download v2.0.0 binary https://github.com/certikfoundation/shentu/releases/tag/v2.0.0
2. Initialize certik directories via command (--home flag optional):
   ```bash
   certikd init --home <home_dir>
   ```
5. Download the final genesis
    ```bash
    wget https://raw.githubusercontent.com/certikfoundation/testnet/master/yulei-2/genesis.json .
    ```
1. Copy the final genesis file to your certikd config directory
    ```
    $ cp genesis.json $HOME/.certik/config/genesis.json
    ```
    Check if you have the correct genesis
    ```
    $ sha256sum ~/.certik/config/genesis.json
    277e9831958fc6be37030854bef1495279a14469205bdcdddd5ec2eee3ddff50  genesis.json
    ```
2. Edit `config.toml` in the config directory to include the seeds
    ```
    seeds = "<seed nodes above separated by comma>"
    ```
    example:
    ```
    seeds = "09a0005c2722bc548e5f81969afc1745c42366cd@3.235.129.141:26656,7d106850c5b3aacc12cd9b652dc10e97442eda3b@54.174.90.219:26656,c4d7166d53ee6418345fd76379a1a7a8189d4599@54.158.85.220:26656,75c2c5da9cc2567cf57cb5435943c5366386b93d@3.81.157.87:26656,2619328b25a7c010b99c9e26f42562e4ce4440fb@3.236.254.184:26656"
    ```
5. Start certik daemon process.
