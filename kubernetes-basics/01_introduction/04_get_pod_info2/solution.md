```bash
# Simple solution
kubectl describe pod myapp53 -n prod-data | grep Image

# One-liner solution
kubectl get pods myapp53 -n prod-data -o=jsonpath='{.spec.containers[*].image}' > pod_image.txt
```
