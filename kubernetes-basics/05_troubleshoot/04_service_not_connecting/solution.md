The service `frontend` in the namespace `images` has a typo in the selector that does not match the labels of the pods.
Change the selector of the service from `appilcation: demo1` to `application: demo1`.

```bash
# Edit the selector of the service to match the labels of the deployment
kubectl edit service -n images frontend
```

```yaml
spec:
  ...
  selector:
    application: demo1
```
