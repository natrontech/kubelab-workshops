```bash
# Add the label under the metadata section of the pod definition
# metadata:
#   labels:
#     security: "404"

kubectl edit pod wordpress -n shop

# Using the `kubectl label` command to add a label to the pod
kubectl label pod wordpress security=404 -n shop
```
