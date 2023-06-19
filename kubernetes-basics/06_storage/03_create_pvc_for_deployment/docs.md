# Creating persistent volume claims for deployments

**Task:** Create a persistent volume claim in the namespace `storage-app` called `data`. Use the storageclass `hcloud-volumes`, define a capacity of `10Gi` and access mode `ReadWriteOnce`. Create then a pod called `storage-pod` with the image `alpine` and mount the pvc to the path `/data`.

