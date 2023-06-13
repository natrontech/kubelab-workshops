Add the following to a a yaml file
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-logs
spec:
  capacity:
    storage: 1Gi
  volumeMode: Filesystem
  accessModes:
    - ReadWriteMany
  persistentVolumeReclaimPolicy: Retain
  hostPath:
    path: /var/log
```

```bash
kubectl apply -f <file>.yaml
```