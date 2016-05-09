#!/bin/bash

source vars
sed "s/APISERVER_NAME/$APISERVER_NAME/" $1 | sed "s/NODE_NAME/$NODE_NAME/" > output/$2
