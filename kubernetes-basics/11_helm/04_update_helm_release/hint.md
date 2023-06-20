See all available values for the wordpress chart on the [bitnami helm chart documentation](https://github.com/bitnami/charts/tree/main/bitnami/wordpress).

**Important:** There are already some user supplied values defined, get the values with `helm get values <release-name> > values.yaml`. You have to add the new values to the existing values and update the release with all values.

You can update the release with custom values using the `--values` flag as follows:

```bash
helm upgrade --namespace blog --values values.yaml my-blog oci://registry-1.docker.io/bitnamicharts/wordpress
```