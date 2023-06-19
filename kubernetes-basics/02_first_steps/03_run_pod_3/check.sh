#!/bin/bash

# Check if the pod exists with the specified name and image

namespace="app3"

pod_name=`kubectl get pod hungry-server -n $namespace -o jsonpath='{.metadata.name}'`
pod_image=`kubectl get pod hungry-server -n $namespace -o jsonpath='{.spec.containers[0].image}'`
pod_resource_limit_memory=`kubectl get pod hungry-server -n $namespace -o jsonpath='{.spec.containers[0].resources.limits.memory}'`
pod_resource_limit_cpu=`kubectl get pod hungry-server -n $namespace -o jsonpath='{.spec.containers[0].resources.limits.cpu}'`


if [ "$pod_name" != "hungry-server" ]; then
    echo "Pod has the wrong name."
    exit 1
fi

if [ "$pod_image" != "nginx" ]; then
    echo "Pod does not exist with the specified image."
    exit 1
fi

if [ "$pod_resource_limit_memory" != "500Mi" ]; then
    echo "Pod does not exist with the specified memory limit."
    exit 1
fi

if [ "$pod_resource_limit_cpu" != "500m" ]; then
    echo "Pod does not exist with the specified cpu limit."
    exit 1
fi

echo "Pod looks good"
exit 0