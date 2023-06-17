#!/bin/bash

# Check if the pod exists with the specified name and image

name=`kubectl get sa helpdesk -n management -o jsonpath='{.metadata.name}'`

if [ "$name" != "helpdesk" ]; then
    echo "Serviceaccount has the wrong name."
    exit 1
fi

echo "Serviceaccount looks good"
exit 0