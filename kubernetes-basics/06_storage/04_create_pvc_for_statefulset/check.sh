#!/bin/bash

accessMode=`kubectl get sts webservice -n stateful-app -o jsonpath='{.spec.volumeClaimTemplates[0].spec.accessModes[0]}'`
storage=`kubectl get sts webservice -n stateful-app -o jsonpath='{.spec.volumeClaimTemplates[0].spec.resources.requests.storage}'`
phase=`kubectl get pvc -n stateful-app data-webservice-0 -o jsonpath='{.status.phase}'`
mountPath=`kubectl get sts webservice -n stateful-app -o jsonpath='{.spec.template.spec.containers[0].volumeMounts[0].mountPath}'`

if [ "$accessMode" != "ReadWriteOnce" ]; then
    echo "The access mode of the volume claim template is not ReadWriteOnce"
    exit 1
fi

if [ "$storage" != "10Gi" ]; then
    echo "The storage size of the volume claim template is not 10Gi"
    exit 1
fi

if [ "$phase" != "Bound" ]; then
    echo "The phase of the volume claim template is not Bound"
    exit 1
fi

if [ "$mountPath" != "/data" ]; then
    echo "The mount path of the volume claim template is not /data"
    exit 1
fi

exit 0