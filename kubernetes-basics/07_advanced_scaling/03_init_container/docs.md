# Add Init Container to existing Deployment

**Task:** In the `myapp` namespace is a postgres and a nginx pod. Add an init container in the *myapp* deployment.
Use following infos for the init container:

```yaml
name: wait-for-db
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