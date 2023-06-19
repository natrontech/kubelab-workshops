Create a yaml file with the following content:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: hungry-server
  namespace: app3
spec:
  containers:
  - name: hungry-server
    image: nginx
    resources:
      limits:
        memory: "500Mi"
        cpu: "500m"
```

Apply the yaml file:
```bash
kubectl apply -f <file>.yaml
```