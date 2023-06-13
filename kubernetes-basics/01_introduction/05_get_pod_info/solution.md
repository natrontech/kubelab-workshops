
```bash
kubectl get pods -n myspace
kubectl get pods -n myspace -o=jsonpath='{.items[*].metadata.name}' > pod_name.txt
```
