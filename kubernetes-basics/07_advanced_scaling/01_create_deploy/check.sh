#!/bin/bash

# Check if the pod exists with the specified name and image

count=`kubectl get deployment appdata -n world -o jsonpath="{.spec.replicas}"`
image=`kubectl get deployment appdata -n world -o jsonpath="{.spec.template.spec.containers[0].image}"`
strategy=`kubectl get deployment appdata -n world -o jsonpath="{.spec.strategy.type}"`

if [ "$count" != 2 ]; then
    echo "Deployment does not have 2 replicas."
    exit 1
fi

if [ "$image" != "httpd" ]; then
    echo "Deployment does not exist with the specified name and image."
    exit 1
fi

if [ "$strategy" != "Recreate" ]; then
    echo "Deployment strategy is not OnDelete."
    exit 1
fi

echo "Looks good"
exit 0