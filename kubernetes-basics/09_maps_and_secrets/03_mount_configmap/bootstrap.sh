#!/bin/bash


# Setup cluster
kubectl delete namespace pink
kubectl create namespace pink

kubectl create configmap web-server-data --from-literal=background=red --from-literal=title=hello -n pink

exit 0
