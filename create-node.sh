#!/bin/bash

source vars
pushd output
openssl genrsa -out ${NODE_NAME}.key 2048
openssl req -new -key ${NODE_NAME}.key -out ${NODE_NAME}.csr -subj "/CN=kube-node" -config ../openssl-node.cnf
openssl x509 -req -in ${NODE_NAME}.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out ${NODE_NAME}.crt -days 3650 -extensions v3_req -extfile ../openssl-node.cnf
rm ${NODE_NAME}.csr
popd
./process-template.sh node.kubeconfig.tmpl $NODE_NAME.kubeconfig
