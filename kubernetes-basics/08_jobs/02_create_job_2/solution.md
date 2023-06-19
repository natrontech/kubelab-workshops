Add the following to a a yaml file
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: update-web
  namespace: updates-dev
spec:
  template:
    spec:
      containers:
      - name: update-web
        image: busybox
        command: ["/bin/sh"]
        args: ["-c", "echo HELLO"]
      restartPolicy: OnFailure
```

```bash
kubectl apply -f <file>.yaml
```