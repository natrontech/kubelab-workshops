You can create a yaml file and apply it using `kubectl apply -f <file>.yaml`.
Check the `.spec.containers.readinessProbe` field for more information.
You can find the documentation [here](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-a-tcp-liveness-probe).
