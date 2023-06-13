#!/bin/bash

hostvolumename=$(kubectl get pod logger -n logs -o jsonpath='{range .spec.volumes[?(@.hostPath.path=="/var/log/syslog")]}{.name}{"\n"}{end}')
mountpath=$(kubectl get pod logger -n logs -o jsonpath='{range .spec.containers[0].volumeMounts[?(@.name=="logger-volume")]}{.mountPath}{"\n"}{end}')

if [ "$hostvolumename" != "logger-volume" ]; then
    echo "Pod logger does not have the required volume named logger-volume mapped to to /var/log/syslog"
    exit 1
fi

if [ "$mountpath" != "/data/access.log" ]; then
    echo "Pod logger does not have the required volume named logger-volume mapped to to /data/access.log"
    exit 1
fi

echo "Pod logger has the required volume named logger-volume mapped from /var/log/syslog to /data/access.log"
exit 0