This command gets all nodes in the cluster. The `--no-headers` flag removes the header from the output. The output is piped to the `wc` command which counts the lines in the output. This gives us the amount of nodes in the cluster.

```bash
kubectl get nodes --no-headers | wc -l > clusterinfo.txt
```
