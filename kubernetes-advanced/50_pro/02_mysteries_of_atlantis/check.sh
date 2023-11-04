#!/bin/bash

# Validate the Web Relic
web_service=$(kubectl get services web-service -n atlantis -o jsonpath='{.spec.ports[?(@.port==80)].port}')
web_deployment=$(kubectl get deployment web-app -n atlantis -o jsonpath='{.metadata.name}')
web_image=$(kubectl get deployment web-app -n atlantis -o jsonpath='{.spec.template.spec.containers[0].image}')

# Validate the Database of Knowledge
db_deployment=$(kubectl get deployment db-backend -n atlantis -o jsonpath='{.metadata.name}')
db_image=$(kubectl get deployment db-backend -n atlantis -o jsonpath='{.spec.template.spec.containers[0].image}')

# Validate the Guardian of Secrets
secret_data=$(kubectl get secret guardian-secret -n atlantis -o jsonpath='{.data.username}{.data.password}')

# Network Policy checks
network_policy=$(kubectl get networkpolicy db-access-policy -n atlantis -o jsonpath='{.metadata.name}')

# Checks
if [[ "$web_service" != "80" ]]; then
    echo "Incorrect port for web-service. Expected 80 but got $web_service."
    exit 1
fi

if [[ "$web_deployment" != "web-app" ]]; then
    echo "Web Relic (web-app) not found!"
    exit 1
fi

if [[ "$web_image" != "nginx:alpine" ]]; then
    echo "Incorrect web-app image. Expected nginx:alpine but got $web_image."
    exit 1
fi

if [[ "$db_deployment" != "db-backend" ]]; then
    echo "Database of Knowledge (db-backend) not found!"
    exit 1
fi

if [[ "$db_image" != "postgres:alpine" ]]; then
    echo "Incorrect db-backend deployment image. Expected postgres:alpine but got $db_image."
    exit 1
fi

if [[ "$secret_data" != "YWRtaW4=U2VjcmV0UGFzc3dvcmQ=" ]]; then
    echo "Guardian of Secrets has been tampered with!"
    exit 1
fi

if [[ "$network_policy" != "db-access-policy" ]]; then
    echo "Network Policy for protecting the Database of Knowledge not found!"
    exit 1
fi

echo "All checks passed. Atlantis has been successfully reawakened!"
