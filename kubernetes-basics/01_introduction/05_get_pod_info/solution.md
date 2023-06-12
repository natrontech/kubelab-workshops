This command gets the client version of kubectl and writes it to a file called `kubectl_client_version.txt`.

```bash
kubectl get pods -n myspace
kubectl get pods -n myspace -o=jsonpath='{.items[*].metadata.name}' > pod_name.txt
```
