#!/bin/bash

# Setup cluster
kubectl delete namespace counting-service
kubectl create namespace counting-service

yaml_data='
apiVersion: v1
kind: Pod
metadata:
  name: counter
  namespace: counting-service
spec:
  containers:
  - name: count
    image: busybox
    args:
    - /bin/sh
    - -c
    - >
      i=0;
      while true;
      do
        echo "$i: $(date)" >> /var/log/1.log;
        echo "$(date) INFO $i" >> /var/log/2.log;
        i=$((i+1));
        sleep 1;
      done      
    volumeMounts:
    - name: varlog
      mountPath: /var/log
  - name: count-log-1
    image: busybox
    args: [/bin/sh, -c, "tail -n+1 -F /var/log/1.log"]
    volumeMounts:
    - name: varlog
      mountPath: /var/log
  volumes:
  - name: varlog
    emptyDir: {}
'

echo "$yaml_data" | kubectl apply -f -

exit 0
