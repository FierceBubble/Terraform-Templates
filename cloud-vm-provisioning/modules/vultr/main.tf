terraform {
  required_version = ">= 0.13.0"
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = ">= 2.15.1"
    }
  }
}

provider "vultr" {
  api_key     = var.vultr_api_key
  rate_limit  = 100
  retry_limit = 3
}

resource "vultr_instance" "my_instance" {
  plan        = "vc2-1c-1gb"
  region      = "sea"
  os_id       = 167
  label       = "terraform"
  tags        = ["terraform"]
  hostname    = "terraform"
  enable_ipv6 = true
  backups     = "enabled"
  backups_schedule {
    type = "daily"
  }
  ddos_protection  = true
  activation_email = false
}
