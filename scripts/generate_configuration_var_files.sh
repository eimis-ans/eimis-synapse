#!/bin/bash

# this script is intended to generate the files and vars needed to let the configuration step work with Ansible :
# - kubeconfig file from the output of terraform
# - connexion to database from the output of terraform
# - group_vars/all.yml needed by Ansible
echo "Getting terraform outputs"
terraform output --raw kubeconfig >local/kubeconfig.yml
terraform output -json >terraform_output.json
echo "done."

chmod 600 local/kubeconfig.yml
export SYNAPSE_DATABASE_URL=$(jq -r ". | .\"synapse_databse_uri\".value" terraform_output.json)
export SYNAPSE_DB_PASSWORD=$(jq -r ". | .\"synapse_db_password\".value" terraform_output.json)
export SYNAPSE_DB_HOST=$(jq -r ". | .\"synapse_db_host\".value" terraform_output.json)
export SYNAPSE_DB_PORT=$(jq -r ". | .\"synapse_db_port\".value" terraform_output.json)
export AVNADMIN_DB_PASSWORD=$(jq -r ". | .\"avnadmin_db_password\".value" terraform_output.json)

envsubst <"ansible/group_vars/env_vars.tmpl" >ansible/group_vars/all.yml
