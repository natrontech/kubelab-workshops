# Create a deployment

**Task:** Create a deployment called `web` with the image `nginx` in the `web-services` namespace.
Make sure, there are 2 replicas running and add a tcp readiness probe for port 80 with `initialDelaySeconds` set to `5` and `periodSeconds` set to `10`.
