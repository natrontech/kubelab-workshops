#!/bin/bash

# Set up the Kubernetes environment for the quest
kubectl delete namespace enigma-realm --ignore-not-found=true --force --grace-period=0
kubectl create namespace enigma-realm

# Generate random secret key fragments
key_part1=$(openssl rand -hex 16)
key_part2=$(openssl rand -hex 16)
key_part3=$(openssl rand -hex 16)
combined_key="$key_part1-$key_part2-$key_part3"

# Encrypt flag using the secret key
flag="K8S-ENIGMA-FLAG-67890"
encrypted_flag=$(echo "$flag" | openssl enc -aes-256-cbc -a -salt -pass pass:$combined_key)

# Deploy pods with fragments of the secret key, making them sleep for 5 minutes
kubectl run fragment1-pod --image=alpine -n enigma-realm -- /bin/sh -c "echo $key_part1 > /tmp/fragment.txt; sleep 300"
kubectl run fragment2-pod --image=alpine -n enigma-realm -- /bin/sh -c "echo $key_part2 > /tmp/fragment.txt; sleep 300"
kubectl run fragment3-pod --image=alpine -n enigma-realm -- /bin/sh -c "echo $key_part3 > /tmp/fragment.txt; sleep 300"

# The encrypted flag is stored in a config map
kubectl create configmap cipher-map -n enigma-realm --from-literal=encrypted-flag="$encrypted_flag"
