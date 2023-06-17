```bash
kubectl create serviceaccount bird -n sky
```

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: fly
  namespace: sky
spec:
  serviceAccountName: bird
  containers:
  - name: fly
    image: nginx
```