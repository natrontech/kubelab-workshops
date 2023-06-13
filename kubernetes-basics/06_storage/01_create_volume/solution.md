```bash
kubectl get pods -n logs logger -o yaml > logger.yaml
```

Add the following to the spec section of the logger.yaml file
```yaml
spec:
  containers:
    volumeMounts: 
      - mountPath: /data/access.log
        name: logger-volume
...
  volumes:
    - name: logger-volume
      hostPath:
        path: /var/log/syslog
    ...
```

```bash
kubectl replace -f logger.yaml --force
```