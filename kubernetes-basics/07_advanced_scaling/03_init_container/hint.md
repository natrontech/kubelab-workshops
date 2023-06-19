You can find the documentation about init containers [here](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/). **Important:** You cannot add an init container to an existing pod, so you will have to edit the deployment manifest and apply it again.

```yaml
(...)
    spec:
      initContainers:
      - name: wait-for-db
        image: postgres:latest
        env:
        - name: PGPASSWORD
          value: mypassword
        command:
        - /bin/sh
        - -c
        - |
          until pg_isready -h postgres -U myuser -d  mydatabase; do
            echo "Waiting for the database to be  available..."
            sleep 2
          done
```
