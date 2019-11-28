## certikd add-genesis-account

Add genesis account to genesis.json

### Synopsis

Add genesis account to genesis.json

```
certikd add-genesis-account [address_or_key_name] [coin][,[coin]] [flags]
```

### Options

```
  -h, --help                      help for add-genesis-account
      --home-client string        client's home directory (default "~/.certikcli")
      --vesting-amount string     amount of coins for vesting accounts
      --vesting-end-time uint     schedule end time (unix epoch) for vesting accounts
      --vesting-start-time uint   schedule start time (unix epoch) for vesting accounts
```

### Options inherited from parent commands

```
      --home string        directory for config and data (default "~/.certikd")
      --log_level string   Log level (default "main:info,state:info,*:error")
      --trace              print out full stack trace on errors
```

### SEE ALSO

* [certikd](certikd.md)	 - CertiK App Daemon (server)

