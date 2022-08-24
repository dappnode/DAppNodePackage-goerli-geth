#!/bin/sh

case "$_DAPPNODE_GLOBAL_CONSENSUS_CLIENT" in
"prysm-prater.dnp.dappnode.eth")
  echo "Using prysm-prater.dnp.dappnode.eth"
  JWT_PATH="/security/prysm/jwtsecret.hex"
  ;;
"lighthouse-prater.dnp.dappnode.eth")
  echo "Using lighthouse-prater.dnp.dappnode.eth"
  JWT_PATH="/security/lighthouse/jwtsecret.hex"
  ;;
"teku-prater.dnp.dappnode.eth")
  echo "Using teku-prater.dnp.dappnode.eth"
  JWT_PATH="/security/teku/jwtsecret.hex"
  ;;
"nimbus-prater.dnp.dappnode.eth")
  echo "Using nimbus-prater.dnp.dappnode.eth"
  JWT_PATH="/security/nimbus/jwtsecret.hex"
  ;;
*)
  echo "Using default"
  JWT_PATH="/security/default/jwtsecret.hex"
  ;;
esac

# Print the jwt to the dappmanager
JWT=$(cat $JWT_PATH)
curl -X POST "http://my.dappnode/data-send?key=jwt&data=${JWT}"

exec geth --datadir /goerli --goerli \
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
  --authrpc.jwtsecret ${JWT_PATH} \
  $EXTRA_OPTION
