The secret key is divided into three fragments. Each fragment is stored in a different pod.
Use kubectl exec to enter each pod and search for the fragment.
The encryption method used is AES-256-CBC. You'll need the OpenSSL tool to decrypt it.
