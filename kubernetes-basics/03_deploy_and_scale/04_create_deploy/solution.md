Create a yaml file with the following content:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sun
  namespace: summer
  labels:
    app: sun
spec:
  replicas: 2
  revisionHistoryLimit: 4
  selector:
    matchLabels:
      app: sun
  template:
    metadata:
      labels:
        app: sun
    spec:
      containers:
      - name: sun
        image: httpd
```
