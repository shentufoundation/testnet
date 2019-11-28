## certikcli keys

Add or view local private keys

### Synopsis

Keys allows you to manage your local keystore for tendermint.

    These keys may be in any format supported by go-crypto and can be
    used by light-clients, full nodes, or any other application that
    needs to sign with a private key.

### Options

```
  -h, --help   help for keys
```

### Options inherited from parent commands

```
      --chain-id string   Chain ID of tendermint node
  -e, --encoding string   Binary encoding (hex|b64|btc) (default "hex")
      --home string       directory for config and data (default "~/.certikcli")
  -o, --output string     Output format (text|json) (default "text")
      --trace             print out full stack trace on errors
```

### SEE ALSO

* [certikcli](certikcli.md)	 - CertiK Client
* [certikcli keys ](certikcli_keys_.md)	 -
* [certikcli keys add](certikcli_keys_add.md)	 - Add an encrypted private key (either newly generated or recovered), encrypt it, and save to disk
* [certikcli keys delete](certikcli_keys_delete.md)	 - Delete the given key
* [certikcli keys export](certikcli_keys_export.md)	 - Export private keys
* [certikcli keys import](certikcli_keys_import.md)	 - Import private keys into the local keybase
* [certikcli keys list](certikcli_keys_list.md)	 - List all keys
* [certikcli keys mnemonic](certikcli_keys_mnemonic.md)	 - Compute the bip39 mnemonic for some input entropy
* [certikcli keys parse](certikcli_keys_parse.md)	 - Parse address from hex to bech32 and vice versa
* [certikcli keys show](certikcli_keys_show.md)	 - Show key info for the given name
* [certikcli keys update](certikcli_keys_update.md)	 - Change the password used to protect private key

