terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.31.0"
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
  auth_url    = "https://auth.cloud.ovh.net/v3/" # Authentication URL
  domain_name = "default"                        # Domain name - Always at 'default' for OVHcloud
}
