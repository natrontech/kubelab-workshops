#!/bin/bash

# Check if the kubectl version equal to the number in kubectl_client_version.txt
# If it is, exitcode 0, else exitcode 1

client_version=$(kubectl version | awk '/Client Version: / { print $NF }')

# Check if kubectl_client_version.txt exists
if [ ! -f ~/kubectl_client_version.txt ]; then
  echo "kubectl_client_version.txt does not exist"
  exit 1
fi

# Check submitted version
submitted=$(cat ~/kubectl_client_version.txt)

if [ $client_version == $submitted ]; then
  echo "Client has $client_version version, submitted was $submitted"
  exit 0
else
  echo "Client has $client_version version, submitted was $submitted"
  exit 1
fi
