terraform {
  required_version = ">= 0.13.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.29.0"
    }
  }
}

resource "digitalocean_vpc" "vpc" {
  name   = var.do_vpc_name
  region = var.do_vpc_region
}
