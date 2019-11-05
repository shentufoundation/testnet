[Create Test Account](#create-test-accounts)

# CertiK Chain Testnet

This repository hosts the `CertiK Chain` implementation and testnet information. More documents and details will be released here over the progress of testnet.

`CertiK Chain` is the key component in CertiK's vision of building end-to-end secure and trustworthy infrastructure for the blockchain world. Here is a brief [introduction](https://medium.com/certik/introducing-the-certik-chain-26629248da3c) to the chain.

The first version of `CertiK Chain` is the testnet, which will go through three stages: closed alpha, open beta, and full testnet. The overall goal of testnet is to define and implement a majority of the `CertiK Chain` features and build a strong `CertiK Chain` developer and user community by providing opportunities to contribute to the chain design and development, to evaluate the chain's main features, and to develop smart contracts and other usage scenarios around the chain.

As testnet moves through its various stages, CertiK Foundation expects to provide ample opportunities for active members of the community to be rewarded for their contributions.

## Timeline

* Closed Alpha 1.0 (July 22 2019)
* Closed Alpha 2.0 (November 04 2019)
* Open Beta 3.0 (To be announced)
* ...
* Full Testnet (To be announced)

## Closed Alpha (**CURRENT STAGE**)

The very first stage of testnet is the closed alpha stage, which is the current stage. At the begining of this stage, most chain features are either not fully tested, partially implemented, or even unimplemented. Hence for this stage we talk about "what (mostly) works" rather than "what does not work".

During this stage, testnet backend and frontend are expected to receive a lot of updates, often causing the chain to be re-deployed from scratch. The validator set size will be small (e.g., no more than 20).

The closed alpha stage will last until most testnet features are implemented and alpha-tested.

## Open Beta

The second stage of testnet is the open beta stage. It starts when the closed alpha stage exits with most testnet features implemented and alpha-tested. For this stage we switch to talk about "what is missing" instead of "what works".

During this stage, testnet backend and frontend are expected to receive constant updates, occasionally causing the chain to be re-deployed from scratch. The validator set size will be medium (e.g., no more than 50).

The open beta stage will last until all testnet features are implemented and properly tested.

## Full Testnet

The final full stage of testnet starts when the open beta stage exits with all testnet features properly tested.

During this stage, testnet backend and frontend are exepcted to receive on-demand updates. Branching instead of re-deployment will be preferred when solving chain divergence. The validator set size will be large (e.g., no more than 100).

# How to Participate

The [CertiK Chain Explorer](https://explorer.certik.foundation/) is public accessible and can be used to query on various status of the chain on the web.

To do transactions on the chain, all alpha testers need to apply via the [CertiK Foundation website](https://certik.foundation/).

Currently, chain transactions as well as chain account creation can only be performed via the CLI tool or CLI-based RESTful server. In the near future web wallet will be supported to allow using the chain without the CLI tool.

The latest chain node binary and CLI tool binary can be downloaded from https://github.com/certikfoundation/chain/releases/.

## Run A Full Node

During the closed alpha stage, full node addresses for the CLI tool to connect to can be obtained from the mailing list. It is also possible to run your own full nodes and connect the CLI tool to them. In next section you will be shown how to convert your full nodes into validator nodes.

With `certikd` one can run full nodes of the `CertiK Chain`. Its configuration needs to be properly initialized.

```
rm -rf ~/.certikd
certikd init
```

You might want to customize your full node's name. Also, the full node needs to connect some existing nodes of the chain, which can be obtained from the mailing list. Open the node configuration file to edit them.

```
vi ~/.certikd/config/config.toml
```

Edit the following lines.

```
moniker = <node name>
...
persistent_peers = <persistent node address>
```

Then copy the testnet genesis JSON file to the node configuration directory.

```
cp genesis.json ~/.certikd/config
```

Start the full node. Note that it might take a while for the new full node to catch up on the chain history.

```
certikd start
```

To connect to the full node from CLI tool running on the same machine, use `tcp://localhost:26657`.

## Convert a Full Node into Validator

As `CertiK Chain` is designed with focus on ultimate blockchain security, one of the security requirements is that all validator nodes must be **certified** by either `CertiK` or other approved **certifiers**. The actual range of validator node ceritification is not fully defined during the closed alpha stage, but in general `CertiK Chain` validator nodes are expected to be powerful with good connectivity, use latest official chain node software releases, and eventually run on secure systems software such as `CertiKOS` (this is unavailable during closed alpha).

So the first step to convert the above full node into a validator is to get the node certified by `CertiK`, the only approved certifier at this moment. See the mailing list for instructions on how to get the certification.

A validator node is assigned to a chain account, which should be created and charged with CKT and CKG tokens following the `Create Test Accounts` section below.

A certified full node can then be used to create a validator via the `create-validator` transaction. Below is an example.

```
certikcli tx staking create-validator \
  --amount=<amount of uckt to delegate to the validator>uckt \
  --pubkey=$(certikd tendermint show-validator) \
  --moniker=<name of the validator, which can be diffferent from account name> \
  --commission-rate="0.10" \
  --commission-max-rate="0.20" \
  --commission-max-change-rate="0.01" \
  --min-self-delegation="1" \
  --gas="auto" \
  --gas-adjustment=1.5 \
  --fees=5000uckg \
  --from=<validator chain account name>
```

If the transaction is successful, your validator should appear in either the `Active` or `Inactive` tabs on the [chain explorer's validators page](https://explorer.certik.foundation/validators).

### 

## Use CLI Tool to Access Testnet

### CLI Tool Configuration

With `certikcli` one can create test account key pairs and interact with the testnet. Its configuration needs to be properly set as the following.

```
rm -rf ~/.certikcli
certikcli config chain-id shentu
certikcli config node tcp://<full node>:<port>
```

Use either full nodes from the mailing list or your own full nodes created as above.

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

Then, go to http://explorer.certik.foundation/faucet, submit your test account's address. The account will receive some amount of CKT and CKG tokens for testing purpose. Please do not abuse the faucet as there are only limited number of tokens available for testnet.

You can create multiple accounts for testing purpose.

Please note that the testnet can be restarted often during the alpha testing stage, so you may need to re-create account / re-apply for test tokens on each testnet restart.

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

To query the CKT balance of an account

```
certikcli query ckt balance <address>
```

To query the CKG balance of an account

```
certikcli query ckg balance <address>
```

### Transactions

`certikcli` also supports many transaction subcommands. Below are some common examples. More details can be found in the command help printout.

To transfer CKT from one account to another.

```
certikcli tx ckt transfer <amount of uckt> <recipent address> --from <sender_address> --fees 5000uckg
```

To transfer CKG from one account to another.

```
certikcli tx ckg transfer <amount of uckg> <recipent address> --from <sender_address> --fees 5000uckg
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

$ certikcli tx cvm deploy 1000000 simple.sol --from <deployer address> --fees 5000uckg
Response:
  TxHash: <transaction hash>
```
To get the deployed contract address

```
$ certikcli query tx
Response:
  Height: ...
  TxHash: <transaction hash>
  Data: ...
  Raw Log: [{"msg_index":"0","success":true,"log":"<contract address>"}]
  Logs: [{"msg_index":0,"success":true,"log":"<contract address>"}]
  GasWanted: ...
  GasUsed: ...
  Tags:
    - action = deploy
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
certikcli tx cvm call <contract address> 1000000 set 123 --from <caller address> --fees 5000uckg
```

To call SimpleStorage.get()

```
$ certikcli tx cvm call <contract address> 1000000 get --from <caller address> --fees 5000uckg
Response:
  TxHash: <transaction hash>
```

To verify the read out data is indeed 123 (0x7b)

```
certikcli query tx <transaction hash>
Response:
  Height: ...
  TxHash: <transaction hash>
  Data: 000000000000000000000000000000000000000000000000000000000000007B
  Raw Log: [{"msg_index":"0","success":true,"log":""}]
  Logs: [{"msg_index":0,"success":true,"log":""}]
  GasWanted: ...
  GasUsed: ...
  Tags:
    - action = call
```

Currently, CVM has the following known limitations.

* No `CertiK Chain` specific features have been enabled.
* Smart contract execution gas model has not been implemented.
* Event has not been implemented.
* Only a single smart contract from a single Solidity file can be deployed at a time from CLI. (Compiled smart contract from multiple files can be deployed via RESTful endpoints in the near future).

## Use RESTful Endpoints to Access Testnet

To start a local RESTful server connected to the full node connected above

```
certikcli rest-server
```

For example, to query the current validators

```
curl -s http://localhost:1317/staking/validators
```

Here are some query endpoints.

```
/blocks/latest
/blocks/{height}
/ckg/balance/{address}
/ckg/issuance/{adress}
/ckt/balance/{address}
/ckt/issuance/{adress}
/cvm/abi/{address}
/cvm/code/{address}
/cvm/storage/{address}/{key}
/node_info
/node_version
/staking/validators
/txs
/txs/{hash}
/validatorsets/latest
/validatorsets/{height}
/version
```
