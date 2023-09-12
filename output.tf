output "kubeconfig" {
  value     = ovh_cloud_project_kube.k8s_element_cluster.kubeconfig
  sensitive = true
}

output "clusterid" {
  value = ovh_cloud_project_kube.k8s_element_cluster.id
}

output "synapse_db_password" {
  value     = ovh_cloud_project_database_postgresql_user.synapse.password
  sensitive = true
}

output "avnadmin_db_password" {
  value     = ovh_cloud_project_database_postgresql_user.avnadmin.password
  sensitive = true
}

output "synapse_db_host" {
  value     = ovh_cloud_project_database.pg_database.endpoints[0].domain
  sensitive = true
}

output "synapse_db_port" {
  value     = ovh_cloud_project_database.pg_database.endpoints[0].port
  sensitive = true
}

output "synapse_databse_uri" {
  value = join("", [
    "postgres://", ovh_cloud_project_database_postgresql_user.synapse.name, ":",
    ovh_cloud_project_database_postgresql_user.synapse.password, "@",
    ovh_cloud_project_database.pg_database.endpoints[0].domain, ":",
    ovh_cloud_project_database.pg_database.endpoints[0].port, "/defaultdb?sslmode=require"
  ])
  sensitive = true
}

output "s3_media_repo_access_key" {
  description = "the access key that have been created by the terraform script"
  value       = ovh_cloud_project_user_s3_credential.s3_admin_cred.access_key_id
}

output "s3_media_repo_secret_key" {
  description = "the secret key that have been created by the terraform script"
  value       = ovh_cloud_project_user_s3_credential.s3_admin_cred.secret_access_key
  sensitive   = true
}

output "s3_media_repo_url" {
  description = "the url of the s3 media repo"
  value       = "https://${var.env_name}-${var.media_repo_bucket_name}.${var.s3_media_repo_endpoint}/"
}
