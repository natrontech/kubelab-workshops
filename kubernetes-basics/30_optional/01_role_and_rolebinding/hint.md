You can test the permissions with the following command:

```bash
kubectl auth can-i get pods --as=system:serviceaccount:team-a:pod-reader
```