#!/bin/bash

# Check if the amount of kubernetes nodes is equal to the number in clusterinfo.txt
# If it is, exitcode 0, else exitcode 1

podimage="redis"

# Check if clusterinfo.txt exists
if [ ! -f pod_image.txt ]; then
  echo "pod_image.txt does not exist"
  exit 1
fi

submitted=$(cat pod_image.txt)

if [ $podimage == $submitted ]; then
  echo "Pod is $podimage , submitted was $submitted"
  exit 0
else
  echo "Pod is $podimage , submitted was $submitted"
  exit 1
fi
