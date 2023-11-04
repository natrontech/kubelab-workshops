#!/bin/bash

# Wipe any remnants of the ancient city from previous attempts
kubectl delete namespace atlantis --ignore-not-found=true

# Initialize the legendary sunken city
kubectl create namespace atlantis

# Deploy the mysteries of the ancient city
kubectl apply -n atlantis -f - <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: oracle-inscription
data:
  prophecy: "To awaken Atlantis, unite the web relic with the database of knowledge and the guardian of secrets."

---

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: database-artifact
spec:
  accessModes:
  - ReadWriteOnce
  storageClassName: "nfs-data"
  resources:
    requests:
      storage: 2Gi

---

apiVersion: v1
kind: Secret
metadata:
  name: guardian-secret
type: Opaque
data:
  username: YWRtaW4=  # Encoded "admin"
  password: U2VjcmV0UGFzc3dvcmQ=  # Encoded "SecretPassword"
EOF
