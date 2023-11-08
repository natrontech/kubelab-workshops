#!/bin/bash

# Define the pod and namespace
pod_name="counter"
namespace="counting-service"
container_name_to_check="count-log-2"
mount_path_to_check="/var/log"

# Get the list of container names from the pod
container_names=$(kubectl get pod -n ${namespace} ${pod_name} -o jsonpath='{.spec.containers[*].name}')

# Initialize the found flag
found=false

# Loop through each container name and get details
for name in $container_names; do
    # Get details of the specific container
    container_details=$(kubectl get pod -n ${namespace} ${pod_name} -o jsonpath="{.spec.containers[?(@.name=='${name}')]}")

    # Check if this is the container we're looking for
    if [[ "$name" == "${container_name_to_check}" ]]; then
        found=true

        # Get the volume mounts for this container and check if the specific mountPath exists
        mount_paths=$(echo "$container_details" | jq -r '.volumeMounts[].mountPath')
        mount_found=false
        for mount_path in $mount_paths; do
            if [[ "$mount_path" == "$mount_path_to_check" ]]; then
                mount_found=true
                break
            fi
        done

        # If the mount path wasn't found, exit with an error
        if [[ "$mount_found" == false ]]; then
            echo "Sidecar container ${name} does not have the expected mountPath."
            exit 1
        fi

        # Get the running status for the current container
        running=$(kubectl get pod -n ${namespace} ${pod_name} -o jsonpath="{.status.containerStatuses[?(@.name=='${name}')].ready}")

        # Check if container is running
        if [[ "$running" != "true" ]]; then
            echo "Sidecar container ${name} is not running."
            exit 1
        fi
    fi
done

# Check if the container was found
if [[ "$found" == false ]]; then
    echo "Sidecar container with the specified name does not exist."
    exit 1
else
    echo "Sidecar container ${container_name_to_check} exists with the specified mountPath and is running."
    exit 0
fi
