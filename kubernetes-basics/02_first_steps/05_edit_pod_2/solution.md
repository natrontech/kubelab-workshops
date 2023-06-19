```bash
kubectl get pod frontend -n facebook -o yaml > frontend.yaml
```

Edit the name under the spec section of the pod definition:
```yaml
spec:
  containers:
    name: "frontend-p1"
```

Apply the manifest:
```bash
kubectl replace -f frontend.yaml --force
```
