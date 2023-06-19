#!/bin/bash

# Check if the pod exists with the specified name and image

image=`kubectl get deploy -n myapp myapp -o jsonpath="{.spec.template.spec.initContainers[0].image}"`
name=`kubectl get deploy -n myapp myapp -o jsonpath="{.spec.template.spec.initContainers[0].name}"`
command=`kubectl get deploy -n myapp myapp -o jsonpath="{.spec.template.spec.initContainers[0].command}"`
running=`kubectl get pod -n myapp -o jsonpath="{.items[0].status.containerStatuses[0].ready}"`

# check image
if [ "$image" == "postgres:latest" ]; then
    echo "Init container exists with the specified image."
else
    echo "Init container does not exist with the specified image."
    exit 1
fi

# check name
if [ "$name" == "wait-for-db" ]; then
    echo "Init container exists with the specified name."
else
    echo "Init container does not exist with the specified name."
    exit 1
fi

# check if command "pg_isready" contains
if [[ "$command" == *"pg_isready"* ]]; then
    echo "Init container exists with the specified command."
else
    echo "Init container does not exist with the specified command."
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