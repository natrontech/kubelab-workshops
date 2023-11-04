# Advanced Kubernetes Lab

Welcome to the advanced Kubernetes lab. In this exercise, you will be tasked with fixing various misconfigurations in a Kubernetes cluster. Here are your tasks:

1. **Update the Deployment**: Ensure the deployment `advanced-deployment` in the `advanced-lab` namespace uses the image `nginx:latest` and has 3 replicas.

2. **Correct the ConfigMap**: The `advanced-config` ConfigMap in the `advanced-lab` namespace should have a key `advanced-config-key` with the value `advanced-value`.

3. **Configure the Service**: The service `advanced-svc` in the `advanced-lab` namespace should expose port 8080.

4. **Fixing PV and PVC**: The PV named `misconfigured-pv` should have a capacity of `2Gi`. The PVC named `misconfigured-pvc` in the `advanced-lab` namespace should use the storage class `nfs-data`.

5. **Update the Secret**: Ensure the secret `app-secret` in the `advanced-lab` namespace contains the keys `username` and `password` with appropriate values.

Good luck!
