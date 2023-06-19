#!/bin/bash

service_name="frontend"
namespace="images"
local_port="8882"
remote_port="80"
target_url="http://localhost:$local_port"

# Start port-forwarding in the background
kubectl port-forward service/$service_name $local_port:$remote_port -n $namespace > /dev/null 2>&1 &

# Wait for port-forwarding to be established
sleep 2

# Check if the port-forwarding process is running
if ps -p $! > /dev/null; then
    echo "Successfully established port-forwarding for service $service_name"

    # Perform the curl request to the forwarded port and check the HTTP response code
    http_code=$(curl -s -o /dev/null -w "%{http_code}" $target_url)
    if [ "$http_code" -eq 200 ]; then
        echo "Service $service_name is available and returned HTTP code 200"
    else
        echo "Service $service_name is available but returned HTTP code $http_code"
        exit 1
    fi

else
    echo "Failed to establish port-forwarding for service $service_name"
    exit 1
fi

# Stop the port-forwarding process
kill $! > /dev/null 2>&1

exit 0
