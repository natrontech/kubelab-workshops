#!/bin/bash

yaml='
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello
  namespace: dev2
spec:
  replicas: 2
  selector:
    matchLabels:
      app: hello
  template:
    metadata:
      labels:
        app: hello
    spec:
      containers:
      - name: hello
        image: nginx
        ports:
        - containerPort: 8080
'

# Setup cluster
kubectl delete namespace dev2
kubectl create namespace dev2

echo "$yaml" | kubectl apply -f -

exit 0
