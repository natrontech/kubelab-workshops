#!/bin/bash


# Setup cluster
kubectl delete namespace purple
kubectl create namespace purple

kubectl create secret generic web-server-secrets --from-literal=username=alpha-beta --from-literal=password=supersecret55 -n purple

exit 0
