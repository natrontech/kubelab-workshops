#!/bin/bash

# Check if the pod exists with the specified name and image

image=`kubectl get jobs update-web -n updates-dev -o jsonpath="{.spec.template.spec.containers[0].image}"`
completions=`kubectl get jobs update-web -n updates-dev -o jsonpath="{.spec.completions}"`
command=`kubectl get jobs update-web -n updates-dev -o jsonpath="{.spec.template.spec.containers[0].command[0]}"`

if [ "$completions" != 1 ]; then
    echo "Job doesnt have the specified number of completions."
    exit 1
fi

if [ "$image" != "busybox" ]; then
    echo "Job does not exist with the specified image."
    exit 1
fi

if [ -z "$command" ]; then
    echo "Job doesnt have a command."
    exit 1
fi

echo "Job looks good"
exit 0