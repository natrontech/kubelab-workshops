**hint**:  You can create a yaml file and apply it using `kubectl apply -f <file>.yaml`.
A good command to use is `echo "HELLO"` like so:
```yaml
(...)
  command: ["/bin/sh"]
  args: ["-c", "echo HELLO"]
(...)
```
You can find the jobs documentation [here](https://kubernetes.io/docs/concepts/workloads/controllers/job/).
Run a command in a shell is documented [here](https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#run-a-command-in-a-shell)
