#!/bin/bash

# Check if the number of pods with label "important=true" is equal to the number in important_pods.txt
# If it is, exitcode 0, else exitcode 1

count=$(kubectl get pods -n chaos --selector=important=true --no-headers | wc -l)

# Check if clusterinfo.txt exists
if [ ! -f ~/exercise/important_pods.txt ]; then
  echo "important_pods.txt does not exist"
  exit 1
fi

submitted=$(cat ~/exercise/important_pods.txt)

if [ $count -eq $submitted ]; then
  echo "Cluster has $count pods, submitted were $submitted"
  exit 0
else
  echo "Cluster has $count pods, submitted were $submitted"
  exit 1
fi
