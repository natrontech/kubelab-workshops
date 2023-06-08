#!/bin/bash

# delete the introduction namespace if it exists
kubectl delete namespace introduction
if [ $? -eq 0 ]; then
  echo "Namespace introduction deleted"
  exit 0
else
  echo "Namespace introduction does not exist"
  exit 1
fi
