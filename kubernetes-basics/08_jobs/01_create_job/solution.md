Add the following to a a yaml file
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: update-servers
  namespace: updates
spec:
  template:
    spec:
      containers:
      - name: update-servers
        image: stakater/exit-container
      restartPolicy: OnFailure
```

```bash
kubectl apply -f <file>.yaml
```