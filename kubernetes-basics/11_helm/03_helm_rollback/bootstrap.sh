#!/bin/bash

# setup cluster
kubectl delete namespace dokuwiki
kubectl create namespace dokuwiki

# install tomcat
helm install dokuwiki oci://registry-1.docker.io/bitnamicharts/dokuwiki --namespace dokuwiki
export DOKUWIKI_PASSWORD=$(kubectl get secret --namespace "dokuwiki" dokuwiki -o jsonpath="{.data.dokuwiki-password}" | base64 -d)

helm upgrade --namespace dokuwiki --set resources.limits.cpu=2m --set dokuwikiPassword=$DOKUWIKI_PASSWORD dokuwiki oci://registry-1.docker.io/bitnamicharts/dokuwiki

exit 0