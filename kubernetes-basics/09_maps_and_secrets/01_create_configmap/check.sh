#!/bin/bash

# Check if the pod exists with the specified name and image

bg=`kubectl get configmaps webserver-data -n blue -o jsonpath='{.data.background}'`
title=`kubectl get configmaps webserver-data -n blue -o jsonpath='{.data.title}'`

if [ "$title" != "hello" ]; then
    echo "Configmap has the wrong title."
    exit 1
fi

if [ "$bg" != "red" ]; then
    echo "Configmap has the wrong background."
    exit 1
fi

echo "Configmap looks good"
exit 0