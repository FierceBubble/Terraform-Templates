terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = ">= 1.16.0"
    }
  }
}

resource "linode_firewall" "web_server" {
  label = var.firewall_label
  tags  = var.tags

  inbound {
    label    = "allow-http"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "80"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-https"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "443"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"

  linodes = var.linodes
}