You can use the `kubectl describe service` command to list the failing service for more info. It might be a good idea to check the label selectors of the service and compare the with the labels of the deployment.
You can find the documentation [here](https://kubernetes.io/docs/tasks/debug/debug-application/debug-service/).
