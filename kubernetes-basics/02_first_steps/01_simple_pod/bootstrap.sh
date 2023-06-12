#!/bin/bash

# create the hello namespace if it exists
kubectl delete namespace hello
if [ $? -eq 0 ]; then
  echo "Namespace hello deleted"
  kubectl create namespace hello
  echo "Namespace hello created"
  exit 0
else
  echo "Unable to delete namespace hello"
  kubectl create namespace hello
  echo "Namespace hello created"
  exit 0
fi
