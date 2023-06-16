#!/bin/bash

# Check if the hello namespace doenst exist and exitcode 1 if it does

kubectl get namespace hello
if [ $? -eq 0 ]; then
  echo "Namespace hello exists"
  exit 1
else
  echo "Namespace hello does not exist"
  exit 0
fi
