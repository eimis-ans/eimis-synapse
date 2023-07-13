data "openstack_networking_network_v2" "ext_net" {
  name   = "Ext-Net"
  region = var.os_region_name
}

resource "openstack_networking_network_v2" "private_network" {
  name           = "${var.env_name}-private-network"
  region         = var.os_region_name
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
  network_id      = openstack_networking_network_v2.private_network.id
  region          = var.os_region_name
  name            = "${var.env_name}-subnet"
  cidr            = "${var.vlan_cidr}.0/24"
  enable_dhcp     = true
  no_gateway      = false
  dns_nameservers = ["1.1.1.1", "1.0.0.1"]

  allocation_pool {
    start = "${var.vlan_cidr}.100"
    end   = "${var.vlan_cidr}.254"
  }
}

resource "openstack_networking_router_v2" "router" {
  region              = var.os_region_name
  name                = "${var.env_name}-router"
  admin_state_up      = true
  external_network_id = data.openstack_networking_network_v2.ext_net.id
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = openstack_networking_router_v2.router.id
  region    = var.os_region_name
  subnet_id = openstack_networking_subnet_v2.subnet.id
}
