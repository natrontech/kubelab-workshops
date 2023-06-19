You can use the `kubectl create secret generic` command with the `--from-literal` argument.
If you want to create a secret from a yaml file, you have to use `stringData` instead of `data`.
You can find the Secret documentation [here](https://kubernetes.io/docs/concepts/configuration/secret/).
