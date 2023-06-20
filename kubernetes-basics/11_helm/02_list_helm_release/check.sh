#!/bin/bash

helm_values=`helm ls --no-headers -n podinfo  -o json | jq -r '.[0].name + "," + .[0].namespace + "," + .[0].revision + "," + .[0].chart + "," + .[0].app_version'`

# check if file helm_release.txt exists
if [ ! -f ~/helm_release.txt ]; then
  echo "File helm_release.txt does not exist"
  exit 1
fi

submitted=$(cat ~/helm_release.txt)

# check if file helm_release.txt is equal to $helm_values
if [ $helm_values == $submitted ]; then
  echo "File helm_release.txt exists and is correct"
  exit 0
else
  echo "File helm_release.txt exists but is not equal to $helm_values"
  exit 1
fi
