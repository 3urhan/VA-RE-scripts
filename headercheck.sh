#!/bin/bash

# Simple Security Header Checker

URL=$1

if [ -z "$URL" ]; then
    echo "Usage: ./headercheck.sh <website>"
    exit 1
fi

echo "Checking security headers for $URL"
echo "----------------------------------"

headers=$(curl -s -I $URL)

check_header() {
    if echo "$headers" | grep -iq "$1"; then
        echo "[FOUND] $1"
    else
        echo "[MISSING] $1"
    fi
}

check_header "Content-Security-Policy"
check_header "X-Frame-Options"
check_header "Strict-Transport-Security"
check_header "X-Content-Type-Options"
check_header "Referrer-Policy"