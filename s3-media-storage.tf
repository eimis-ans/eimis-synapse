resource "ovh_cloud_project_user" "s3_admin_user" {
  service_name = var.service_name
  description  = "user that is used to create S3 access key"
  role_name    = "objectstore_operator"
}

resource "ovh_cloud_project_user_s3_credential" "s3_admin_cred" {
  service_name = var.service_name
  user_id      = ovh_cloud_project_user.s3_admin_user.id
}

resource "aws_s3_bucket" "media_repo_bucket" {
  bucket = "${var.env_name}_synapse-media-storage"
}
