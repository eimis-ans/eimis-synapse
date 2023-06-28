variable "env_name" {
  type        = string
  description = "Name of the environment being used"
}

variable "service_name" {
  type        = string
  description = "the ID of the project on the OVH project web page"
}

variable "cluster_region" {
  type        = string
  description = "OVH region for the cluster (from https://www.ovhcloud.com/en/public-cloud/regions-availability/): GRA1, GRA7 ..."
}

variable "cluster_version" {
  type        = string
  description = "kubernetes version of the cluster"
}

variable "nodepool_flavor" {
  type        = string
  description = "flavor set to each node : b2-7, b2-15, R2-30, ..."
}

variable "desired_nodes" {
  type        = number
  description = "desired number of nodes"
}

variable "max_nodes" {
  type        = number
  description = "maximum number of nodes"
}

variable "min_nodes" {
  type        = number
  description = "minimum number of nodes"
}

variable "global_region" {
  description = "OVH global location for PostGreSQL and VPC"
  type        = string
}

variable "database_version" {
  description = "Version of postgresql"
  type        = string
}

variable "database_plan" {
  description = "OVH plan for database : essential = 1 nodes, business = 2 nodes, enterprise = 3 nodes"
  type        = string
}

variable "database_flavor" {
  description = "OVH flavor of the VM on which the database is installed : db1-4, db1-7, db1-15, db1-30, ..."
  type        = string
}

variable "database_disk" {
  description = "Size of the disk for the database VM"
  type        = string
}

variable "keycloak_db_name" {
  description = "database name for keycloak"
  type        = string
}

variable "keycloak_db_user" {
  description = "username for keycloak database"
  type        = string
}

variable "openstack_tenant" {
  description = "OVH OpenStack tenant"
  type        = string
}
variable "openstack_user" {
  description = "OVH OpenStack username"
  type        = string
}
variable "openstack_pwd" {
  description = "OVH OpenStack password for username"
  type        = string
}

variable "vlan_id" {
  description = "VLAN ID to avoid overlap between environment. By default it is max(VLAN IDs on the project) + 1, so they would surely overlap"
  type        = string
}

variable "vlan_cidr" {
  description = "Range of IP for the private network"
  type        = string
}