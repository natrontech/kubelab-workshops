#!/bin/bash

yaml_service='
apiVersion: v1
kind: Service
metadata:
  name: frontend
  namespace: images
spec:
  selector:
    appilcation: demo1
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
'

yaml_deploy='
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  namespace: images
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      application: demo1
  template:
    metadata:
      labels:
        application: demo1
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
'

# Setup cluster
kubectl delete namespace images
kubectl create namespace images

echo "$yaml_service" | kubectl apply -f -
echo "$yaml_deploy" | kubectl apply -f -

exit 0
