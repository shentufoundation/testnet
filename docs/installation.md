# Installation

## Setup Server

- Server environment Ubuntu 18.04

## Installing Go

In this step, you’ll install Go by downloading the go installer, in this tutorial will use the version `go 1.13.3` from the [official Go downloads](https://golang.org/dl/) page.

Before downloading Go, make sure that you are in the home (~) directory:

```bash
cd ~
```

Use curl to retrieve the tarball URL that you copied from the official Go downloads page:

```bash
curl -O https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz
```

Next, extract the downloaded archive and install it to the desired location on the system. It’s considered best practice to keep it under `/usr/local`:

```bash
sudo tar -xzf go1.13.3.linux-amd64.tar.gz -C /usr/local
```

!!! warning "Notes"

    Although **/usr/local/go** is the officially-recommended location, some users may prefer or require different paths.

## Configuration

Prior to Go 1.8, it was required to set a local environment variable called `$GOPATH`. `$GOPATH` told the compiler where to find imported third party source code, as well as any local source code you had written. While it is no longer explicitly required, it is still considered a good practice as many third party tools still depend on this variable being set.

You can set your `$GOPATH` by adding the global variables to your ~/.profile. You may want to add this into .zshrc or .bashrc file as per your shell configuration.

First, open `~/.profile` or `~/.bashrc` with nano or your preferred text editor:
```bash
nano ~/.profile
```

Now you need to setup Go language environment variables for your project. Commonly you need to set 3 environment variables as GOROOT, GOPATH and PATH.

`GOROOT` is the location where Go package is installed on your system.
`GOPATH` is the location of your work directory. For example my project directory is ~/Projects/Proj1 .

Now you can export the setting into the `~/.profile` or `~/.bashrc`
```bash
# export GOPATH
echo "export GOPATH=$HOME/go" >> ~/.bashrc
# set PATH so it includes user's private bin directories
echo "export PATH=\"$PATH:$GOPATH/bin:/usr/local/go/bin\"" >> ~/.bashrc
```

To update your shell, issue the following command to load the global variables:

```bash
. ~/.bashrc
```

You can verify your $PATH is updated by using the echo command and inspecting the output:

```bash
echo $PATH
```

Finally, check your go version:

```bash
go version
```
Also Verify all configured environment variables using following command.

```bash
go env
```

## Binary

The latest chain node binary and CLI tool binary can be downloaded from:

- [v0.4-alpha Latest-Release](https://github.com/certikfoundation/chain/releases/)

!!! warning "Notes"
    `certikd`: The daemon for running a full-node of the certik application.

    `certikcli`: The command-line interface that interacting with the certik full-node.