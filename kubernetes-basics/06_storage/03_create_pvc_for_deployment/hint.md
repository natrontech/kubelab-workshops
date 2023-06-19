**hint**: Create a yaml file for the persistent volume claim and apply it with `kubectl apply -f <file>`. You can find the documentation [here](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolumeclaim).
The alpine image will complete immediately, so you must override the command (e.g. command: `["/bin/sh", "-c", "sleep 3600"]`)
