The container image provides the uid 101.
Apply the following manifest to create the pod:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: lion
  namespace: zoo
spec:
  securityContext:
    runAsUser: 101
  containers:
  - name: lion
    image: nginxinc/nginx-unprivileged
```