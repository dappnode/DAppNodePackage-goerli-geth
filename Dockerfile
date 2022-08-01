ARG UPSTREAM_VERSION

FROM ethereum/client-go:${UPSTREAM_VERSION}

COPY jwtsecret.hex /jwtsecret

ENTRYPOINT geth --datadir /goerli \ 
    --goerli \
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