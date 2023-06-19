#!/bin/bash

# Check if the pod exists with the specified name and image

kubectl get pods -n app2 --field-selector=status.phase=Running --output=json | jq -e '.items[] | select(.metadata.name=="simple-pod" and .spec.containers[].image=="redis")'

if [ $? -eq 0 ]; then
    echo "Pod exists with the specified name and image."
    exit 0
else
    echo "Pod does not exist with the specified name and image."
    exit 1
fi

