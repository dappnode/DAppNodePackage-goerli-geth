#!/bin/sh

# Check the value of the global env _DAPPNODE_GLOBAL_CONSENSUS_CLIENT
# It can take as possible values:
# - empty string
# - null
# - "prysm-prater.dnp.dappnode.eth"
# - "lighthouse-prater.dnp.dappnode.eth"
# - "teku-prater.dnp.dappnode.eth"
# - "nimbus-prater.dnp.dappnode.eth"

echo $_DAPPNODE_GLOBAL_CONSENSUS_CLIENT

geth --datadir /goerli --goerli \
  --http --http.addr 0.0.0.0 \
  --http.corsdomain "*" \
  --http.vhosts "*" \
  --ws \
  --ws.origins "*" \
  --ws.addr 0.0.0.0 \
  --syncmode ${SYNCMODE:-snap} \
  --port ${P2P_PORT} \
  --metrics \
  --metrics.addr 0.0.0.0 \
  --authrpc.addr 0.0.0.0 \
  --authrpc.port 8551 \
  --authrpc.vhosts "*" \
  --authrpc.jwtsecret "/jwtsecret" \
  $EXTRA_OPTION
