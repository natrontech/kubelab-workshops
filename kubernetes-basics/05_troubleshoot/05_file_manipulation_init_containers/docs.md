# Init Containers and File Manipulation

**Task:** The `snow` pod in the `winter` namespace has an init container (`prepare-file`) that should create a `data.txt` file with the content `Snowflakes are unique!`. The main container (`process-file`) should then read and print this file.

If you check the logs of the main container (`process-file`), you won't see the expected output. Your task is to troubleshoot and fix the issue without deleting the pod.
