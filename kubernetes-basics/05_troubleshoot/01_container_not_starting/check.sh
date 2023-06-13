#!/bin/bash

pod_name="myapplication"
namespace="prod"

status=$(kubectl get pod $pod_name -n $namespace -o=jsonpath='{.status}')
container_statuses=$(echo $status | jq -r '.containerStatuses[].ready')

for status in $container_statuses; do
    if [ "$status" != "true" ]; then
        echo "Not all containers in the pod are ready."
        exit 1
    fi
done

echo "All containers in the pod are ready."
exit 0
