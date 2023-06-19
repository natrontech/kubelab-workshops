#!/bin/bash


# Setup cluster
kubectl delete namespace purple
kubectl create namespace purple

kubectl create secret generic web-server-secrets --from-literal=background=red --from-literal=title=hello -n purple

exit 0
