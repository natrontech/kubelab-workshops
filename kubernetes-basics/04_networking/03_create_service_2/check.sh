#!/bin/bash

ingress_endpoint=`kubectl get ingress -n dev3 -o jsonpath='{"https://"}{.items[0].spec.rules[0].host}{.items[0].spec.rules[0].http.paths[0].path}'`

# curl the url and check if it return a 200 OK, exit 0 if this is the case
response=`curl -s -o /dev/null -w "%{http_code}" $ingress_endpoint`

if [ "$response" != "200" ]; then
    echo "Ingress does not return a 200 OK."
    exit 1
fi

echo "Ingress returns a 200 OK."
exit 0
