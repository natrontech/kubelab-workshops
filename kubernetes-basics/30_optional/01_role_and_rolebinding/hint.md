You can test the permissions with the following command:

```bash
kubectl auth can-i get pods -n team-a --as=system:serviceaccount:team-a:pod-reader
```