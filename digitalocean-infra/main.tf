module "digitalocean" {
  source               = "./modules"
  digitalocean_token   = var.digitalocean_token
  digitalocean_ssh_key = "Terraform"

  # Droplet
  do_droplets = [
    {
      name = "terraform-web"
      tags = [
        "webapp-droplet"
      ]
      image      = "ubuntu-22-04-x64"
      region     = "sgp1"
      size       = "s-1vcpu-1gb"
      ipv6       = true
      monitoring = true
      backups    = true
    },
    {
      name = "terraform-microservice-1"
      tags = [
        "webapp-droplet"
      ]
      image      = "ubuntu-22-04-x64"
      region     = "sgp1"
      size       = "s-1vcpu-1gb"
      ipv6       = true
      monitoring = true
      backups    = true
    }
  ]

  # Volume
  do_volume_name        = "terraform-volume"
  do_volume_size        = 50
  do_volume_region      = "sgp1"
  do_volume_description = "Terraform-web volume"
  do_volume_tags = [
    "webapp-volume"
  ]

  do_volume_filesystem_type  = "ext4"
  do_volume_filesystem_label = "ext4"

  # VPC
  do_vpc_name   = "terraform-vpc"
  do_vpc_region = "sgp1"

  # Firewall
  do_firewall_inbound_rules = [
    {
      protocol         = "tcp"
      port_range       = "22"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "tcp"
      port_range       = "80"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "tcp"
      port_range       = "443"
      source_addresses = ["0.0.0.0/0", "::/0"]
    }
  ]

  do_firewall_outbound_rules = [
    {
      protocol              = "icmp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol              = "tcp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol              = "udp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
  ]

  # Monitoring
  do_monitor_alerts = [
    {
      email       = ["fiercebubble.tv@gmail.com"]
      channel     = "terraform-prod"
      url         = var.digitalocean_slack_webhook_url
      window      = "5m"
      type        = "v1/insights/droplet/cpu"
      compare     = "GreaterThan"
      value       = 85
      enabled     = true
      description = "Alert on CPU usage"
    },
    {
      email       = ["fiercebubble.tv@gmail.com"]
      channel     = "terraform-prod"
      url         = var.digitalocean_slack_webhook_url
      window      = "5m"
      type        = "v1/insights/droplet/memory_utilization_percent"
      compare     = "GreaterThan"
      value       = 80
      enabled     = true
      description = "Alert on Memory usage"
    }
  ]
}
