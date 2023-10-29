The resource limit does not align with the LimitRange quota for this namespace.
Edit the resource limit to be within the quota and set the limit to 400Mi.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: mapper
  namespace: test2
spec:
  containers:
  - name: mapper
    image: redis
    resources:
      limits:
        memory: 400Mi
```

```bash
kubectl apply -f <file>.yaml
```
