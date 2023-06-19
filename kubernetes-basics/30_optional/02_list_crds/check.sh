#!/bin/bash

crd_count=`kubectl get crds --no-headers | wc -l`

# Check if crd_count.txt exists
if [ ! -f ~/crd_count.txt ]; then
  echo "crd_count.txt does not exist"
  exit 1
fi

# Check submitted version
submitted=$(cat ~/crd_count.txt)

if [ $crd_count == $submitted ]; then
  echo "CRD count is $crd_count, submitted was $submitted"
  exit 0
else
  echo "CRD count is $crd_count, submitted was $submitted"
  exit 1
fi
