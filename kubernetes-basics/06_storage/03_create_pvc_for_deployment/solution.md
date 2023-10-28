Apply following manifest to create a PVC and a pod that uses it:

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: data
  namespace: storage-app
spec:
  storageClassName: hcloud-volumes
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
---
apiVersion: v1
kind: Pod
metadata:
  name: storage-pod
  namespace: storage-app
spec:
  containers:
  - name: alpine
    image: alpine
    command: ["/bin/sh", "-c", "sleep 3600"]
    volumeMounts:
    - name: data
      mountPath: /data
  volumes:
  - name: data
    persistentVolumeClaim:
      claimName: data
```

```bash
kubectl apply -f <file>.yaml
```