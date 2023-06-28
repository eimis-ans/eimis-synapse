terraform {
  backend "s3" {
    key                         = "terraform.tfstate"
    skip_credentials_validation = true
    skip_region_validation      = true
  }
  openstack = {
    source  = "terraform-provider-openstack/openstack"
    version = "~> 1.49.0"
  }
  required_version = ">= 1.4.6"
}
