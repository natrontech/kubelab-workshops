#!/bin/bash

# delete the pod_image.txt file if it exists
rm -f important_pods.txt
echo "File important_pods.txt deleted"

# Setup cluster
kubectl delete namespace chaos
kubectl create namespace chaos

kubectl create deployment lkjjasopidjplasdlkjj89hoiasdjskd --image "nginx:1.25.0-alpine-perl" --namespace chaos --replicas $(( ( RANDOM % 3 )  + 1 ))
kubectl create deployment asdasdsadopidjplasdlkjj89hoiasdjskd --image "nginx:1.25.0-alpine-perl" --namespace chaos --replicas $(( ( RANDOM % 3 )  + 1 ))
kubectl create deployment hjtdfgdfgidjpasdasdasdjskd --image "nginx:1.25.0-alpine-perl" --namespace chaos --replicas $(( ( RANDOM % 3 )  + 1 ))
kubectl label pods -n chaos --all important=true
kubectl create deployment 3uhjnoiasd-21noj-oiasd --image "nginx:1.25.0-alpine-perl" --namespace chaos --replicas $(( ( RANDOM % 3 )  + 1 ))
kubectl label pods -n chaos --all lkjasdjklasjdl2uoiasd=lkjasjdlasdasd
kubectl label pods -n chaos --all lkjasdjklasjdlagasd2uoiasd=lkjasjdlasasdasddasd

exit 0
