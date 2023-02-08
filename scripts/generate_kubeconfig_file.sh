#!/bin/bash

# this script is intended generate the kubeconfig file from the output of terraform
terraform output --raw kubeconfig > kubeconfig.yml
chmod 600 kubeconfig.yml