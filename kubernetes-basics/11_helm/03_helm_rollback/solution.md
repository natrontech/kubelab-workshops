List all infos of the helm release:

```bash
helm ls
```

Get all previous revisions:

```bash
helm history dokuwiki
```

Perform a rollback to the previous revision and wait until all pods are ready:

```bash
helm rollback dokuwiki
```