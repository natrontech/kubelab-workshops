```bash
kubectl create secret generic db-config -n orange --from-literal=USERNAME=admin --from-literal=PASSWORD=supersafe
```