#!/bin/bash

# Setup cluster
kubectl delete namespace development
kubectl create namespace development
exit 0
