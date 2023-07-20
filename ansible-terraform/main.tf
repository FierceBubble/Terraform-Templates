terraform {
  required_version = ">= 0.13.0"

  required_providers {
    ansible = {
      source  = "ansible/ansible"
      version = ">= 1.1.0"
    }
    ssh = {
      source  = "loafoe/ssh"
      version = ">= 2.6.0"
    }
  }
}
