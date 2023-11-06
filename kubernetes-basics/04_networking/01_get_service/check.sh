#!/bin/bash

# Check if clusterinfo.txt exists
if [ ! -f ~/exercise/services.txt ]; then
  echo "services.txt does not exist"
  exit 1
fi

count=$(kubectl get services -n dev --no-headers | wc -l)
submitted=$(cat ~/exercise/services.txt)

if [ $count -eq $submitted ]; then
  echo "Cluster has $count services, submitted were $submitted"
  exit 0
else
  echo "Cluster has $count services, submitted were $submitted"
  exit 1
fi
