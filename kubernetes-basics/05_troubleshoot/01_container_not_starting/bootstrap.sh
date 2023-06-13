#!/bin/bash

yaml='
apiVersion: v1
kind: Pod
metadata:
  name: myapplication
  namespace: prod
  labels:
    application: myapplication
spec:
    containers:
    - name: data
      image: redis
      ports:
      - containerPort: 6379
    - name: web2
      image: yobasystems/alpine-mariadb
      ports:
      - containerPort: 8080
    - name: web
      image: nignx
      ports:
      - containerPort: 80
'

# Setup cluster
kubectl delete namespace prod
kubectl create namespace prod

echo "$yaml" | kubectl apply -f -

exit 0
