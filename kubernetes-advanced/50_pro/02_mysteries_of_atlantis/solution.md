# **Mysteries of Atlantis: The Extended Kubernetes Odyssey - Solution**

## Uncovering the Web Relic
```bash
# Deploy the Web Relic
kubectl create deployment web-app --image=nginx:alpine -n atlantis

# Expose the Web Relic to the masses
kubectl expose deployment web-app --name=web-service --type=ClusterIP --port=80 -n atlantis

# Deploy the Database of Knowledge
kubectl create deployment db-backend --image=postgres:alpine -n atlantis

# Decode the Guardian of Secrets' knowledge
username=$(echo "YWRtaW4=" | base64 --decode)
password=$(echo "U2VjcmV0UGFzc3dvcmQ=" | base64 --decode)

# Use the decoded secrets to configure the Web Relic's credentials (this is a hypothetical configuration)
kubectl set env deployment/web-app DB_USERNAME=$username DB_PASSWORD=$password -n atlantis

# Create a NetworkPolicy that allows traffic only from the Web Relic to the Database of Knowledge
kubectl apply -n atlantis -f - <<EOF
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: db-access-policy
spec:
  podSelector:
    matchLabels:
      app: db-backend
  policyTypes:
  - Ingress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: web-app
    ports:
    - protocol: TCP
      port: 5432
EOF
```
