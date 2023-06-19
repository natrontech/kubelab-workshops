# StatefulSet and persistentVolumeClaimTemplates

**Task:** In the namespace `stateful-app` is a statefulset `webapp` with one replica. Edit the statefulset and add a pvc with `10Gi` storage capacity and access mode `ReadWriteOnce`. The name of the pvc should be `data`, the storageclass `hcloud-volumes`. The path to mount the pvc is `/data`.

**Important:** Use `volumeClaimTemplates` instead of `volumes` (see [documentation](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset)).