```bash
server_ip=$(kubectl get service server -n exercise -o jsonpath='{.spec.clusterIP}')
server_output=$(kubectl exec client -n exercise -- wget -qO- $server_ip:1234)

echo $server_output > output.txt
```