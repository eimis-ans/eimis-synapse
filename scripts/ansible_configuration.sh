#!/bin/bash

# this script is intended to run all the configuration stage (after the provisioning stage)
# - configure kubectl
# - configure ansible
# - run ansible playbook

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
echo "--- playbook configuration ---"
ansible-playbook configuration.yml "$@"