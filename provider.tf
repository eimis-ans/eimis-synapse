terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.27.0"
    }
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.49.0"
    }
  }
}

# inspired by https://breadnet.co.uk/terraform-ovh-openstack/
# and https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs
# Configure the OpenStack Provider
provider "openstack" {
  auth_url            = "https://auth.cloud.ovh.net/v3/" # Authentication URL
  domain_name         = "default"                        # Domain name - Always at 'default' for OVHcloud
  region              = var.cluster_region               # or OS_REGION_NAME
  user_domain_name    = "Default"                        # or OS_USER_DOMAIN_NAME
  project_domain_name = "Default"                        # or OS_PROJECT_DOMAIN_NAME
  tenant_id           = var.service_name                 # or OS_TENANT_ID / OS_PROJECT_ID
  tenant_name         = var.openstack_tenant             # or OS_TENANT_NAME / OS_PROJECT_NAME
  user_name           = var.openstack_user               # or OS_USERNAME
  password            = var.openstack_pwd                # or OS_PASSWORD
}
