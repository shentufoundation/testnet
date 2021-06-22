## How to join Yulei-4 Testnet

1. Check out the correct commit in the [repo](https://github.com/certikfoundation/shentu) and build the binary.
The current binary was built from the commit `714ecf79915cc3498a52dbef6d2fc18aa7891187`.

2. Initialize certikd directories via command (--home flag is optional):
   ```bash
   certik init <moniker> --chain-id yulei-4 --home <home_dir>
   ```
3. Download the final genesis
    ```bash
    wget https://raw.githubusercontent.com/certikfoundation/testnet/master/yulei-4/genesis.json
    ```
4. Copy the final genesis file to your certikd config directory
    ```
    $ cp genesis.json $HOME/.certik/config/genesis.json
    ```
    Check if you have the correct genesis
    ```
    $ sha256sum ~/.certik/config/genesis.json
    2f940c24e9c88a001e3f0e548422944a536b8de5b3060f9b6a402ca2c788a852  genesis.json
    ```
5. Edit `config.toml` in the config directory (`$HOME/.certik/config`) to include the seeds
    ```
    seeds = "e6f8b95651ecdd8e7a969462f312a7949b7f8f17@18.234.254.139:26656,7d106850c5b3aacc12cd9b652dc10e97442eda3b@3.88.62.210:26656,c4d7166d53ee6418345fd76379a1a7a8189d4599@3.91.154.118:26656"
    ```
6. Reset and start certik process.
    ```
    certik unsafe-reset-all
    certik start
    ```
