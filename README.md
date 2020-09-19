[Create Test Account](#create-test-accounts), [Download Latest Release](https://github.com/certikfoundation/testnet/releases/)

<b>Note the binaries released in the releases can have a slightly different version than the release tags (release 0.13.4 having version 0.13-9-xxxx)</b>

# CertiK Chain Testnet

This repository hosts the `CertiK Chain` implementation and testnet information. More documents and details will be released here over the progress of testnet.

`CertiK Chain` is the key component in CertiK's vision of building end-to-end secure and trustworthy infrastructure for the blockchain world. Here is a brief [introduction](https://medium.com/certik/introducing-the-certik-chain-26629248da3c) to the chain.

The current version of the testnet is Incentivized Testnet, which anyone can participate to earn real CTK when we arrive at mainnet. The overall goal of testnet is to define and implement a majority of the `CertiK Chain` features and build a strong `CertiK Chain` developer and user community by providing opportunities to contribute to the chain design and development, to evaluate the chain's main features, and to develop smart contracts and other usage scenarios around the chain.

As testnet moves through its various stages, CertiK Foundation expects to provide ample opportunities for active members of the community to be rewarded for their contributions.

## Timeline

* Closed Alpha 1.0 (July 22, 2019)
* Closed Alpha 2.0 (November 04, 2019)
* Open Beta 3.0 (November 27, 2019)
* Full Testnet 4.0 (March 31, 2020)
* Incentivized Testnet 1.0 (July 15, 2020)
* Validator Program <Raise the Stakes> (September 07, 2020)
* ...
* Mainnet

## Closed Alpha (COMPLETED)

The very first stage of testnet is the closed alpha stage. At the begining of this stage, most chain features are either not fully tested, partially implemented, or even unimplemented. Hence for this stage we talk about "what (mostly) works" rather than "what does not work".

During this stage, testnet backend and frontend are expected to receive a lot of updates, often causing the chain to be re-deployed from scratch. The validator set size will be small (e.g., no more than 20).

## Open Beta (COMPLETED)

The second stage of testnet is the open beta stage. It starts when the closed alpha stage exits with many testnet features implemented and alpha-tested. For this stage we switch to talk about "what is missing" instead of "what works".

During this stage, testnet backend and frontend are expected to receive constant updates, occasionally causing the chain to be re-deployed from scratch. The validator set size will be medium (e.g., no more than 50).

The open beta stage will last until all testnet features are implemented and properly tested.

## Full Testnet 

The full stage of testnet starts when the open beta stage exits with all testnet features properly tested, which is the current stage.

During this stage, testnet backend and frontend are exepcted to receive on-demand updates. Branching instead of re-deployment will be preferred when solving chain divergence. The validator set size will be large (e.g., no more than 100).

## Incentivized Testnet & Validator Competition Program (**CURRENT STAGE**)

The Incentivized Testnet will consist of various kinds of smart contracts, governance, and certification transactions. Anyone can participate to earn the rewards.

Moreover, it will run parallel with the validator program "Raise the Stakes" for some time from September 7th. The Validator Program will consist of many different tasks for the node runners to earn rewards.

# How to Participate

`Certik Chain` is a project of the [CertiK Foundation](https://certik.foundation/).

The [CertiK Chain Explorer](https://explorer.certik.foundation/) is public accessible and can be used to query on various status of the chain on the web.

The [DeepWallet](https://wallet.certik.foundation/) is public accessible and can be used to manage chain accounts, including CTK storage, staking, transfer, and voting, as well as smart contracts deploy and invocation.

The [Certik Chain User Forum](https://forum.certik.foundation/categories) is a public forum for chain announcements and discussions.

For non-public chain questions and discussions, please email to chain@certik.org

Chain transactions as well as chain account creation can also be performed via the CLI tool or CLI-based RESTful servers.

## Latest Release Download

The latest chain node binary and CLI tool binary, as well as genesis and sample smart contract files, can be downloaded from https://github.com/certikfoundation/chain/releases/.

## Use CLI Tool to Access Testnet

### CLI Tool Configuration

With `certikcli` one can create test account key pairs and interact with the testnet. Its configuration needs to be properly set as the following.

```
rm -rf ~/.certikcli
certikcli config chain-id <chain-id>
certikcli config node tcp://<full node>:<port>
certikcli config trust-node true
```

`certikcli` runs on Linux, Windows, and MacOS.

### Create Test Accounts

Make sure you have configured the CLI tool properly as described in the above section.

To use the `CertiK Chain` and do transactions on the chain, one need to first create a chain account and then populate it with test tokens.

First, create an account address and public / private key pair on your computer. In interactions with the chain, public address and key are used frequently. The private key is stored in your local computer and is needed to sign your transaction before submitting.

```
$ certikcli keys add <account name>
Enter a passphrase to encrypt your key to disk:
Repeat the passphrase:

NAME:           TYPE:   ADDRESS:            PUBKEY:
<account name>  local   <account address>   <account public key>

**Important** write this mnemonic phrase in a safe place.
It is the only way to recover your account if you ever forget your password.
...
```

Then, go to http://explorer.certik.foundation/faucet, submit your test account's address. The account will receive some amount of CTK for testing purpose. Please do not abuse the faucet as there are only limited number of tokens available for testnet.

You can create multiple accounts for testing purpose.

Please note that the testnet may be restarted occasionally, so you may need to re-create account / re-apply for test tokens on each testnet restart.

## Run A Full Node

It is possible to run your own full nodes and connect the CLI tool to them. In the next section you will be shown how to convert your full nodes into validator nodes.

With `certikd` one can run full nodes of the `CertiK Chain`. Its configuration needs to be properly initialized.

```
rm -rf ~/.certikd
certikd init <node name>
```

The full node needs to connect some existing nodes of the chain, which can be obtained from the mailing list. Open the node configuration file to edit them.

```
vi ~/.certikd/config/config.toml
```

Edit the following lines.

```
...
seeds = "f4678480e4b7f1daee8ff47e6265954f8b57291d@54.234.180.96:26656,f6764b2a92ad718ece49736f521cadab6bfad762@34.229.19.214:26656,be9db97f250a6aeca95b50ef61453cb8d08604e6@34.201.163.218:26656,60a4d4310878ee664cb2ed4d74f79d3940df595a@3.92.81.28:26656"
...
```

Then copy the testnet genesis JSON file to the node configuration directory. The latest genesis file can be found [here](https://github.com/certikfoundation/chain/blob/master/genesis.json). Release-specific genesis file can be found in the [release download](https://github.com/certikfoundation/chain/releases/).

```
cp genesis.json ~/.certikd/config
```

Start the full node. Note that it might take a while for the new full node to catch up on the chain history.

```
certikd start
```

To connect to the full node from CLI tool running on the same machine, use `tcp://localhost:26657`.

## Convert a Full Node into Validator

As `CertiK Chain` is designed with focus on ultimate blockchain security, one of the security requirements is that all validator nodes must be **certified** by either `CertiK` or other approved **certifiers**. The actual range of validator node ceritification is not fully defined for testnet, but in general `CertiK Chain` validator nodes are expected to be powerful with good connectivity, use latest official chain node software releases, and eventually run on secure systems software such as `CertiKOS` (this is unavailable during closed alpha).

A validator node is assigned to a chain account, which should be created and charged with CTK following the `Create Test Accounts` section above.

Before converting the above full node into a validator, it is required to get the node certified by `CertiK`, the only approved certifier at this moment. The is done by the following steps.

First, run the following on on your node instance.

```
certikd tendermint show-validator
```

Then send the pubkey to chain@certik.org with title "request to certify validator node" and optionally your reasoning on why this node should be approved to become a validator node (typically in terms of capacity, connectivity, maintenance, and security).

Within 24 hours, CertiK will get back to you with either "certified" or "rejected" message.

Once receiving the "certified" message, you can proceed to convert your full node to become a validator node by following the instruction below.

```
certikcli tx staking create-validator \
  --amount=<amount of uctk to delegate to the validator>uctk \
  --pubkey=$(certikd tendermint show-validator) \
  --moniker=<name of the validator, which can be diffferent from account name> \
  --commission-rate="0.10" \
  --commission-max-rate="0.20" \
  --commission-max-change-rate="0.01" \
  --min-self-delegation="1" \
  --gas="auto" \
  --gas-adjustment=1.5 \
  --fees=6000uctk \
  --from=<validator chain account name>
```

If the transaction is successful, your validator should appear in either the `Active` or `Inactive` tabs on the [chain explorer's validators page](https://explorer.certik.foundation/validators).

### 

### Queries

`certikcli` supports many query sub-commands. Below are some common examples. More details can be found in the command help printout.

To query the current validator set

```
certikcli query staking validators
```

To query a block

```
certikcli query block <height>
```

To query a transaction

```
certikcli query tx <transaction hash>
```

To query the status of an account

```
certikcli query account <address>
```

### Transactions

`certikcli` also supports many transaction subcommands. Below are some common examples. More details can be found in the command help printout.

To transfer CTK from one account to another.

```
certikcli tx send <sender address> <recipent address> <amount of uctk> --fees 5000uctk
```

For validators, you can unjail yourself by making an unjail transaction if you are jailed.

```
certikcli tx slashing unjail --from <validator operator name> --fees=5000uctk
```

### CVM Smart Contracts

`CertiK VM`, or CVM, is a core component of the `CertiK Chain`. CVM is compatible with EVM with security-focused extensions. Smart Contracts written in Solidity can be deployed and invoked on the CertiK Chain.

`certikcli` assumes Solidity compiler `solc` is in the path. See [here](https://solidity.readthedocs.io/en/latest/installing-solidity.html) for installation instructions.

To deploy a simple smart contract from file `simple.sol'

```
$ cat simple.sol
pragma solidity >=0.4.0 <0.7.0;

contract SimpleStorage {
    uint storedData;

    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }
}

$ certikcli  tx cvm deploy simple.sol --from <deployer address> --fees 5000uctk
...
txhash: <transaction hash>
...
```
To get the deployed contract address

```
$ certikcli query tx <transaction hash>
...
    - key: new-contract-address
      value: <deployed contract address>
...
```

To inspect contract code bytes deployed

```
certikcli query cvm code <contract address>
6080604052348015600F57600080FD5B506004361060325760003560E01C806360FE47B114603757
80636D4CE63C146062575B600080FD5B606060048036036020811015604B57600080FD5B81019080
80359060200190929190505050607E565B005B60686088565B604051808281526020019150506040
5180910390F35B8060008190555050565B6000805490509056FEA265627A7A723058205FEC64D09C
278453AB74A855DCC214EA05BF9541E35E851AF41570397593055564736F6C63430005090032
```

To call SimpleStorage.set(123)

```
certikcli tx cvm call <contract address> set 123 --from <caller address> --fees 5000uctk
```

To call SimpleStorage.get()

```
$ certikcli tx cvm call <contract address> get --from <caller address> --fees 5000uctk
...
txhash: <transaction hash>
...
```

To verify the read out data is indeed 123 (0x7b)

```
certikcli query tx <transaction hash>
...
data: 000000000000000000000000000000000000000000000000000000000000007B
...
```

## Use RESTful Endpoints to Access Testnet

To start a local RESTful server connected to the full node connected above

```
certikcli rest-server
```

you can look through the swagger documents through `localhost:1317/swagger/` while the `certikcli rest-server` is running.

For example, to query the current validators

```
curl -s http://localhost:1317/staking/validators
```
