Create the service account:

```bash
kubectl create sa pod-reader -n team-a
```

Create the role:

```bash
kubectl create role pod-role -n team-a --verb=get,list,create,update,delete --resource=pods
```

Create the role binding:

```bash
kubectl create rolebinding pod-role-binding -n team-a --role=pod-role --serviceaccount=team-a:pod-reader
```

Check if the service account has the correct permissions:

```bash
kubectl auth can-i get pods --as=system:serviceaccount:team-a:pod-reader
```

You also can use the declarative way to create the service account, role and role binding:

```yaml
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: pod-reader
  namespace: team-a
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pod-role
  namespace: team-a
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list", "create", "update", "delete"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: pod-role-binding
  namespace: team-a
roleRef:
    apiGroup: rbac.authorization.k8s.io
    kind: Role
    name: pod-role
subjects:
- kind: ServiceAccount
  name: pod-reader
  namespace: team-a
```