#!/bin/bash

# Check the Deployment
deployment_image=$(kubectl get deployment advanced-deployment -n advanced-lab -o=jsonpath='{.spec.template.spec.containers[0].image}')
replicas=$(kubectl get deployment advanced-deployment -n advanced-lab -o=jsonpath='{.spec.replicas}')

if [[ "$deployment_image" != "nginx:latest" ]]; then
    echo "Wrong deployment image. Expected nginx:latest but got $deployment_image."
    exit 1
elif [[ "$replicas" -ne 3 ]]; then
    echo "Wrong number of replicas. Expected 3 but got $replicas."
    exit 1
fi

# Check the ConfigMap
config_value=$(kubectl get configmap advanced-config -n advanced-lab -o=jsonpath='{.data.advanced-config-key}')

if [[ "$config_value" != "advanced-value" ]]; then
    echo "Incorrect ConfigMap value. Expected advanced-value but got $config_value."
    exit 1
fi

# Check the Service
service_port=$(kubectl get svc advanced-svc -n advanced-lab -o=jsonpath='{.spec.ports[0].port}')

if [[ "$service_port" -ne 8080 ]]; then
    echo "Service is exposing the wrong port. Expected 8080 but got $service_port."
    exit 1
fi

# Check the PV and PVC
pv_size=$(kubectl get pv misconfigured-pv -o=jsonpath='{.spec.capacity.storage}')
pvc_class=$(kubectl get pvc misconfigured-pvc -n advanced-lab -o=jsonpath='{.spec.storageClassName}')

if [[ "$pv_size" != "2Gi" ]]; then
    echo "Incorrect PersistentVolume size. Expected 2Gi but got $pv_size."
    exit 1
elif [[ "$pvc_class" != "nfs-data" ]]; then
    echo "Incorrect PVC storage class. Expected nfs-data but got $pvc_class."
    exit 1
fi

# Check the Secret
username=$(kubectl get secret app-secret -n advanced-lab -o=jsonpath='{.data.username}' | base64 --decode)
password=$(kubectl get secret app-secret -n advanced-lab -o=jsonpath='{.data.password}' | base64 --decode)

if [[ -z "$username" ]]; then
    echo "The username key is missing from the app-secret."
    exit 1
elif [[ -z "$password" ]]; then
    echo "The password key is missing from the app-secret."
    exit 1
fi

echo "All checks passed!"
exit 0
