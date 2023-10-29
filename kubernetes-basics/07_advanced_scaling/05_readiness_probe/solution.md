Add the following to a a yaml file
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web
  namespace: web-services
  labels:
    app: nginx
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: web
        image: nginx
        ports:
        - containerPort: 80
        readinessProbe:
          tcpSocket:
            port: 80
          initialDelaySeconds: 5
          periodSeconds: 10
```

```bash
kubectl apply -f <file>.yaml
```
