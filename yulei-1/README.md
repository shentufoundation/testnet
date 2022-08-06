## How to join Yulei Testnet

1. Download v1.4.x binary https://github.com/certikfoundation/shentu/releases/tag/v1.4.0.0310
2. Initialize certikd directories via command (--home flag optional):
   ```bash
   certikd init --home <home_dir>
   ```
3. Download data files at https://yuleidatabucket.s3.amazonaws.com/data.tar
4. Extract the zip file, and move the contents into the certikd data directory (by default ~/.certikd/data).
5. Download the final genesis
    ```bash
    wget https://raw.githubusercontent.com/certikfoundation/testnet/master/yulei-1/genesis.json .
    ```
1. Copy the final genesis file to your certikd config directory
    ```
    $ cp genesis.json $HOME/.certikd/config/genesis.json
    ```
    Check if you have the correct genesis
    ```
    $ sha256sum ~/.certikd/config/genesis.json
    80a5a91f908d3a12673cb7d3655ba9fa8a89c26304be6e27014a3199d5017a4e  genesis.json
    ```
2. Edit `config.toml` in the config directory to include the seeds
    ```
    seeds = "<seed nodes above separated by comma>"
    ```
    example:
    ```
    seeds = "09a0005c2722bc548e5f81969afc1745c42366cd@3.235.129.141:26656,7d106850c5b3aacc12cd9b652dc10e97442eda3b@54.174.90.219:26656,c4d7166d53ee6418345fd76379a1a7a8189d4599@54.158.85.220:26656,75c2c5da9cc2567cf57cb5435943c5366386b93d@3.81.157.87:26656,2619328b25a7c010b99c9e26f42562e4ce4440fb@3.236.254.184:26656"
    ```
5. Start certikd process.
