output "kubeconfig" {
  value     = ovh_cloud_project_kube.k8s_element_cluster.kubeconfig
  sensitive = true
}

output "clusterid" {
  value = ovh_cloud_project_kube.k8s_element_cluster.id
}

output "keycloak_user_password" {
  value     = ovh_cloud_project_database_postgresql_user.keycloak.password
  sensitive = true
}

output "synapse_db_password" {
  value     = ovh_cloud_project_database_postgresql_user.synapse.password
  sensitive = true
}

output "synapse_db_host" {
  value     = ovh_cloud_project_database.pg_database.endpoints.0.domain
  sensitive = true
}

output "synapse_db_port" {
  value     = ovh_cloud_project_database.pg_database.endpoints.0.port
  sensitive = true
}

output "synapse_databse_uri" {
  value = join("", [
    "postgres://", ovh_cloud_project_database_postgresql_user.synapse.name, ":",
    ovh_cloud_project_database_postgresql_user.synapse.password, "@",
    ovh_cloud_project_database.pg_database.endpoints.0.domain, ":",
    ovh_cloud_project_database.pg_database.endpoints.0.port, "/defaultdb?sslmode=require"
  ])
  sensitive = true
}