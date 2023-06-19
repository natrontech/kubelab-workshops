# Add Init Container to existing Pod

**Task:** In the `myapp` namepsace is a postgres and a nginx pod. Add an init container to the *nginx* pod.
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