#!/bin/bash

# Setup cluster
kubectl delete namespace web-services
kubectl create namespace web-services
exit 0
