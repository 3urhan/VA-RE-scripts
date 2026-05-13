#!/bin/bash

# Simple Port Scanner

TARGET=$1

if [ -z "$TARGET" ]; then
    echo "Usage: ./portscan.sh <IP-or-domain>"
    exit 1
fi

echo "Scanning common ports on $TARGET..."
echo "-----------------------------------"

ports=(21 22 23 25 53 80 110 139 143 443 445 3306 8080)

for port in "${ports[@]}"
do
    nc -z -w1 $TARGET $port 2>/dev/null

    if [ $? -eq 0 ]; then
        echo "[OPEN] Port $port"
    else
        echo "[CLOSED] Port $port"
    fi
done