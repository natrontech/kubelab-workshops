#!/bin/bash

# Setup cluster
kubectl delete namespace shop
kubectl create namespace shop
kubectl run wordpress --image nginx --namespace shop
exit 0
