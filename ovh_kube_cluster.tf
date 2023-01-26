resource "ovh_cloud_project_kube" "my_kube_cluster" {
  service_name = "${var.service_name}"
  name         = "my_kube_cluster"
  region       = "GRA7"
  version      = "1.22"
}

resource "ovh_cloud_project_kube_nodepool" "node_pool" {
  service_name  = "${var.service_name}"
  kube_id       = ovh_cloud_project_kube.my_kube_cluster.id
  name          = "my-pool" //Warning: "_" char is not allowed!
  flavor_name   = "b2-7"
  desired_nodes = 3
  max_nodes     = 3
  min_nodes     = 3
}