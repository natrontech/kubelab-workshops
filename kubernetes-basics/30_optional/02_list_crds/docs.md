# List CRDs

Kubernetes is highly configurable and extensible. As a result, there is rarely a need to fork or submit patches to the Kubernetes project code. Instead, Kubernetes provides extension mechanisms that allow you to address common needs. One such mechanism is the Custom Resource Definition (CRD). CRDs allow you to add your own custom resources to the Kubernetes API. You can read more about CRDs in the [official documentation](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/).

**Task:** List all CRDs in the cluster and inspect them. Write the count of CRDs into the file `crd_count.txt`.