## certikcli query txs

Query for paginated transactions that match a set of tags

### Synopsis

Search for transactions that match the exact given tags where results are paginated.

Example:
$ <appcli> query txs --tags '<tag1>:<value1>&<tag2>:<value2>' --page 1 --limit 30

```
certikcli query txs [flags]
```

### Options

```
  -h, --help           help for txs
      --limit uint32   Query number of transactions results per page returned (default 30)
  -n, --node string    Node to connect to (default "tcp://localhost:26657")
      --page uint32    Query a specific page of paginated results (default 1)
      --tags string    tag:value list of tags that must match
      --trust-node     Trust connected full node (don't verify proofs for responses)
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

* [certikcli query](certikcli_query.md)	 - Querying subcommands

