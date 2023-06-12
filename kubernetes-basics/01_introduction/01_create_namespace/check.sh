#!/bin/bash

# Check if the introduction namespace exists and exitcode 0 if it does

kubectl get namespace introduction
if [ $? -eq 0 ]; then
  echo "Namespace introduction exists"
  exit 0
else
  echo "Namespace introduction does not exist"
  exit 1
fi
