## How to join Yulei-2 Testnet

1. Check out the correct commit in the [repo](https://github.com/certikfoundation/shentu) and build the binary.
The current binary was built from the commit `6405cfd9b62b7a797045e736daae5ff3844f785a`.

2. Initialize certik directories via command (--home flag is optional):
   ```bash
   certik init <moniker> --chain-id yulei-2 --home <home_dir>
   ```
3. Download the final genesis
    ```bash
    wget https://raw.githubusercontent.com/certikfoundation/testnet/master/yulei-2/genesis.json
    ```
4. Copy the final genesis file to your certikd config directory
    ```
    $ cp genesis.json $HOME/.certik/config/genesis.json
    ```
    Check if you have the correct genesis
    ```
    $ sha256sum ~/.certik/config/genesis.json
    852963435bf5f9da9ee24881cdf104b148993f016ce339ab47217e25e7d457ec  genesis.json
    ```
5. Edit `config.toml` in the config directory (`$HOME/.certik/config`) to include the seeds
    ```
    seeds = "09a0005c2722bc548e5f81969afc1745c42366cd@34.201.6.246:26656,c4d7166d53ee6418345fd76379a1a7a8189d4599@3.91.154.118:26656,75c2c5da9cc2567cf57cb5435943c5366386b93d@18.234.254.139:26656"
    ```
6. Reset and start certik process.
    ```
    certik unsafe-reset-all
    certik start
    ```
