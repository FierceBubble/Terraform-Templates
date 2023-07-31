module "digitalocean" {
  source               = "./modules"
  digitalocean_token   = var.digitalocean_token
  digitalocean_ssh_key = "Terraform"

  # Droplet
  do_droplet_name = "terraform-web"
  do_droplet_tags = [
    "webapp-droplet"
  ]
  do_droplet_image      = "ubuntu-22-04-x64"
  do_droplet_region     = "sgp1"
  do_droplet_size       = "s-1vcpu-1gb"
  do_droplet_ipv6       = true
  do_droplet_monitoring = true
  do_droplet_backups    = true

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
