#!/bin/bash

# Setup cluster
kubectl delete namespace management
kubectl create namespace management
exit 0
