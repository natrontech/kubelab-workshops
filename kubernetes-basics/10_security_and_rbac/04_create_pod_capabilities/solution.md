```yaml
apiVersion: v1
kind: Pod
metadata:
  name: clock
  namespace: time
spec:
  containers:
  - name: clock
    image: nginx
    securityContext:
      capabilities:
        add: ["SYS_TIME"]
```