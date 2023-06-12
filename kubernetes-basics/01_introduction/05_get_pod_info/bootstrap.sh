#!/bin/bash

# delete the pod_image.txt file if it exists
rm -f ~/pod_name.txt
echo "File pod_name.txt deleted"

# Setup cluster
kubectl delete namespace myspace
kubectl create namespace myspace
kubectl run prod-web-1 --image nginx --namespace myspace
exit 0
