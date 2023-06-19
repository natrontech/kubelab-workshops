**hint**: 

You can get the ingress host and path using the following command:
```bash
echo "$(kubectl get ingress -n dev3 -o jsonpath='{"http://"}{.items[0].spec.rules[0].host}{.items[0].spec.rules[0].http.paths[0].path}')"
```

Documentation can be found [here](https://kubernetes.io/docs/concepts/services-networking/ingress/).
