Create and apply this yaml file:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: simple-pod
  namespace: pink
spec:
  containers:
    - name: simple-pod
      image: nginx
      volumeMounts:
      - name: web-server-data-volume
        mountPath: "/data"
  volumes:
  - name: web-server-data-volume
    configMap:
      name: web-server-data
```