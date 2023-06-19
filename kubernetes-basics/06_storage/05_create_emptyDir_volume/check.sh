#!/bin/bash

image=`kubectl get deploy -n dev-team debugger -o jsonpath='{.spec.template.spec.containers[0].image}'`
volume=`kubectl get deploy -n dev-team debugger -o jsonpath='{.spec.template.spec.volumes[0].emptyDir}'`
mountPath=`kubectl get deploy -n dev-team debugger -o jsonpath='{.spec.template.spec.containers[0].volumeMounts[0].mountPath}'`

# check image of deployment
if [ "$image" == "alpine:3.18" ]; then
    echo "Deployment exists with the specified image."
else
    echo "Deployment does not exist with the specified image."
    exit 1
fi

# check volume of deployment
if [ "$volume" == "{}" ]; then
    echo "Deployment exists with the specified volume."
else
    echo "Deployment does not exist with the specified volume."
    exit 1
fi

# check mountPath of deployment
if [ "$mountPath" == "/data" ]; then
    echo "Deployment exists with the specified mountPath."
else
    echo "Deployment does not exist with the specified mountPath."
    exit 1
fi

exit 0