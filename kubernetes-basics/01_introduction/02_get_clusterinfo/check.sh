#!/bin/bash

# Check if the amount of kubernetes nodes is equal to the number in clusterinfo.txt
# If it is, exitcode 0, else exitcode 1

count=$(kubectl get nodes --no-headers | wc -l)

# Check if clusterinfo.txt exists
if [ ! -f ~/clusterinfo.txt ]; then
  echo "clusterinfo.txt does not exist"
  exit 1
fi

submitted=$(cat ~/clusterinfo.txt)

if [ $count -eq $submitted ]; then
  echo "Cluster has $count nodes, submitted were $submitted"
  exit 0
else
  echo "Cluster has $count nodes, submitted were $submitted"
  exit 1
fi
