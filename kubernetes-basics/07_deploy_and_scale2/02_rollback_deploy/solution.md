```bash
# Check the rollout history
kubectl rollout history deployment -n api myapp

# Rollback to the previous version
kubectl rollout undo deployment -n api myapp
```
