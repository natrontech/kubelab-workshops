`volumeClaimTemplates` can only be used for StatefulSets and add a pvc to each pod of the StatefulSet. The pvc is automatically created when the StatefulSet is created. Add the following snippet to the StatefulSet:

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: webservice
spec:
(...)
  volumeClaimTemplates:
  - metadata:
      name: data
    spec:
      accessModes: [ "ReadWriteOnce" ]
      storageClassName: "nfs-data"
      resources:
        requests:
          storage: 10Gi
```

Check the created pvc:

```bash
kubectl get pvc -n stateful-app
```