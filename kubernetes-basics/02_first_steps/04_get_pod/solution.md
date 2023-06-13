```bash
kubectl get pods -n chaos --selector=important=true --no-headers | wc -l > important_pods.txt
```
