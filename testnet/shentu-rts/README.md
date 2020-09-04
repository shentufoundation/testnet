# Shentu Raise the Stakes #

This directory is for joining and accumulating the data for shentu Raise the Stakes validator program.

You should find all participants' genesis accounts as well as genesis transactions here.

Note the genesis transactions are named `gentx-PR#.json` under `gentx/`. You can verify the final genesis through copying the genesis transactions to `certikd collect-gentxs --home <certikd home>`, which should update the genesis file to the final version at the config directory (`<certikd home>/config/genesis.json`).