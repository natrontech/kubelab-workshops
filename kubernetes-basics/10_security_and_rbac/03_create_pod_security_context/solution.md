```yaml
apiVersion: v1
kind: Pod
metadata:
  name: lion
  namespace: zoo
spec:
  securityContext:
    runAsUser: 1000
  containers:
  - name: lion
    image: nginx
```