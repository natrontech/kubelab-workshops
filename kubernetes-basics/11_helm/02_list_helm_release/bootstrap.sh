#!/bin/bash

# setup cluster
kubectl delete namespace podinfo
kubectl create namespace podinfo

# install podinfo
helm install podinfo oci://ghcr.io/stefanprodan/charts/podinfo --namespace podinfo
helm upgrade --namespace podinfo --set replicaCount=2 podinfo oci://ghcr.io/stefanprodan/charts/podinfo
helm upgrade --namespace podinfo --set replicaCount=3 podinfo oci://ghcr.io/stefanprodan/charts/podinfo

exit 0