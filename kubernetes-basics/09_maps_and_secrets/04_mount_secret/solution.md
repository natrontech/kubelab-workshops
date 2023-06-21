Create and apply this yaml file:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: simple-pod
  namespace: purple
spec:
  containers:
    - name: simple-pod
      image: nginx
      volumeMounts:
      - name: web-server-secret-volume
        mountPath: "/secret"
  volumes:
  - name: web-server-secret-volume
    secret:
      secretName: web-server-secrets
```