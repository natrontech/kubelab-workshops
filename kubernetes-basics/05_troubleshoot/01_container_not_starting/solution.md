The container `web` inside the pod `myapplication` the has the wrong image name. It should be `nginx` instead of `ngnix`.

```bash
kubectl edit pod -n prod myapplication
```
