resource "ovh_cloud_project_kube" "k8s_element_cluster" {
  service_name = var.service_name
  name         = var.cluster_name
  region       = var.cluster_region
  version      = var.cluster_version
}

resource "ovh_cloud_project_kube_nodepool" "node_pool" {
  service_name  = var.service_name
  kube_id       = ovh_cloud_project_kube.k8s_element_cluster.id
  name          = var.nodepool_name
  flavor_name   = var.nodepool_flavor
  desired_nodes = 3
  max_nodes     = 3
  min_nodes     = 3
}