#!/bin/bash

# Setup cluster
kubectl delete namespace summer
kubectl create namespace summer

yaml_data='
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hot
  namespace: summer
  labels:
    region: sahara
    nature: desert
spec:
  replicas: 5
  selector:
    matchLabels:
      climate: summer
  template:
    metadata:
      labels:
        climate: summer
    spec:
      containers:
      - name: summer
        image: nginx:1.14
        ports:
        - containerPort: 80
'

echo "$yaml_data" | kubectl apply -f -

exit 0
