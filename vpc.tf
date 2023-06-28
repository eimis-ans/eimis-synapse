data "openstack_networking_network_v2" "ext_net" {
  name   = "Ext-Net"
  region = var.cluster_region
}

resource "openstack_networking_network_v2" "private_network" {
  name           = "${terraform.workspace}-private-network"
  region         = var.cluster_region
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
  network_id      = openstack_networking_network_v2.private_network.id
  region          = var.cluster_region
  name            = "${terraform.workspace}-subnet"
  cidr            = "192.168.12.0/24"
  enable_dhcp     = true
  no_gateway      = false
  dns_nameservers = ["1.1.1.1", "1.0.0.1"]

  value_specs = {
    "provider:network_type"    = "vrack"
    "provider:segmentation_id" = var.vlan_id[terraform.workspace]
  }

  allocation_pool {
    start = "192.168.12.100"
    end   = "192.168.12.254"
  }
}

resource "openstack_networking_router_v2" "router" {
  region              = var.cluster_region
  name                = "${terraform.workspace}-router"
  admin_state_up      = true
  external_network_id = data.openstack_networking_network_v2.ext_net.id
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = openstack_networking_router_v2.router.id
  region    = var.cluster_region
  subnet_id = openstack_networking_subnet_v2.subnet.id
}
