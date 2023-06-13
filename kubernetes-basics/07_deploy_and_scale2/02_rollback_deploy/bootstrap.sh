#!/bin/bash

# Setup cluster
kubectl delete namespace api
kubectl create namespace api

yaml_data='
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
  namespace: api
spec:
  strategy: 
    type: Recreate
  replicas: 2
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: nginx:1.25.0
        ports:
        - containerPort: 80
'

echo "$yaml_data" | kubectl apply -f -
sleep 2
kubectl set image deployment myapp myapp=nginx:1.35.6 -n api --record

exit 0
