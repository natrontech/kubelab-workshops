#!/bin/bash

# Check if the pod exists with the specified name and image

namespace="time"

pod_name=`kubectl get pod clock -n $namespace -o jsonpath='{.metadata.name}'`
image_name=`kubectl get pod clock -n $namespace -o jsonpath='{.spec.containers[0].image}'`
cap_add=`kubectl get pod clock -n $namespace -o jsonpath='{.spec.containers[0].securityContext.capabilities.add}'`


if [ "$pod_name" != "clock" ]; then
    echo "Pod has the wrong name."
    exit 1
fi

if [ "$image_name" != "nginx" ]; then
    echo "Pod has the wrong image."
    exit 1
fi

if [[ "$cap_add" != *"SYS_TIME"* ]]; then
    echo "Wrong capabilities."
    exit 1
fi

echo "Pod and capabilities looks good"
exit 0