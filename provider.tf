terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.27.0"
    }
    # inspired by https://breadnet.co.uk/terraform-ovh-openstack/
    # and https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs
    openstack = {
      auth_url            = "https://auth.cloud.ovh.net/v3/"            # Authentication URL
      domain_name         = "default"                                   # Domain name - Always at 'default' for OVHcloud
      region              = var.region                                  # or OS_REGION_NAME
      user_domain_name    = "Default"                                   # or OS_USER_DOMAIN_NAME
      project_domain_name = "Default"                                   # or OS_PROJECT_DOMAIN_NAME
      tenant_id           = var.project_id[terraform.workspace]         # or OS_TENANT_ID / OS_PROJECT_ID
      tenant_name         = var.openstack_tenant[terraform.workspace]   # or OS_TENANT_NAME / OS_PROJECT_NAME
      user_name           = var.openstack_user[terraform.workspace]     # or OS_USERNAME
      password            = var.openstack_password[terraform.workspace] # or OS_PASSWORD
    }
  }
}
