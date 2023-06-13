#!/bin/bash

# Check if the pod exists with the specified name and image

u=`kubectl get secrets db-config -n orange -o jsonpath='{.data.USERNAME}' | base64 -d`
p=`kubectl get secrets db-config -n orange -o jsonpath='{.data.PASSWORD}' | base64 -d`

if [ "$u" != "admin" ]; then
    echo "USERNAME is wrong."
    exit 1
fi

if [ "$p" != "supersafe" ]; then
    echo "PASSWORD is wrong."
    exit 1
fi

echo "Secret looks good"
exit 0