Apply following manifest:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webservice
  namespace: team-b
spec:
  selector:
    matchLabels:
      app: webservice
  template:
    metadata:
      labels:
        app: webservice
    spec:
      containers:
      - name: webservice
        image: nginx
      nodeSelector:
        kubernetes.io/os: linux
```