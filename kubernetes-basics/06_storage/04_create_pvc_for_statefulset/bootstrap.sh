#!/bin/bash

# Setup cluster
kubectl delete namespace stateful-app
kubectl create namespace stateful-app

yaml='
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: webservice
spec:
  replicas: 1
  selector:
    matchLabels:
      app: webservice
  template:
    metadata:
      labels:
        app: webservice
    spec:
      containers:
      - name: nginx
        image: nginx:1.25
        ports:
        - containerPort: 80
'

echo "$yaml" | kubectl apply -f -

exit 0
