```bash
kubectl scale deployment hot --replicas=3 -n summer
kubectl set image deployment/hot summer=nginx:1.20 -n summer

# In case of failure,
# kubectl rollout undo deployment/hot -n summer
**Exercise name:** "Deployment Scaling, Rolling Updates and Rollbacks"
```
