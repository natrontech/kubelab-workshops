#!/bin/bash

# create the hello namespace if it exists
kubectl create namespace hello
if [ $? -eq 0 ]; then
  echo "Namespace hello created"
  exit 0
else
  echo "Unable to create namespace hello"
  exit 1
fi
