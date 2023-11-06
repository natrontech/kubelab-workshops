Apply following manifest to create the pod:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: debugger
  namespace: dev-team
spec:
  selector:
    matchLabels:
      app: debugger
  template:
    metadata:
      labels:
        app: debugger
    spec:
      containers:
      - name: alpine
        image: alpine:3.18
        command: ["/bin/sh", "-c", "sleep 3600"]
        volumeMounts:
        - name: data
          mountPath: /data
      volumes:
      - name: data
        emptyDir: {}
```

Connect to the pod and create a file in the volume:

```bash
# get the pod name
kubectl get pods -n dev-team

kubectl exec -it debugger-XXXXXXXXXX-XXXXX -n dev-team -- sh
$ echo "Hello World" > /data/hello.txt
$ exit
```

Delete the pod and wait until it is recreated:

```bash
kubectl delete pod debugger-XXXXXXXXXX-XXXXX -n dev-team
```

Check if the file still exists:

```bash
# get the pod name
kubectl get pods -n dev-team

kubectl exec -it debugger-XXXXXXXXXX-XXXXX -n dev-team -- sh
$ cat /data/hello.txt
```