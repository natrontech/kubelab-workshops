Add the following to a a yaml file
```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: release
  namespace: development
spec:
  schedule: "45 3 1 * *"
  successfulJobsHistoryLimit: 6
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: release
            image: nginx
          restartPolicy: OnFailure
```

```bash
kubectl apply -f <file>.yaml
```