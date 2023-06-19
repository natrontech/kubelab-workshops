Add the following to a a yaml file
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: appdata
  namespace: world
  labels:
    app: httpd
spec:
  strategy: 
    type: Recreate
  replicas: 2
  selector:
    matchLabels:
      app: httpd
  template:
    metadata:
      labels:
        app: httpd
    spec:
      containers:
      - name: web
        image: httpd
        ports:
        - containerPort: 80
```

```bash
kubectl apply -f <file>.yaml
```