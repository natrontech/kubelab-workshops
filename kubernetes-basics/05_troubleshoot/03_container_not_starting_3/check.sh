#!/bin/bash

name="mapper"
namespace="test2"

pod_name=`kubectl get pod $name -n $namespace -o jsonpath='{.metadata.name}'`
pod_memory_limit=`kubectl get pod $name -n $namespace -o jsonpath='{.spec.containers[].resources.limits.memory}'`

if [ "$pod_name" != "mapper" ]; then
    echo "Pod has the wrong name."
    exit 1
fi

if [ "$pod_memory_limit" != "400Mi" ]; then
    echo "Pod has the wrong memory limit."
    exit 1
fi


echo "Pod looks good"
exit 0