#!/bin/bash

helm_status=`helm ls -n blog -o json | jq -r '.[0].status'`
image=`kubectl get deploy -n blog my-blog-wordpress -o jsonpath='{.spec.template.spec.containers[0].image}' | cut -d":" -f2`
replicas=`kubectl get deploy -n blog my-blog-wordpress -o jsonpath='{.spec.replicas}'`

# check if helm release is deployed
if [ "$helm_status" == "deployed" ]; then
  echo "Helm release is deployed."
else
  echo "Helm release is not deployed."
  exit 1
fi

# check if image is correct
if [ "$image" == "6-debian-11" ]; then
  echo "Image is correct."
else
  echo "Image is not correct."
  exit 1
fi

# check if replicas is correct
if [ "$replicas" == "2" ]; then
  echo "Replicas is correct."
  exit 0
else
  echo "Replicas is not correct."
  exit 1
fi