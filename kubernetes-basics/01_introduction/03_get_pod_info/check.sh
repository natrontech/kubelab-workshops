#!/bin/bash

# Check if the amount of kubernetes nodes is equal to the number in clusterinfo.txt
# If it is, exitcode 0, else exitcode 1

podname="prod-web-1"

# Check if clusterinfo.txt exists
if [ ! -f ~/exercise/pod_name.txt ]; then
  echo "pod_name.txt does not exist"
  exit 1
fi

submitted=$(cat ~/exercise/pod_name.txt)

if [ $podname == $submitted ]; then
  echo "Pod is $podname , submitted was $submitted"
  exit 0
else
  echo "Pod is $podname , submitted was $submitted"
  exit 1
fi
