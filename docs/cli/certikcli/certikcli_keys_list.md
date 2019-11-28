## certikcli keys list

List all keys

### Synopsis

Return a list of all public keys stored by this key manager
along with their associated name and address.

```
certikcli keys list [flags]
```

### Options

```
  -h, --help     help for list
      --indent   Add indent to JSON response
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

* [certikcli keys](certikcli_keys.md)	 - Add or view local private keys

