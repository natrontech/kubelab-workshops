Solutions for the Advanced Lab:

1. **Update the Deployment**:

```bash
kubectl set image deployment/advanced-deployment nginx=nginx:latest -n advanced-lab
kubectl scale deployment/advanced-deployment --replicas=3 -n advanced-lab
```

2. **Correct the ConfigMap**:

```bash
kubectl patch configmap advanced-config -n advanced-lab --type=merge -p '{"data":{"advanced-config-key":"advanced-value"}}'
```

3. **Configure the Service**:

```bash
kubectl patch svc advanced-svc -n advanced-lab --type='json' -p='[{"op": "replace", "path": "/spec/ports/0/port", "value":8080}]'
```

4. **Fixing PV and PVC**:

```bash
kubectl patch pv misconfigured-pv --type='json' -p='[{"op": "replace", "path": "/spec/capacity/storage", "value":"2Gi"}]'
kubectl delete pvc misconfigured-pvc -n advanced-lab
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: misconfigured-pvc
  namespace: advanced-lab
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 2Gi
  storageClassName: nfs-data
EOF
```

5. **Update the Secret**:

```bash
kubectl create secret generic app-secret --from-literal=username=admin --from-literal=password=secret123 --dry-run=client -o yaml | kubectl apply -f - -n advanced-lab
```
