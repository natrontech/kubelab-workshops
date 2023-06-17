```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: db-access
  namespace: database
spec:
  podSelector:
    matchLabels:
      type: database
  policyTypes:
    - Ingress
  ingress:
    - from:
        - podSelector:
            matchLabels:
              type: web
      ports:
        - protocol: TCP
          port: 3306
```