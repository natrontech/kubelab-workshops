Create a service.yaml file with the following content:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: hello
  namespace: dev2
spec:
  type: ClusterIP
  selector:
    app: hello
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 8080
```

Apply the file:
```bash
kubectl apply -f service.yaml
```
