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

cd ..
echo "Delete everything in bucket $BUCKET..."

ACCESS=$(jq -r '.s3_media_repo_access_key.value' terraform/terraform_output.json)
SECRET=$(jq -r '.s3_media_repo_secret_key.value' terraform/terraform_output.json)
BUCKET=$(jq -r '.s3_media_repo_bucket_name.value' terraform/terraform_output.json)
URL="https://$AWS_S3_MEDIA_REPO_ENDPOINT"

docker run --rm \
  -e AWS_DEFAULT_REGION=gra \
  -e AWS_ENDPOINT_URL_S3=$URL \
  -e AWS_S3_MEDIA_REPO_ENDPOINT=$AWS_S3_MEDIA_REPO_ENDPOINT \
  -e AWS_ACCESS_KEY_ID=$ACCESS \
  -e AWS_SECRET_ACCESS_KEY=$SECRET \
  amazon/aws-cli:2.15.4 s3 rm s3://$BUCKET/ --recursive

echo "Done destroying"