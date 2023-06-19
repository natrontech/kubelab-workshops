#!/bin/bash

# pvc
accessmode=`kubectl get pvc -n storage-app data -o jsonpath='{.spec.accessModes[0]}'`
status=`kubectl get pvc -n storage-app data -o jsonpath='{.status.phase}'`
storage=`kubectl get pvc -n storage-app data -o jsonpath='{.spec.resources.requests.storage}'`

# pod
volumeClaimName=`kubectl get pod -n storage-app storage-pod -o jsonpath='{.spec.volumes[0].persistentVolumeClaim.claimName}'`
mountPath=`kubectl get pod -n storage-app storage-pod -o jsonpath='{.spec.containers[0].volumeMounts[0].mountPath}'`
running=`kubectl get pod -n storage-app storage-pod -o jsonpath='{.status.containerStatuses[0].ready}'`

# check access mode of pvc
if [ "$accessmode" == "ReadWriteOnce" ]; then
    echo "PVC exists with the specified access mode."
else
    echo "PVC does not exist with the specified access mode."
    exit 1
fi

# check status of pvc
if [ "$status" == "Bound" ]; then
    echo "PVC exists with the specified status."
else
    echo "PVC does not exist with the specified status."
    exit 1
fi

# check storage of pvy
if [ "$storage" == "10Gi" ]; then
    echo "PVC exists with the specified storage."
else
    echo "PVC does not exist with the specified storage."
    exit 1
fi

# check volume name of pod
if [ "$volumeClaimName" == "data" ]; then
    echo "Pod exists with the specified pvc."
else
    echo "Pod does not exist with the specified pvc."
    exit 1
fi

# check mountPath of pod
if [ "$mountPath" == "/data" ]; then
    echo "Pod exists with the specified mountPath."
else
    echo "Pod does not exist with the specified mountPath."
    exit 1
fi

# check if pod is running
if [ "$running" == "true" ]; then
    echo "Pod is running."
    exit 0
else
    echo "Pod is not running."
    exit 1
fi