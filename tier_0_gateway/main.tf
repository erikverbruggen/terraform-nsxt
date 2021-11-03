terraform {
  required_providers {
    nsxt = {
        source = "vmware/nsxt"
    }
  }
}

provider "nsxt" {
  host = "nsxtm01.verbrough.com"
  username = "admin"
  password = "VMware1!VMware1!"
}

data "nsxt_edge_cluster" "edge_cluster" {
  display_name = var.edge_cluster
}

data "nsxt_transport_zone" "vlan_transport_zone" {
  display_name = var.vlan_transport_zone
}

resource "nsxt_policy_tier0_gateway" "default_tier0_gateway" {
  display_name = "default_tier0_gw"
  ha_mode = "ACTIVE_STANDBY"
  edge_cluster_path = var.edge_cluster.edge_cluster_path
}