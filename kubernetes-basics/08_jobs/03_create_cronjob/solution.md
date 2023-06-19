Add the following to a a yaml file
```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: daily-run
  namespace: news
spec:
  schedule: "0 8 * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: message
            image: busybox
          restartPolicy: OnFailure
```

```bash
kubectl apply -f <file>.yaml
```