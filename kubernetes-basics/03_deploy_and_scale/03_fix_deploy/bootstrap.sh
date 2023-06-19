#!/bin/bash

# Setup cluster
kubectl delete namespace winter
kubectl create namespace winter

yaml_data='
apiVersion: apps/v1
kind: Deployment
metadata:
  name: cold
  namespace: winter
  labels:
    country: switzerland
    state: bern
    city: bern
spec:
  replicas: 3
  paused: true
  selector:
    matchLabels:
      app: winter
  template:
    metadata:
      labels:
        app: winter
    spec:
      containers:
      - name: winter
        image: nginx
        ports:
        - containerPort: 80
'

echo "$yaml_data" | kubectl apply -f -

exit 0
