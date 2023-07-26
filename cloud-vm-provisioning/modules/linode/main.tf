terraform {
  required_version = ">= 0.13.0"
  required_providers {
    linode = {
      source  = "linode/linode"
      version = ">= 1.16.1"
    }
  }
}

provider "linode" {
  token = var.linode_token
}


resource "linode_instance" "server" {
  label            = "terraform_test_instance"
  image            = "linode/ubuntu22.04"
  region           = "ap-south"
  type             = "g6-standard-1"
  authorized_users = ["fiercebubble"]
  root_pass        = "terr4form-test"

  group      = "terraform"
  tags       = ["tfo"]
  swap_size  = 256
  private_ip = true
}
