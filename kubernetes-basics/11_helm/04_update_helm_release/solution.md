Inspect the user supplied values and save them to a file:
```bash
helm get values my-blog -o yaml > values.yaml
```

Add the new values for replicaCount and image, resulting in the following values file:

```yaml
mariadb:
  primary:
    persistence:
      enabled: false
persistence:
  enabled: false
service:
  type: ClusterIP
replicaCount: 2
image:
  tag: 6-debian-11
```

Update the release with the new values:

```bash
helm upgrade --namespace blog --values values.yaml my-blog oci://registry-1.docker.io/bitnamicharts/wordpress
```