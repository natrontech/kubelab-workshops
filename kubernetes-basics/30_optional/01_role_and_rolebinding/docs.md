# Create a Role and RoleBinding

**Task:** Deploy all following objects to the nameaspace `team-a`. Create a `ServiceAccount` with name `pod-reader`. Then create a `Role` with the name `pod-role` and the following rules:

```yaml
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list", "create", "update", "delete"]
```

Finally create a `RoleBinding` with the name `pod-role-binding` to bind the `Role` to the `ServiceAccount`.
