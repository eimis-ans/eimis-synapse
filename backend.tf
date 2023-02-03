terraform {
  backend "s3" {
    bucket = "terraform-states-hp-sandbox"
    key    = "terraform.tfstate"
    region = "gra"
    #or sbg or any activated high performance storage region
    endpoint = "s3.gra.perf.cloud.ovh.net"
    skip_credentials_validation = true
    skip_region_validation = true
  }
}
