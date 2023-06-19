# Gather helm information

**Task:** There is already a helm release installed in the `podinfo` namespace. Inspect the release with `helm ls`. Write the following infos into a file called `helm_release.txt` in the home directory:
`NAME,NAMESPACE,REVISION,CHART,APP VERSION` (e.g. `wordpress,dev-team,1,wordpress-10.0.0,5.6.2`)

**Bonus**: inspect the release with `helm get manifest` and find the diff of the revision applied before.