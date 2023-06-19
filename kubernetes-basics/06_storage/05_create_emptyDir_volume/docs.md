#  Create an emptyDir volume

**Task:** Get familiar with the concept of [emptyDir](https://kubernetes.io/docs/concepts/storage/volumes/#emptydir). Create a deployment called `debugger` in the namespace `dev-team` with the image `alpine:3.18` and mount an emptyDir volume to the path `/data`. Create a file in the directory `/data` and write some text into it. Delete the pod and wait until it is recreated. Check if the file still exists.
