#!/bin/bash

# delete the pod_image.txt file if it exists
rm -f ~/pod_image.txt
echo "File pod_image.txt deleted"

# Setup cluster
kubectl delete namespace prod-data
kubectl create namespace prod-data
kubectl run myapp53 --image redis --namespace prod-data
exit 0
