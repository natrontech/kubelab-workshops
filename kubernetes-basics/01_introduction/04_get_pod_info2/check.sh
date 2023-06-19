#!/bin/bash

# Check if the pod image is equal to the value in pod_image.txt
# If it is, exitcode 0, else exitcode 1

podimage="redis"

# Check if pod_image.txt exists
if [ ! -f ~/pod_image.txt ]; then
  echo "pod_image.txt does not exist"
  exit 1
fi

submitted=$(cat ~/pod_image.txt)

if [ $podimage == $submitted ]; then
  echo "Pod is $podimage , submitted was $submitted"
  exit 0
else
  echo "Pod is $podimage , submitted was $submitted"
  exit 1
fi
