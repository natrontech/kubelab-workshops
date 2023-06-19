#!/bin/bash

yaml2='
apiVersion: v1
kind: LimitRange
metadata:
  name: min-max-mem-policy
  namespace: test2
spec:
  limits:
  - max:
      memory: 350Mi
    min:
      memory: 300Mi
    type: Container
'

# Setup cluster
kubectl delete namespace test2
kubectl create namespace test2

echo "$yaml2" | kubectl apply -f -

exit 0
