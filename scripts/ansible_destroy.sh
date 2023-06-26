#!/bin/bash

# this script is intended to destroy some chart/pods on kubernetes
# so that the element they created (DNS records for example) are also destroyed

# Configure kubectl
export WORKING_DIRECTORY=$(pwd)
echo "WORKING_DIRECTORY=${WORKING_DIRECTORY}"
export ANSIBLE_ROOT="${WORKING_DIRECTORY}/ansible"
export KUBECONFIG="${WORKING_DIRECTORY}/local/kubeconfig.yml"
echo "KUBECONFIG=${KUBECONFIG}"

cd $ANSIBLE_ROOT

# Configure ansible
echo "--- ansible-galaxy install collections ---"
ansible-galaxy collection install -r "requirements.yml"

# Run ansible playbook
echo "--- playbook destroy ---"
ansible-playbook destroy-k8s.yml