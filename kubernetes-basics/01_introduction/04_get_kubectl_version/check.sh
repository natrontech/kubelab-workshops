#!/bin/bash

# Check if the amount of kubernetes nodes is equal to the number in clusterinfo.txt
# If it is, exitcode 0, else exitcode 1

client_version=$(kubectl version  --short | awk '/Client Version: / { print $NF }')

# Check if clusterinfo.txt exists
if [ ! -f kubectl_client_version.txt ]; then
  echo "kubectl_client_version.txt does not exist"
  exit 1
fi

submitted=$(cat kubectl_client_version.txt)

if [ $client_version == $submitted ]; then
  echo "Client has $client_version version, submitted was $submitted"
  exit 0
else
  echo "Client has $client_version version, submitted was $submitted"
  exit 1
fi
