#!/bin/bash

# Setup cluster
kubectl delete namespace updates-dev
kubectl create namespace updates-dev
exit 0
