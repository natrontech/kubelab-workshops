#!/bin/bash

name=`kubectl get pod -n counting-service counter -o jsonpath="{.spec.containers[2].name}"`
mountPath=`kubectl get pod -n counting-service counter -o jsonpath="{.spec.containers[2].volumeMounts[0].mountPath}"`
running=`kubectl get pod -n counting-service counter -o jsonpath="{.status.containerStatuses[2].ready}"`

# check name
if [ "$name" == "count-log-2" ]; then
    echo "Sidecar container exists with the specified name."
else
    echo "Sidecar container does not exist with the specified name."
    exit 1
fi

# check mountPath
if [ "$mountPath" == "/var/log" ]; then
    echo "Sidecar container exists with the specified mountPath."
else
    echo "Sidecar container does not exist with the specified mountPath."
    exit 1
fi

# check if pod is running
if [ "$running" == "true" ]; then
    echo "Pod is running."
    exit 0
else
    echo "Pod is not running."
    exit 1
fi