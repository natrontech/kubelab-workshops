#!/bin/bash

# Check if the amount of kubernetes nodes is equal to the number in clusterinfo.txt
# If it is, exitcode 0, else exitcode 1

count=$(kubectl get pods -n chaos --selector=important=true --no-headers | wc -l)

# Check if clusterinfo.txt exists
if [ ! -f ~/important_pods.txt ]; then
  echo "important_pods.txt does not exist"
  exit 1
fi

submitted=$(cat ~/important_pods.txt)

if [ $count -eq $submitted ]; then
  echo "Cluster has $count pods, submitted were $submitted"
  exit 0
else
  echo "Cluster has $count pods, submitted were $submitted"
  exit 1
fi
