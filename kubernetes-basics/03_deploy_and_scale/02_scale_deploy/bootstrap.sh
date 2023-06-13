#!/bin/bash

# Setup cluster
kubectl delete namespace castle
kubectl create namespace castle

yaml_data='
apiVersion: apps/v1
kind: Deployment
metadata:
  name: knights
  namespace: castle
  labels:
    country: switzerland
    state: bern
    city: bern
spec:
  replicas: 1
  selector:
    matchLabels:
      app: knights
  template:
    metadata:
      labels:
        app: knights
    spec:
      containers:
      - name: knights
        image: nginx
        ports:
        - containerPort: 80
'

echo "$yaml_data" | kubectl apply -f -

exit 0
