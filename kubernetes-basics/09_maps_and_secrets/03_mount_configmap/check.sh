#!/bin/bash

namespace="pink"
cmname="web-server-data"
podname="simple-pod"

mountpath=$(kubectl get pod $podname -n $namespace -o jsonpath='{range .spec.containers[0].volumeMounts[?(@.name=="web-server-data-volume")]}{.mountPath}{"\n"}{end}')
volumenamecm=$(kubectl get pod $podname -n $namespace -o jsonpath='{range .spec.volumes[?(@.name=="web-server-data-volume")]}{.configMap.name}{"\n"}{end}')

if [ "$mountpath" != "/data" ]; then
    echo "ConfigMap has the wrong name."
    exit 1
fi

if [ "$volumenamecm" != "$cmname" ]; then
    echo "Wront ConfigMap mounted"
    exit 1
fi

echo "Mount looks good"
exit 0