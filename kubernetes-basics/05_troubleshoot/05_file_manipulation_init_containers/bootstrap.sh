#!/bin/bash

# Setup cluster
kubectl delete namespace winter
kubectl create namespace winter

yaml_data='
apiVersion: v1
kind: Pod
metadata:
  name: snow
  namespace: winter
  labels:
    season: winter
spec:
  initContainers:
  - name: prepare-file
    image: alpine
    command: ["/bin/sh", "-c"]
    args: ["echo Snowflakes are unique! > /data-dir/wrong-data.txt"]
    volumeMounts:
    - mountPath: "/data-dir"
      name: workdir
  containers:
  - name: process-file
    image: alpine
    command: ["/bin/sh", "-c"]
    args: ["cat /data-dir/data.txt || echo Unable to read file"]
    volumeMounts:
    - mountPath: "/data-dir"
      name: workdir
  volumes:
  - name: workdir
    emptyDir: {}
'

echo "$yaml_data" | kubectl apply -f -

exit 0
