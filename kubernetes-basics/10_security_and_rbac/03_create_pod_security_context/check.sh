#!/bin/bash

# Check if the pod exists with the specified name and image

namespace="zoo"

pod_name=`kubectl get pod lion -n $namespace -o jsonpath='{.metadata.name}'`
image_name=`kubectl get pod lion -n $namespace -o jsonpath='{.spec.containers[0].image}'`
uid=`kubectl get pod lion -n $namespace -o jsonpath='{.spec.containers[0].securityContext.runAsUser}'`
uid2=`kubectl get pod lion -n $namespace -o jsonpath='{.spec.securityContext.runAsUser}'`


if [ "$pod_name" != "lion" ]; then
    echo "Pod has the wrong name."
    exit 1
fi

if [ "$image_name" != "nginxinc/nginx-unprivileged" ]; then
    echo "Pod has the wrong image."
    exit 1
fi

if [[ "$uid" != "101" && "$uid2" != "101" ]]; then
    echo "Wrong UID."
    exit 1
fi

echo "Pod and UID looks good"
exit 0