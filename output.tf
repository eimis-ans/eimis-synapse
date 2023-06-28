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