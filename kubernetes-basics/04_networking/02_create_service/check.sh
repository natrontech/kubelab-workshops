#!/bin/bash


count=$(kubectl get endpoints hello -n dev2 -o json | jq '.subsets[].addresses | length')
targetport=$(kubectl get services hello -n dev2 -o json | jq -r '.spec.ports[].targetPort')
port=$(kubectl get services hello -n dev2 -o json | jq -r '.spec.ports[].port')
type=$(kubectl get services hello -n dev2 -o json | jq -r '.spec.type')



if [ "$count" -eq 2 ] && [ "$type" = "ClusterIP" ] && [ "$targetport" = "8080" ] && [ "$port" = "8080" ]; then
  echo "Service has $count endpoints and is type $type"
  exit 0
else
  echo "Service has $count endpoints and is type $type"
  exit 1
fi
