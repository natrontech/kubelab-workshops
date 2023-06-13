#!/bin/bash

# Check if the pod exists with the specified name and image

count=`kubectl get deployment continents -n earth -o jsonpath="{.spec.replicas}"`
image=`kubectl get deployment continents -n earth -o jsonpath="{.spec.template.spec.containers[0].image}"`

if [ "$count" -eq 7 ] && [ "$image" == "redis" ]; then
    echo "Deployment exists with the specified name, count, and image."
    exit 0
else
    echo "Deployment does not exist with the specified name and image."
    exit 1
fi
