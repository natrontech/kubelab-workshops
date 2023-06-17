#!/bin/bash

# Setup cluster
kubectl delete namespace database
kubectl create namespace database
exit 0
