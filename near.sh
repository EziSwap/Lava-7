#!/bin/bash

RPC_URL="https://near.lava.build/lava-referer-973258f7-14d6-4165-9cef-0de2d69c9455/"

OUTPUT_DIR="logs"

UA=$(shuf -n 1 ua.txt)

axelar_data=$(curl -A UA -x http://104.239.10.201:5872 --proxy-user tihhlvxl:qatvzutcsmo4 -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","id":"1","method":"status"}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi

    echo "$axelar_data" >> "$OUTPUT_DIR/axelar.txt"

    echo "Axelar data fetched and saved to $OUTPUT_DIR/axelar.txt."
else
    echo "Failed to fetch Axelar data."
fi
