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

resource "digitalocean_droplet" "droplet" {
  name   = var.do_droplet_name
  image  = var.do_droplet_image
  region = var.do_droplet_region
  size   = var.do_droplet_size
}
