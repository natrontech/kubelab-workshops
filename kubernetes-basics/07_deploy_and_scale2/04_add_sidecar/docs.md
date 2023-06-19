# Add Init Container to existing Pod

**Task:** In the `counting-service` namepsace is already a pod `counter` with a main container and a sidecar. Inspect the pod and find out what the sidecar does. Then add another sidecar to the pod with the following specs:

```yaml
name: count-log-2
image: busybox
args: [/bin/sh, -c, 'tail -n+1 -F /var/log/2.log']
```

If you add the sidecar correctly, you can check the logs of the sidecar container with `kubectl logs -n counting-service counter -c count-log-2 -f`.