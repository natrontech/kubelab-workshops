Apply the following manifest:
**Important:** `volumeClaimTemplates` can not be updated to an existing Statefulset. Delete the statefulset and apply the manifest again (or use `--force` in the kubectl command).

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: webservice
  namespace: stateful-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: webservice
  template:
    metadata:
      labels:
        app: webservice
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
        volumeMounts:
        - name: data
          mountPath: /data
  volumeClaimTemplates:
  - metadata:
      name: data
    spec:
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 10Gi
```