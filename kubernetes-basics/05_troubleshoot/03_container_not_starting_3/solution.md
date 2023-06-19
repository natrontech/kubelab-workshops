The resource limit does not align with the LimitRange quota for this namespace. The pod is not starting because it should have a memory limit between 560Mi and 570Mi. Delete the LimitRange and create the pod.


```bash
kubectl delete pod -n test2 mapper
```

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
