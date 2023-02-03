variable "service_name" {
  type        = string
  description = "the ID of the project on the OVH project web page"
}

variable "cluster_name" {
  type        = string
  description = "name of the kubernetes cluster"
}

variable "cluster_region" {
  type        = string
  description = "region of the cluster : GRA1, GRA7 ..."
}

variable "cluster_version" {
  type        = string
  description = "kubernetes version of the cluster"
}

variable "nodepool_name" {
  type        = string
  description = "Name of the node pool. Warning: '_' char is not allowed!"
}

variable "nodepool_flavor" {
  type        = string
  description = "flavor set to each node : b2-7, b2-15, R2-30, ..."
}