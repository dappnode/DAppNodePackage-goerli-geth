# Görli testnet DAppnode package

[![DAppNodeStore Available](https://img.shields.io/badge/DAppNodeStore-Available-brightgreen.svg)](http://my.admin.dnp.dappnode.eth/#/installer/goerli-geth.dnp.dappnode.eth)


[![Görli github](https://img.shields.io/badge/Goerli-Github-blue.svg)](https://github.com/goerli/testnet)
[![Görli gitter](https://img.shields.io/badge/Goerli-Gitter-753a88.svg)](https://gitter.im/goerli/testnet )
[![Görli gitter](https://img.shields.io/badge/DAppNode-Github-blue.svg)](https://github.com/dappnode/DAppNode)

Implements the install instructions for the Görli testnet as a DAppNode package

<p align="center"><img src="install.gif?raw=true"/></p>

You can use this package without installing it in your dappnode following these instructions:

## Prerequisites

- git

   Install [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) commandline tool.

- docker

   Install [docker](https://docs.docker.com/engine/installation). The community edition (docker-ce) will work. In Linux make sure you grant permissions to the current user to use docker by adding current user to docker group, `sudo usermod -aG docker $USER`. Once you update the users group, exit from the current terminal and open a new one to make effect.

- docker-compose

   Install [docker-compose](https://docs.docker.com/compose/install)
   
**Note**: Make sure you can run `git`, `docker ps`, `docker-compose` without any issue and without sudo command.


## Buidling

`docker-compose build`

## Running

### Start

`docker-compose up -d`

### View logs

`docker-compose logs -f`

### Stop

`docker-compose down`

## Extra options

You can edit the `docker-compose.yml` and add extra options, such as:
```
 - EXTRA_OPTS=--wsapi "db,eth,net,ssh,miner,web3,personal,admin"
```

## Connect using web3js

If the package is running and you're connected to your dappnode you can use:
```
var Web3 = require('web3');
var web3 = new Web3('ws://my.goerli-geth.dnp.dappnode.eth:8546')
web3.eth.getBlockNumber().then(console.log)
```
In case you are running it locally:
```
var Web3 = require('web3');
var web3 = new Web3('ws://127.0.0.1:8546')
web3.eth.getBlockNumber().then(console.log)
```

## Note

This is early stage software - the testnet is not operational yet
