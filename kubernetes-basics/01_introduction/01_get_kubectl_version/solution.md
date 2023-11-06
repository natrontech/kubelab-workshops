This command gets the client version of kubectl and writes it to a file called `kubectl_client_version.txt`.

```bash
kubectl version | awk '/Client Version: / { print $NF }' > kubectl_client_version.txt 
```
