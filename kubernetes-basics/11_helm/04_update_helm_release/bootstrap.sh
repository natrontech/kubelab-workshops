#!/bin/bash

# setup cluster
kubectl delete namespace blog
kubectl create namespace blog

# install wordpress without persistence
helm install my-blog oci://registry-1.docker.io/bitnamicharts/wordpress --namespace blog --set service.type=ClusterIP --set persistence.enabled=false --set mariadb.primary.persistence.enabled=false

exit 0