#!/bin/bash

mkdir -p output
./create-ca.sh
./create-apiserver.sh
./create-node.sh
./create-admin.sh
