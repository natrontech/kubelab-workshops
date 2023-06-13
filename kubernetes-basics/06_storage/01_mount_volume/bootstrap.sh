#!/bin/bash

yaml='
apiVersion: v1
kind: Pod
metadata:
  name: logger
  namespace: logs
  labels:
    application: myapplication
spec:
    containers:
    - name: web
      image: nginx
      ports:
      - containerPort: 80
'

# Setup cluster
kubectl delete namespace logs
kubectl create namespace logs

echo "$yaml" | kubectl apply -f -

exit 0
