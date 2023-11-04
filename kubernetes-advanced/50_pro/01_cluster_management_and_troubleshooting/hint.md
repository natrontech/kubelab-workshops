Hints for the Advanced Lab:

1. **Deployment**: Use `kubectl set image` to update the deployment image and `kubectl scale` to adjust the number of replicas.
   
2. **ConfigMap**: Remember that you can use `kubectl edit` to modify resources directly or `kubectl patch` to apply specific changes.

3. **Service**: The `kubectl patch` command can help you modify existing resources, including changing the exposed ports.

4. **PV and PVC**: You might need to delete and recreate resources to change certain immutable fields.

5. **Secret**: Use `kubectl create secret` with the `--dry-run=client -o yaml` flags to generate the correct YAML without applying it, then use `kubectl apply` to update the secret.

For more detailed documentation, visit the [official Kubernetes documentation](https://kubernetes.io/docs/).
