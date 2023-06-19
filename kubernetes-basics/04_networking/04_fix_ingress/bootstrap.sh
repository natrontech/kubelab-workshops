#!/bin/bash

random=$(openssl rand -hex 30)

yaml=$(cat <<EOF
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-rule-dev4
  namespace: dev4
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  ingressClassName: nginx
  rules:
    - host: demo.swisscom.k8s.natron.cloud
      http:
        paths:
          - path: "/04/04/$random"
            pathType: Prefix
            backend:
              service:
                name: bckend
                port:
                  number: 80
EOF
)

yaml2=$(cat <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello
  namespace: dev4
spec:
  replicas: 2
  selector:
    matchLabels:
      app: hello
  template:
    metadata:
      labels:
        app: hello
    spec:
      containers:
      - name: hello
        image: nginx
        ports:
        - containerPort: 80
EOF
)

yaml3=$(cat <<EOF
apiVersion: v1
kind: Service
metadata:
  name: backend
  namespace: dev4
spec:
  selector:
    app: hello
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 80
EOF
)

# Setup cluster
kubectl delete namespace dev4
kubectl create namespace dev4

echo "$yaml" | kubectl apply -f -
echo "$yaml2" | kubectl apply -f -
echo "$yaml3" | kubectl apply -f -

exit 0
