#!/bin/bash

client_version=$(helm version --template {{.Version}})

# Check if helm_version.txt exists
if [ ! -f ~/helm_version.txt ]; then
  echo "helm_version.txt does not exist"
  exit 1
fi

# Check submitted version
submitted=$(cat ~/helm_version.txt)

if [ $client_version == $submitted ]; then
  echo "Client has $client_version version, submitted was $submitted"
  exit 0
else
  echo "Client has $client_version version, submitted was $submitted"
  exit 1
fi
