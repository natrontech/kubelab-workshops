#!/bin/bash

# Check if the pod exists with the specified name and image

namespace="sky"

pod_name=`kubectl get pod fly -n $namespace -o jsonpath='{.metadata.name}'`
image=`kubectl get pod fly -n $namespace -o jsonpath='{.spec.containers[0].image}'`
sa_name=`kubectl get pod fly -n $namespace -o jsonpath='{.spec.serviceAccountName}'`

echo $pod_name

if [ "$pod_name" != "fly" ]; then
    echo "Pod has the wrong name."
    exit 1
fi

if [ "$image" != "nginx" ]; then
    echo "Pod has the wrong image."
    exit 1
fi

if [ "$sa_name" != "bird" ]; then
    echo "Serviceaccount has the wrong name."
    exit 1
fi

echo "Pod and SA looks good"
exit 0