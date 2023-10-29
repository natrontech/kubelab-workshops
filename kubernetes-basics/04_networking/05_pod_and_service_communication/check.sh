#!/bin/bash

# Check if output.txt exists
if [ ! -f ~/output.txt ]; then
    echo "output.txt does not exist."
    exit 1
fi

# get payload from 1234 port of server pod
server_ip=$(kubectl get service server -n exercise -o jsonpath='{.spec.clusterIP}')
expected_output=$(kubectl exec client -n exercise -- wget -qO- $server_ip:1234)
submitted_output=$(cat ~/output.txt)

if [ "$expected_output" == "$submitted_output" ]; then
    echo "Correct output: $expected_output"
    exit 0
else
    echo "Expected output is $expected_output but got $submitted_output"
    exit 1
fi
