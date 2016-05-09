#!/bin/bash

pushd output
openssl genrsa -out admin.key 2048
openssl req -new -key admin.key -out admin.csr -subj "/CN=kube-admin"
openssl x509 -req -in admin.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out admin.crt -days 3650
rm -f admin.csr
popd
./process-template.sh admin.kubeconfig.tmpl admin.kubeconfig
