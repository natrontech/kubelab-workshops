The container `web` inside the pod `messenger` requests too much resources. The pod is not starting because the node does not have enough resources to schedule the pod. Change the resource requests of the container to something more reasonable like `50Mi` memory.

```bash
kubectl get pod -n test messenger -o yaml > messenger.yaml
# Edit the file and change the resource requests of the container `web`
kubectl replace -f messenger.yaml --force
```
