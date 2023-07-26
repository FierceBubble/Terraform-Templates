terraform {
  required_version = ">= 0.13.0"
  required_providers {
    upcloud = {
      source  = "UpCloudLtd/upcloud"
      version = ">= 2.12.0"
    }
  }
}


provider "upcloud" {
  username  = var.upcloud_username
  password  = var.upcloud_password
  retry_max = 3
}

resource "upcloud_server" "upcloud_vm" {
  hostname = "terraform"
  zone     = "sg-sin1"
  plan     = "1xCPU-1GB"

  # Declare network interfaces
  network_interface {
    type = "public"
  }

  network_interface {
    type = "utility"
  }

  # Include at least one public SSH key
  login {
    user              = "terraform"
    create_password   = true
    password_delivery = "email"
  }

  # Provision the server with Ubuntu
  template {
    storage = "Ubuntu Server 20.04 LTS (Focal Fossa)"

    # Use all the space allotted by the selected simple plan
    size = 25

    # Enable backups
    backup_rule {
      interval  = "daily"
      time      = "0100"
      retention = 8
    }
  }
}
