#!/bin/bash

random=$(openssl rand -hex 30)

yaml=$(cat <<EOF
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-rule-dev3
  namespace: dev3
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: nginx-external
  rules:
    - host: kubelab.ch
      http:
        paths:
          - path: "/04/03/$random"
            pathType: Prefix
            backend:
              service:
                name: webserver
                port:
                  number: 80
EOF
)

# Setup cluster
kubectl delete namespace dev3
kubectl create namespace dev3

echo "$yaml" | kubectl apply -f -

exit 0
