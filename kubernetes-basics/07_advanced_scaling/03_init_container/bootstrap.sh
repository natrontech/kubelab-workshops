#!/bin/bash

# Setup cluster
kubectl delete namespace myapp
kubectl create namespace myapp

yaml_data='
apiVersion: v1
kind: Pod
metadata:
  name: postgres
  namespace: myapp
  labels:
    app: postgres
spec:
  containers:
    - name: postgres-container
      image: postgres:latest
      ports:
        - containerPort: 5432
      env:
        - name: POSTGRES_USER
          value: myuser
        - name: POSTGRES_PASSWORD
          value: mypassword
        - name: POSTGRES_DB
          value: mydatabase
      volumeMounts:
        - name: postgres-storage
          mountPath: /var/lib/postgresql/data
  volumes:
    - name: postgres-storage
      emptyDir: {}
---
apiVersion: v1
kind: Service
metadata:
  name: postgres
  namespace: myapp
spec:
  selector:
    app: postgres
  ports:
    - name: postgres
      protocol: TCP
      port: 5432
      targetPort: 5432
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
  namespace: myapp
spec:
  strategy: 
    type: RollingUpdate
  replicas: 1
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

exit 0
