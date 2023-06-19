You can use the `kubectl create serviceaccount` command.
Then you can create a pod using a yaml file with the `serviceAccountName` field set to the name of the service account you created.
You can find the service account link documentation [here](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/).
