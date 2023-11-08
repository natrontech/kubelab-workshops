List all infos of the helm release:

```bash
helm ls -n dokuwiki
```

Get all previous revisions:

```bash
helm history -n dokuwiki dokuwiki
```

You should see the following error message in the revision 2: 

```bash
_Deployment.apps "dokuwiki" is invalid: spec.template.spec.containers[0].resources.requests: Invalid value: "300m": must be less than or equal to cpu limit
```

Perform a rollback to the previous revision and wait until all pods are ready:

```bash
helm rollback -n dokuwiki dokuwiki
```