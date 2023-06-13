#!/bin/bash

yaml='
apiVersion: v1
kind: Pod
metadata:
  name: messenger
  namespace: test
  labels:
    test123: test123
spec:
    containers:
    - name: web
      image: nginx
      ports:
      - containerPort: 80
      resources:
        requests:
          memory: "100Gi"
'

# Setup cluster
kubectl delete namespace test
kubectl create namespace test

echo "$yaml" | kubectl apply -f -

exit 0
