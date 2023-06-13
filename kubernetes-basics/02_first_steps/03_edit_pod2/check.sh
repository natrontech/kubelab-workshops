#!/bin/bash

# Check if the pod exists with the specified name and image

kubectl get pods -n facebook --selector=facebooktype=frontend-app-data,asasdjjoplias098djnasd=opijasd-0921okjalkjjasd,lkjasopjidj89oijasd=opjiasd0892onjasd --field-selector=status.phase=Running --output=json | jq -e '.items[] | select(.metadata.name=="frontend" and .spec.containers[].image=="nginx" and .spec.containers[].name=="frontend-p1")'> /dev/null

if [ $? -eq 0 ]; then
    echo "Pod exists with the specified label."
    exit 0
else
    echo "Pod does not exist with the specified label."
    exit 1
fi

