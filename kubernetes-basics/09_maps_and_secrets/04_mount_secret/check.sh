#!/bin/bash

namespace="purple"
cmname="web-server-secrets"
podname="simple-pod"

mountpath=$(kubectl get pod $podname -n $namespace -o jsonpath='{range .spec.containers[0].volumeMounts[?(@.name=="web-server-secret-volume")]}{.mountPath}{"\n"}{end}')
volumenamecm=$(kubectl get pod $podname -n $namespace -o jsonpath='{range .spec.volumes[?(@.name=="web-server-secret-volume")]}{.secret.secretName}{"\n"}{end}')

if [ "$mountpath" != "/secret" ]; then
    echo "Secret has the wrong mount path."
    exit 1
fi

if [ "$volumenamecm" != "$cmname" ]; then
    echo "Wrong Secret mounted"
    exit 1
fi

echo "Mount looks good"
exit 0