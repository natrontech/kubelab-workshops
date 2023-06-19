#!/bin/bash

pod_name="messenger"
namespace="test"

# Check if the pod exists
if ! kubectl get pod $pod_name -n $namespace &> /dev/null; then
    echo "Pod $pod_name does not exist."
    exit 1
fi

# Check if all containers in the pod are running
container_statuses=$(kubectl get pod $pod_name -n $namespace -o json | jq -r '.status.containerStatuses[].ready')

# Check if any container is running
if [ -z "$container_statuses" ]; then
    echo "No containers in the pod $pod_name are running."
    exit 1
fi

for status in $container_statuses; do
    if [ "$status" != "true" ]; then
        echo "Not all containers in the pod $pod_name are running."
        exit 1
    fi
done

# Check if container has resource requests and limits
resources=$(kubectl get pod $pod_name -n $namespace -o json | jq -r '.spec.containers[].resources.requests.memory')

if [ "$resources" == "null" ]; then
    echo "Container in the pod $pod_name does not have memory requests."
    exit 1
fi

# If all checks passed, return success (exit code 0)
echo "All containers in the pod $pod_name are running."
exit 0
