Add the following to a a yaml file
```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: get-up
  namespace: alarm
spec:
  schedule: "0 6 * * 1-5"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: message
            image: nginx
          restartPolicy: OnFailure
```

```bash
kubectl apply -f <file>.yaml
```