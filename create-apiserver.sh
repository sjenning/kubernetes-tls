#!/bin/bash

source vars
pushd output
openssl genrsa -out apiserver.key 2048
openssl req -new -key apiserver.key -out apiserver.csr -subj "/CN=kube-apiserver" -config ../openssl-apiserver.cnf
openssl x509 -req -in apiserver.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out apiserver.crt -days 3650 -extensions v3_req -extfile ../openssl-apiserver.cnf
rm -f apiserver.csr
