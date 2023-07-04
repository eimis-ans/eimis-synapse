locals {
  #  nodes_count      = var.database_plan == "essential" ? 1 : var.database_plan == "business" ? 2 : var.database_plan == "entreprise" ? 3 : 0
  nodes_iterator = {
    essential  = ["1"],
    business   = ["1", "2"],
    entreprise = ["1", "2", "3"]
  }
  nodes_set = lookup(local.nodes_iterator, var.database_plan)
}

resource "ovh_cloud_project_database" "pg_database" {
  service_name = var.service_name
  description  = "PostGreSQL database for ${var.env_name}"
  engine       = "postgresql"
  version      = var.database_version
  plan         = var.database_plan
  flavor       = var.database_flavor
  disk_size    = var.database_disk

  dynamic "nodes" {
    for_each = toset(local.nodes_set)
    content {
      region = var.global_region
      #      network_id = openstack_networking_network_v2.private_network.id
      #      subnet_id  = openstack_networking_subnet_v2.subnet.id
    }
  }
}


resource "ovh_cloud_project_database_database" "keycloak" {
  service_name = ovh_cloud_project_database.pg_database.service_name
  engine       = ovh_cloud_project_database.pg_database.engine
  cluster_id   = ovh_cloud_project_database.pg_database.id
  name         = var.keycloak_db_name
}

resource "ovh_cloud_project_database_ip_restriction" "ip_restriction" {
  engine       = "postgresql"
  cluster_id   = ovh_cloud_project_database.pg_database.id
  service_name = ovh_cloud_project_database.pg_database.service_name
  ip           = "${var.vlan_cidr}.0/24"
}

resource "ovh_cloud_project_database_postgresql_user" "keycloak" {
  service_name = ovh_cloud_project_database.pg_database.service_name
  cluster_id   = ovh_cloud_project_database.pg_database.id
  name         = var.keycloak_db_user
  roles = [
    "replication"
  ]
  # Arbitrary string to change to trigger a password update.
  # Use 'terraform refresh' after 'terraform apply' to update the output with the new password.
  password_reset = "password-reset-on-18-01-2022"
}

