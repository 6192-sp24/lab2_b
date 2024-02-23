#!/bin/bash
./test.sh $1
./top_bsv
if arch | grep -q x86_64 && uname -s | grep -q  Linux; then
    echo "detected intel 64bit linux"
    cat output.log | tools/intelx86_64_linux/spike-dasm > multicycle.log
elif arch | grep -q arm64 && uname -s | grep -q  Darwin; then
    echo "detected arm64 mac"
    cat output.log | tools/aarch64_mac/spike-dasm > multicycle.log
else
    echo "unsupported architecture, fallback to unfiltered mode"
    cat output.log | tools/spike-dasm > multicycle.log
fi