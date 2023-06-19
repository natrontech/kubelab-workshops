List all infos of the helm release:

```bash
helm ls
```

To create the file `helm_release.txt` with the infos of the helm release, you can use the following (advanced) command or create the file manually:

```bash
 helm ls --no-headers -o json | jq -r '.[0].name + "," + .[0].namespace + "," + .[0].revision + "," + .[0].chart + "," + .[0].app_version' > helm_release.txt
```

To get the manifest of the helm release, use the following command:

```bash
helm get manifest podinfo > manifest.txt
```

To get the diff of the revision applied before, use the following command:

```bash
helm get manifest --revision 2 podinfo > manifest_revision_2.txt
diff manifest.txt manifest_revision_2.txt
```