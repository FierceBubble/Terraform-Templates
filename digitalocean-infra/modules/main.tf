terraform {
  required_version = ">= 0.13.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.29.0"
    }
  }
}

provider "digitalocean" {
  token = var.digitalocean_token
}

data "digitalocean_ssh_key" "ssh-key" {
  name = var.digitalocean_ssh_key
}

resource "digitalocean_droplet" "droplet" {
  count = length(var.do_droplets)

  name       = var.do_droplets[count.index].name
  tags       = var.do_droplets[count.index].tags
  image      = var.do_droplets[count.index].image
  region     = var.do_droplets[count.index].region
  size       = var.do_droplets[count.index].size
  ipv6       = var.do_droplets[count.index].ipv6
  monitoring = var.do_droplets[count.index].monitoring
  backups    = var.do_droplets[count.index].backups

  volume_ids = [digitalocean_volume.volume[count.index].id]
  vpc_uuid   = module.digitalocean_vpc.do_vpc_id

  ssh_keys = [
    data.digitalocean_ssh_key.ssh-key.id
  ]
}

resource "digitalocean_volume" "volume" {
  count       = length(var.do_droplets)
  name        = "${var.do_droplets[count.index].name}-${var.do_volume_name}"
  region      = var.do_volume_region
  size        = var.do_volume_size
  description = "${var.do_droplets[count.index].name}-${var.do_volume_description}"
  tags        = var.do_volume_tags

  initial_filesystem_type  = var.do_volume_filesystem_type
  initial_filesystem_label = var.do_volume_filesystem_label
}

# Modules
module "digitalocean_firewall" {
  source         = "./networking/firewalls"
  droplet_ids    = digitalocean_droplet.droplet[*].id
  inbound_rules  = var.do_firewall_inbound_rules
  outbound_rules = var.do_firewall_outbound_rules
}

module "digitalocean_vpc" {
  source        = "./networking/vpc"
  do_vpc_name   = var.do_vpc_name
  do_vpc_region = var.do_vpc_region
}

module "digitalocean_monitoring_alerts" {
  source            = "./monitoring/alert"
  do_droplet_ids    = digitalocean_droplet.droplet[*].id
  do_monitor_alerts = var.do_monitor_alerts
}

module "digitalocean_monitoring_uptime" {
  source = "./monitoring/uptime"
}
