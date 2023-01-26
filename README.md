# element-on-kubernetes
Make an Element/Matrix server work on a managed kubernetes server hosted by OVH

The Matrix-synapse stack is based on the work done by [Alexander Olofsson](https://gitlab.com/ananace) : 
https://gitlab.com/ananace/charts/-/tree/master/charts/matrix-synapse

## Installation
- Create a ovh.env file that contains all the environment variables that should be used by the OVH provider : 
```bash
# env file manually created
export OVH_ENDPOINT="<the ovh endpoint>"
export OVH_APPLICATION_KEY="<the AK value>"
export OVH_APPLICATION_SECRET="<the AS value>"
export OVH_CONSUMER_KEY="<the CS value>"
```
Then source this file : 
```bash
source ovh.env
```
- Create a terraform.tfvars file that contains all the variable values : 
```bash
service_name="<the project ID value>" 
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