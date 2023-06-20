Check the rollout history

```bash
kubectl rollout history deployment -n api myapp
```

Rollback to the previous version

```bash
kubectl rollout undo deployment -n api myapp
```
