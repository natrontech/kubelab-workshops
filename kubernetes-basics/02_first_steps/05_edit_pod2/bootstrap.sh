#!/bin/bash

# Setup cluster
kubectl delete namespace facebook
kubectl create namespace facebook
kubectl run frontend --image nginx --namespace facebook --labels="facebooktype=frontend-app-data,asasdjjoplias098djnasd=opijasd-0921okjalkjjasd,lkjasopjidj89oijasd=opjiasd0892onjasd" --overrides='
{
  "spec": {
    "containers": [
      {
        "name": "part1",
        "image": "nginx"
      }
    ]
  }
}'

exit 0
