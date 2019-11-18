# How to Participate

The [CertiK Chain Explorer](https://explorer.certik.foundation/) is public accessible and can be used to query on various status of the chain on the web.

To do transactions on the chain, all alpha testers need to apply via the [CertiK Foundation website](https://certik.foundation/).

Currently, chain transactions as well as chain account creation can only be performed via the **CLI tool** or **CLI-based RESTful** server. In the near future web wallet will be supported to allow using the chain without the CLI tool.

The latest chain node binary and CLI tool binary can be downloaded from https://github.com/certikfoundation/chain/releases/.

## Run A Full Node

During the closed alpha stage, full node addresses for the CLI tool to connect to can be obtained from the mailing list. It is also possible to run your own full nodes and connect the CLI tool to them. In next section you will be shown how to convert your full nodes into validator nodes.

With `certikd` one can run full nodes of the CertiK Chain. Its configuration needs to be properly initialized.

```bash
certikd init
```

```json
Saved genesis to /home/ubuntu/.certikd/config/genesis.json{
  "moniker": "CTK-Validator",
  "chain_id": "test-chain-2PTdES",
  "node_id": "cc5a0cc12a1afe945bdc9aa2a6ac16f96fb15e1a",
  "gentxs_dir": "",
  "app_message": {
    "accounts": null,
    "auth": {
      "collected_fees": [],
      "params": {
        "max_memo_characters": "256",
        "tx_sig_limit": "7",
        "tx_size_cost_per_byte": "10",
        "sig_verify_cost_ed25519": "590",
        "sig_verify_cost_secp256k1": "1000"
      }
    },
    "bank": {
      "send_enabled": true
    },
    "staking": {
      "pool": {
        "not_bonded_tokens": "0",
        "bonded_tokens": "0"
      },
      "params": {
        "unbonding_time": "259200000000000",
        "max_validators": 100,
        "max_entries": 7,
        "bond_denom": "uckt"
      },
      "last_total_power": "0",
      "last_validator_powers": null,
      "validators": null,
      "delegations": null,
      "unbonding_delegations": null,
      "redelegations": null,
      "exported": false
    },
    "distr": {
      "fee_pool": {
        "community_pool": []
      },
      "community_tax": "0.020000000000000000",
      "base_proposer_reward": "0.010000000000000000",
      "bonus_proposer_reward": "0.040000000000000000",
      "withdraw_addr_enabled": true,
      "delegator_withdraw_infos": [],
      "previous_proposer": "",
      "outstanding_rewards": [],
      "validator_accumulated_commissions": [],
      "validator_historical_rewards": [],
      "validator_current_rewards": [],
      "delegator_starting_infos": [],
      "validator_slash_events": []
    },
    "slashing": {
      "params": {
        "max_evidence_age": "120000000000",
        "signed_blocks_window": "100",
        "min_signed_per_window": "0.500000000000000000",
        "downtime_jail_duration": "600000000000",
        "slash_fraction_double_sign": "0.050000000000000000",
        "slash_fraction_downtime": "0.010000000000000000"
      },
      "signing_infos": {},
      "missed_blocks": {}
    },
    "gentxs": null
  }
}
```

Modify the ~/.certikd/config/config.toml adding following field:
```bash

# Update the moniker fields
sed "s/moniker = .*$/moniker = \"<YOUR-CUSTOM-NAME>\"/" ~/.certikd/config/config.toml

# Update the persistent_peers fields
sed "s/persistent_peers *=.*/persistent_peers = \"9154957b5246d6c913cdd82dade7db8cf194623b@18.236.198.102:26656,ea7baf3d58b698c0d060c6c13a6832b0ecf7d509@34.219.251.115:26656\"/g" ~/.certikd/config/config.toml
```

Then copy the testnet genesis JSOn file to the node configuration directory.

```bash
cp <PATH-TO-Binary>/chain-0.4-alpha/genesis.json ~/.certikd/config
```

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


## Convert a Full Node into Validator (important)

As `CertiK Chain` is designed with focus on ultimate blockchain security, one of the security requirements is that all validator nodes must be **certified** by either `CertiK` or other approved **certifiers**. The actual range of validator node certification is not fully defined during the closed alpha stage, but in general `CertiK Chain` validator nodes are expected to be powerful with good connectivity, use latest official chain node software releases, and eventually run on secure systems software such as `CertiKOS` (this is unavailable during closed alpha).

After creating the full node and completely loading chain history onto it, the current way to get it "certified" to be eligible to for validator purpose is the following.

First, run below commend on your node instance for obtaining the tendermint pubkey.
```
certikd tendermint show-validator
```

Then send the pubkey to `chain@certik.org` with **title "request to certify validator node"** and optionally your reasoning on why this node should be approved to become a validator node (typically in terms of capacity, connectivity, maintenance, and security).

Within 24 hours, CertiK will get back to you with either "certified" or "rejected" message.

Once receiving the "certified" message, you can proceed to convert your full node to become a validator node following the instruction on https://certikfoundation.github.io.


!!! warning "Notes"
  It is important to note that the current certification process and requirement is likely very different from the future validator node certification. So being certified today does not guarantee the same node will be certified for future versions of testnet and mainnet.
