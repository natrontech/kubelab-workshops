# Storing logs

**Task:** There is an application called `logger` in the namespace `logs`.
Create a hostPath mount for the pod `logger` that mounts the file `/var/log/syslog` from the host to the container path `/data/access.log`.
Name the volume `logger-volume`.
