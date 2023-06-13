#!/bin/bash

accessmode=`kubectl get pv my-logs -o jsonpath='{.spec.accessModes[0]}'`
policy=`kubectl get pv my-logs -o jsonpath='{.spec.persistentVolumeReclaimPolicy}'`
path=`kubectl get pv my-logs -o jsonpath='{.spec.hostPath.path}'`

if [ "$accessmode" != "ReadWriteMany" ]; then
    echo "Wrong accessmode for the PV my-logs"
    exit 1
fi

if [ "$policy" != "Retain" ]; then
    echo "Wrong policy for the PV my-logs"
    exit 1
fi

if [ "$path" != "/var/log" ]; then
    echo "Wrong path for the PV my-logs"
    exit 1
fi

echo "PV my-logs is correctly configured"
exit 0