#!/bin/bash

# Check if the content ~/flag.txt is K8S-ENIGMA-FLAG-67890
flag=$(cat ~/flag.txt)

if [[ "$flag" != "K8S-ENIGMA-FLAG-67890" ]]; then
    echo "The flag is incorrect. Please try again."
    exit 1
fi

echo "Congratulations! You've completed the Enigma Realm challenge."
