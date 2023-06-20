Then you can create a pod using a yaml file with the `securityContext` field set.
You can find the documentation [here](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/).

Do determine the UID of the container, you can have a look at the Dockerfile of the image (link to Dockerfile [here](https://github.com/nginxinc/docker-nginx-unprivileged/blob/main/Dockerfile-debian.template))