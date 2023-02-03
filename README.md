# Synapse on Kubernetes
Make an Synapse/Matrix server work on a managed kubernetes server hosted by OVH

The Matrix-synapse stack is based on the work done by [Alexander Olofsson](https://gitlab.com/ananace) : 
https://gitlab.com/ananace/charts/-/tree/master/charts/matrix-synapse

## Installation
- Create a local.env.sh file that contains all the environment variables that should be used by : 
```bash
# configure access to S3 where tfstates are stored
export AWS_ACCESS_KEY_ID="<the access key id>"
export AWS_SECRET_ACCESS_KEY="<the secret access key>"
export AWS_S3_ENDPOINT="<the OVH s3 endpoint URL>"
export AWS_REGION="<the OVH s3 region>"
# configure access to OVH provider
export OVH_ENDPOINT="<the ovh endpoint>"
export OVH_APPLICATION_KEY="<the AK value>"
export OVH_APPLICATION_SECRET="<the AS value>"
export OVH_CONSUMER_KEY="<the CS value>"
# variables used by infrastructure components
export SERVICE_NAME="<the ID of the project on the OVH project web page>"
export CLUSTER_NAME="<name of the kubernetes cluster>"
export CLUSTER_REGION="<region of the cluster : GRA1, GRA7 ...>"
export CLUSTER_VERSION="<kubernetes version of the cluster: 1.23, 1.24, ...>"
export NODEPOOL_NAME="<Name of the node pool. '_' char is not allowed!>"
export NODEPOOL_FLAVOR="<flavor set to each node : b2-7, b2-15, R2-30, ...>"
```
Then source this file : 
```bash
source local.env.sh
```
- Generate a terraform.tfvars file based on values previouly set : 
```bash
sh scripts/generate_tfvars_file.sh
```
- Initialize the Terraform workspace
```bash
terraform init
```
- Create the Terraform execution plan to validate that everything is ok
```bash
terraform plan
```
- Apply the Terraform plan
```bash
terraform apply
```