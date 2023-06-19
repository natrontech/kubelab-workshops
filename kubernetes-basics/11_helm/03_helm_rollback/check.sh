#!/bin/bash

helm_status=`helm ls dokuwiki -o json | jq -r '.[0].status'`

# check if helm release is deployed
if [ "$helm_status" == "deployed" ]; then
  echo "Helm release is deployed."
  exit 0
else
  echo "Helm release is not successful deployed."
  exit 1
fi