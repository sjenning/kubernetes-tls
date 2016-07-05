# Kubernetes TLS Generator

I struggled finding all the openssl incantations for generating a CA keys, certs, and kubeconfigs for all the Kuberenetes components.  Then I found this excellent documentation.

https://coreos.com/kubernetes/docs/latest/openssl.html

But it still took a lot of typo-prone steps to get it done.

Here are some simple bash scripts to help in the process.

```bash

cp vars.example vars

# edit vars for your enviroment

./build.sh
```

If you already have a CA generated just copy the key and cert into the ```output``` directory as ```ca.key``` and ```ca.crt``` and run the one-off scripts to generate the bits you need.

```
# generate the apiserver key and cert
./create-apiserver.sh

# generate a node key, cert, and kubeconfig
./create-node.sh

# generate a admin user key, cert, and kubeconfig
./create-admin.sh
```
