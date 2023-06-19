#!/bin/bash

pod_name="wordpress"
namespace="shop"
label_selector="security=404"

# Use kubectl to check if the pod exists with the specified label
pod_count=$(kubectl get pods -n $namespace --selector=$label_selector -o json | jq '.items | length')

if [ "$pod_count" -gt 0 ]; then
    echo "Pod exists with the specified label."
    exit 0
else
    echo "Pod does not exist with the specified label."
    exit 1
fi
