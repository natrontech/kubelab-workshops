Run the following command to create the pod:
```bash
kubectl run webpod -n dev3 --image nginx --port 80
```

The created pod received the label `run=webpod` automatically, because we used the `kubectl run` command.
Create a service.yaml file with the following content, which selects the pod by the label `run=webpod`:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: webserver
  namespace: dev3
spec:
  selector:
    run: webpod
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
```

Apply the file:
```bash
kubectl apply -f service.yaml
```
