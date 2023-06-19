#!/bin/bash

# Check if the pod exists with the specified name and image

namespace="web-services"
deplname="web"

count=`kubectl get deployment $deplname -n $namespace -o jsonpath="{.spec.replicas}"`
image=`kubectl get deployment $deplname -n $namespace -o jsonpath="{.spec.template.spec.containers[].image}"`
tcp_readiness_port=`kubectl get deployment $deplname -n $namespace -o jsonpath="{.spec.template.spec.containers[].readinessProbe.tcpSocket.port}"`
tcp_readiness_initial_delay=`kubectl get deployment $deplname -n $namespace -o jsonpath="{.spec.template.spec.containers[].readinessProbe.initialDelaySeconds}"`
tcp_readiness_period=`kubectl get deployment $deplname -n $namespace -o jsonpath="{.spec.template.spec.containers[].readinessProbe.periodSeconds}"`


if [ "$count" != 2 ]; then
    echo "Deployment does not have 2 replicas."
    exit 1
fi

if [ "$image" != "nginx" ]; then
    echo "Deployment does not exist with the specified name and image."
    exit 1
fi

if [ "$tcp_readiness_port" != "80" ]; then
    echo "Deployment does not have readinessProbe with tcpSocket port 80."
    exit 1
fi

if [ "$tcp_readiness_initial_delay" != "5" ]; then
    echo "Deployment does not have readinessProbe with initialDelaySeconds 5."
    exit 1
fi

if [ "$tcp_readiness_period" != "10" ]; then
    echo "Deployment does not have readinessProbe with periodSeconds 10."
    exit 1
fi

echo "Looks good"
exit 0