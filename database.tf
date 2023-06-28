
# Inspired by : https://github.com/ovh/public-cloud-examples/tree/main/databases/pgsql
# This example is a bit different and older : https://github.com/ovh/public-cloud-databases-examples/tree/main/databases/postgresql/terraform/hello-world
resource "ovh_cloud_project_database" "pg_database" {
  #   depends_on  = [openstack_networking_network_v2.private_network]
  service_name = var.project_id[terraform.workspace]
  description  = "${terraform.workspace} PostGreSQL Cluster"
  engine       = "postgresql" # one of [postgresql cassandra mysql kafka kafkaConnect]
  version      = "15"
  plan         = "business" # 2 nodes, read replicas planned : https://docs.ovh.com/gb/en/publiccloud/databases/postgresql/capabilities/#plans
  flavor       = "db1-7"    # https://docs.ovh.com/gb/en/publiccloud/databases/postgresql/capabilities/#hardware-resources_1
  nodes {
    region     = var.global_region
    network_id = openstack_networking_network_v2.private_network.id
    subnet_id  = openstack_networking_subnet_v2.subnet.id
  }
  nodes {
    region     = var.global_region
    network_id = openstack_networking_network_v2.private_network.id
    subnet_id  = openstack_networking_subnet_v2.subnet.id
  }
}

resource "ovh_cloud_project_database" "postgresql" {
  service_name = var.service_name
  description = "PostGreSQL database for EIMIS"
  engine = "postgresql"
  version = "15"
  plan = "essential"

  flavor = "db1-4"

  disk_size = 80

  nodes {
    region = "SBG"
  }
}













resource "ovh_cloud_project_database_database" "auth-server" {
  service_name = ovh_cloud_project_database.pg_database.service_name
  engine       = ovh_cloud_project_database.pg_database.engine
  cluster_id   = ovh_cloud_project_database.pg_database.id
  name         = "auth-server"
}

resource "ovh_cloud_project_database_database" "backend" {
  service_name = ovh_cloud_project_database.pg_database.service_name
  engine       = ovh_cloud_project_database.pg_database.engine
  cluster_id   = ovh_cloud_project_database.pg_database.id
  name         = "backend"
}

resource "ovh_cloud_project_database_ip_restriction" "ip_restriction" {
  engine       = "postgresql"
  cluster_id   = ovh_cloud_project_database.pg_database.id
  service_name = ovh_cloud_project_database.pg_database.service_name
  ip           = "192.168.12.0/24"
}

resource "ovh_cloud_project_database_postgresql_user" "backend" {
  service_name = ovh_cloud_project_database.pg_database.service_name
  cluster_id   = ovh_cloud_project_database.pg_database.id
  name         = "backend" # 'postgres' is a reserved user, detailed message taken from API https://eu.api.ovh.com/console/#/cloud/project/%7BserviceName%7D/database/postgresql/%7BclusterId%7D/user~POST
  roles        = ["replication"]
  # Arbitrary string to change to trigger a password update.
  # Use 'terraform refresh' after 'terraform apply' to update the output with the new password.
  password_reset = "password-reset-on-18-01-2022"
}

resource "ovh_cloud_project_database_postgresql_user" "auth" {
  service_name = ovh_cloud_project_database.pg_database.service_name
  cluster_id   = ovh_cloud_project_database.pg_database.id
  name         = "auth" # 'postgres' is a reserved user, detailed message taken from API https://eu.api.ovh.com/console/#/cloud/project/%7BserviceName%7D/database/postgresql/%7BclusterId%7D/user~POST
  roles        = ["replication"]
  # Arbitrary string to change to trigger a password update.
  # Use 'terraform refresh' after 'terraform apply' to update the output with the new password.
  password_reset = "password-reset-on-18-01-2022"
}

