#!/bin/bash

INTERVAL="${KEEPALIVE_INTERVAL:-300}"

if [[ ! -z "${KEEPALIVE_URL}" ]]; then
    echo "running curl ${KEEPALIVE_URL} every ${INTERVAL} seconds"
    while true; do
        sleep "${INTERVAL}"
        curl --silent --output /dev/null "${KEEPALIVE_URL}"
    done
fi
