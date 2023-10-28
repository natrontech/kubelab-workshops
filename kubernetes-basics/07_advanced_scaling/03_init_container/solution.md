Apply the following manifest which updates the deployment and adds an init container to it:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
  namespace: myapp
spec:
  strategy: 
    type: RollingUpdate
  replicas: 1
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: nginx:1.25.0
        ports:
        - containerPort: 80
      initContainers:
      - name: wait-for-db
        image: postgres:latest
        env:
        - name: PGPASSWORD
          value: mypassword
        command:
        - /bin/sh
        - -c
        - |
          until pg_isready -h postgres -U myuser -d  mydatabase; do
            echo "Waiting for the database to be  available..."
            sleep 2
          done
```

```bash
kubectl apply -f <file>.yaml
```