You can use the `kubectl label` command to edit a pod. You can find the documentation [here](https://kubernetes.io/docs/reference/kubectl/#operations).

You can also use the `kubectl edit` command to edit a pod.
Set the environment variable `KUBE_EDITOR` to `nano` to use the nano editor instead of vim.

```bash
export KUBE_EDITOR=nano
```
