terraform {
  backend "s3" {
    key                         = "terraform.tfstate"
    skip_credentials_validation = true
    skip_region_validation      = true
  }
  required_version = ">= 1.4.6"
}
