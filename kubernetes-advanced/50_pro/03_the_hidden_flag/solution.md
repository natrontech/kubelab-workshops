# Solution to the Kubernetes Enigma Challenge

## 1. Retrieve Key Fragments

First, you need to get the key fragments from the three pods.

```bash
# Get fragment from fragment1-pod
kubectl -n enigma-realm exec fragment1-pod -- cat /tmp/fragment.txt

# Get fragment from fragment2-pod
kubectl -n enigma-realm exec fragment2-pod -- cat /tmp/fragment.txt

# Get fragment from fragment3-pod
kubectl -n enigma-realm exec fragment3-pod -- cat /tmp/fragment.txt
```

## 2. Combine the Key Fragments

Combine the fragments in the order you retrieved them:

```bash
# Assuming the fragments are ABCDE, FGHIJ, and KLMNO respectively
combined_key="ABCDE-FGHIJ-KLMNO"
echo $combined_key
```

## 3. Decrypt the Flag

First, retrieve the encrypted flag from the config map:

```bash
encrypted_flag=$(kubectl -n enigma-realm get configmap cipher-map -o=jsonpath='{.data.encrypted-flag}')
```

Then, use the `openssl` command to decrypt the flag:

```bash
echo $encrypted_flag | openssl enc -aes-256-cbc -a -d -salt -pass pass:$combined_key
```

## 4. Store the Flag

Finally, store the flag in the `~/exercise/flag.txt` file:

```bash
echo $encrypted_flag | openssl enc -aes-256-cbc -a -d -salt -pass pass:$combined_key > ~/exercise/flag.txt
```
