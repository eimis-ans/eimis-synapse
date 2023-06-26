#!/bin/bash

# this script is intended generate the kubeconfig file from the output of terraform
terraform output --raw kubeconfig > local/kubeconfig.yml
chmod 600 local/kubeconfig.yml