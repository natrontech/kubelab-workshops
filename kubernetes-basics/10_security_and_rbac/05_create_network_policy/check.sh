#!/bin/bash

# Check if the pod exists with the specified name and image

namespace="database"

np_name=`kubectl get networkpolicy db-access -n $namespace -o jsonpath='{.metadata.name}'`
np_select=`kubectl get networkpolicy db-access -n $namespace -o jsonpath='{.spec.podSelector.matchLabels}'`
np_tcp_ports=`kubectl get networkpolicy db-access -n $namespace -o jsonpath='{.spec.ingress[0].ports[0].port}'`
np_from=`kubectl get networkpolicy db-access -n $namespace -o jsonpath='{.spec.ingress[0].from[0].podSelector.matchLabels}'`
np_policy_types=`kubectl get networkpolicy db-access -n $namespace -o jsonpath='{.spec.policyTypes}'`

if [ "$np_name" != "db-access" ]; then
    echo "Network policy has the wrong name."
    exit 1
fi

if [ "$np_policy_types" != '["Ingress"]' ]; then
    echo "Network policy has the wrong policy type."
    exit 1
fi

if [ "$np_select" != '{"type":"database"}' ]; then
    echo "Network policy has the wrong selector."
    exit 1
fi

if [ "$np_tcp_ports" != "3306" ]; then
    echo "Network policy has the wrong port."
    exit 1
fi

if [ "$np_from" != '{"type":"web"}' ]; then
    echo "Network policy has the wrong from."
    exit 1
fi

echo "Network policy looks good"
exit 0