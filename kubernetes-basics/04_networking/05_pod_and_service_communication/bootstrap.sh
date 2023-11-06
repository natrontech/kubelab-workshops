#!/bin/bash

# Delete the output.txt file if it exists
rm -f ~/exercise/output.txt
echo "File output.txt deleted."

# Setup cluster
kubectl delete namespace exercise
kubectl create namespace exercise

# Create pod1 with a server returning a random number
random_number=$((1 + RANDOM % 100))
kubectl run server --image=busybox --namespace=exercise -- /bin/sh -c "while true; do echo -e \"HTTP/1.1 200 OK\n\n$random_number\" | nc -l -p 1234; done"

# Create pod2 to perform the request
kubectl run client --image=busybox --namespace=exercise -- /bin/sh -c "while true; do sleep 10; done"

# Create a service to expose pod1
kubectl expose pod server --port=1234 --namespace=exercise

exit 0
