You can get the Helm version using the following command:

```bash
helm version
```

One-liner:

```bash
helm version --template {{.Version}} > helm_version.txt
```
