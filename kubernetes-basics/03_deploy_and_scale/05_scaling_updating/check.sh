#!/bin/bash

# Check if the Deployment exists with the specified image, replicas and applies rollback if needed

count=`kubectl get deployment -n summer --selector=region=sahara,nature=desert -o jsonpath="{.items[0].spec.replicas}"`
image=`kubectl get deployment -n summer --selector=region=sahara,nature=desert -o jsonpath="{.items[0].spec.template.spec.containers[0].image}"`

if [ "$count" -eq 3 ] && [ "$image" == "nginx:1.20" ]; then
    echo "Deployment exists with the specified name, count, and image."
    exit 0
else
    echo "Deployment does not exist with the specified name, count, and image."
    exit 1
fi
