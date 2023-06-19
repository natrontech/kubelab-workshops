#!/bin/bash

# Check if the pod exists with the specified name and image

count=`kubectl get deployment sun -n summer -o jsonpath="{.spec.replicas}"`
image=`kubectl get deployment sun -n summer -o jsonpath="{.spec.template.spec.containers[0].image}"`
revisionHistoryLimit=`kubectl get deployment sun -n summer -o jsonpath="{.spec.revisionHistoryLimit}"`

if [ "$count" != 2 ]; then
    echo "Deployment does not exist with the specified count."
    exit 1
fi

if [ "$image" != "httpd" ]; then
    echo "Deployment does not exist with the specified image."
    exit 1
fi

if [ "$revisionHistoryLimit" != "4" ]; then
    echo "Deployment does not exist with the specified revhistoy."
    exit 1
fi

echo "Looks good"
exit 0
