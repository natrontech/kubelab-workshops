#!/bin/bash

# delete the pod_image.txt file if it exists
rm -f ~/exercise/services.txt
echo "File services.txt deleted"

# Setup cluster
kubectl delete namespace dev
kubectl create namespace dev
kubectl create service -n dev clusterip test215 --tcp 80
kubectl create service -n dev clusterip test123 --tcp 80
kubectl create service -n dev clusterip test634 --tcp 80
kubectl create service -n dev clusterip test636 --tcp 80
kubectl create service -n dev clusterip test601 --tcp 80
kubectl create service -n dev clusterip test503 --tcp 80
kubectl create service -n dev clusterip test301 --tcp 80
kubectl create service -n dev clusterip test491 --tcp 80

exit 0
