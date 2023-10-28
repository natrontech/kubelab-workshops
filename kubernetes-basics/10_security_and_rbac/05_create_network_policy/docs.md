# Create a network policy

**Task:** Create a network policy called `db-access` in the `database` namespace that follows these rules:
- The policy should only apply to Pods with the label `type=database`.
- Allow TCP Port `3306` from any Pod with the label `type=web`.
- Block all other traffic going towards the `type=database` Pods.