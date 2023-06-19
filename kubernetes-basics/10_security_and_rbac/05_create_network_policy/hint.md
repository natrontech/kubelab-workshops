You can create a network policy using a yaml file.
In this case we need a `NetworkPolicy` object that uses a `podSelector` with `matchLabels`.
Then we need to specify the `ingress` field with a list of `from` objects including a `podSelector` with `matchLabels`.
You can find the documentation [here](https://kubernetes.io/docs/concepts/services-networking/network-policies/).
