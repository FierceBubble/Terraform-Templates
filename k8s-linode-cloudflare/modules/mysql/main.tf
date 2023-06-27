terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = ">= 1.16.0"
    }
  }
}

resource "linode_firewall" "mysql" {
  label = var.firewall_label
  tags  = var.tags

  inbound {
    protocol  = "TCP"
    ports     = ["3306"]
    addresses = var.addresses
  }
  linodes = var.linodes
}
