#!/bin/bash

# Delete the advanced-lab namespace if it exists
kubectl delete namespace advanced-lab --ignore-not-found=true

# Create the advanced-lab namespace
kubectl create namespace advanced-lab

# Set up the initial deployment without the correct image and replicas
kubectl -n advanced-lab create deployment advanced-deployment --image=nginx

# Create a ConfigMap without the correct key-value pair
kubectl -n advanced-lab create configmap advanced-config --from-literal=config-key=wrong-value

# Create a Service without the correct port configuration
kubectl -n advanced-lab create service clusterip advanced-svc --tcp=80:80

# Create a PV without the correct storage capacity and a PVC with the wrong storage class
kubectl apply -f - <<EOF
apiVersion: v1
kind: PersistentVolume
metadata:
  name: misconfigured-pv
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /data
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: misconfigured-pvc
  namespace: advanced-lab
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 2Gi
  storageClassName: manual
EOF

# Create a Secret without all the necessary key-value pairs
kubectl -n advanced-lab create secret generic app-secret --from-literal=username=admin

exit 0
