#!/bin/bash

# Check if the pod exists with the specified name and image


count=`kubectl get deployment -n winter --selector=country=switzerland,state=bern,city=bern -o jsonpath="{.items[0].spec.replicas}"`
image=`kubectl get deployment -n winter --selector=country=switzerland,state=bern,city=bern -o jsonpath="{.items[0].spec.template.spec.containers[0].image}"`
status=`kubectl get deployment -n winter --selector=country=switzerland,state=bern,city=bern -o jsonpath="{.items[0].spec.paused}"`

if [ "$count" -eq 3 ] && [ "$image" == "nginx" ] && [ "$status" != "true" ]; then
    echo "Deployment exists with the specified name, count, and image."
    exit 0
else
    echo "Deployment does not exist with the specified name and image."
    exit 1
fi
