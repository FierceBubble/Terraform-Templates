terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = ">= 1.95.1"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.0"
    }
  }
}

variable "linode_token" {}
variable "cloudflare_api_key" {}
variable "cloudflare_email" {}

provider "linode" {
  token = var.linode_token
}

provider "cloudflare" {
  api_key = var.cloudflare_api_key
  email   = var.cloudflare_email
}

