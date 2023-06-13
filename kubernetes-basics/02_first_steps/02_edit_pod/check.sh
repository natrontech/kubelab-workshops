#!/bin/bash

# Check if the pod exists with the specified name and image

# TODO: fix is successful the no pod exists
kubectl get pod -n shop --selector=security=404 --field-selector=metadata.name=wordpress

if [ $? -eq 0 ]; then
    echo "Pod exists with the specified label."
    exit 0
else
    echo "Pod does not exist with the specified label."
    exit 1
fi

