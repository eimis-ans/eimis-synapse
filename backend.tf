terraform {
  backend "s3" {
    bucket = "terraform-states-sandbox"
    key    = "tfstate.tf"

    force_path_style            = true
    skip_region_validation      = true
    skip_credentials_validation = true
    max_retries                 = 15
  }
}
