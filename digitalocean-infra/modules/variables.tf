# - - -- - Digital Ocean Variables - - - - - #
variable "digitalocean_token" {
  sensitive = true
}
variable "digitalocean_ssh_key" {}

# Volume
variable "do_volume_name" {}
variable "do_volume_region" {}
variable "do_volume_size" {}
variable "do_volume_description" {}
variable "do_volume_tags" {
  type = list(string)
}
variable "do_volume_filesystem_type" {}
variable "do_volume_filesystem_label" {}

# Droplet
variable "do_droplets" {
  type = list(object({
    name       = string
    tags       = list(string)
    image      = string
    region     = string
    size       = string
    ipv6       = bool
    monitoring = bool
    backups    = bool
  }))
}

# Firewall
variable "do_firewall_inbound_rules" {}
variable "do_firewall_outbound_rules" {}

# VPC
variable "do_vpc_name" {}
variable "do_vpc_region" {}

# Monitoring
variable "do_monitor_alerts" {}
