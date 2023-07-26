terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.9.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }

    civo = {
      source  = "civo/civo"
      version = ">= 1.0.35"
    }

    linode = {
      source  = "linode/linode"
      version = ">= 1.16.1"
    }

    upcloud = {
      source  = "UpCloudLtd/upcloud"
      version = ">= 2.12.0"
    }

    vultr = {
      source  = "vultr/vultr"
      version = ">= 2.15.1"
    }
  }
}

# - - - - - AWS Module - - - - - #
provider "aws" {
  region     = "ap-southeast-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "aws" {
  source = "./modules/aws"
}

# - - - - - Azure Module - - - - - #
provider "azurerm" {
  features {}

  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id
}

module "azure_vm" {
  source = "./modules/azure"

  azure_rg_name     = "RG-TF"
  azure_rg_location = "East Asia"

  azure_vm_name             = "Master-Node"
  azure_vm_host_name        = "master-node"
  azure_vm_size             = "Standard_B2s"
  azure_vm_disable_password = "false"

  azure_admin_username = "bubble"
  azure_admin_password = "Passw0rd"

  azure_vm_os_disk_type    = "Standard_LRS"
  azure_vm_os_disk_caching = "ReadWrite"
  azure_vm_os_disk_size    = 50 # ...GB

  azure_vm_image_publisher = "Canonical"
  azure_vm_image_offer     = "0001-com-ubuntu-server-jammy"
  azure_vm_image_sku       = "22_04-lts-gen2"
  azure_vm_image_version   = "latest"

  # Ubuntu 22.04 LTS Image
  # Cannonical
  # 0001-com-ubuntu-server-jammy
  # 22_04-lts-gen2
  # latest

  # Ubuntu 20.04 LTS Image
  # Canonical
  # 0001-com-ubuntu-server-focal
  # 20_04-lts
  # latest

  # Ubuntu 18.04 LTS Image
  # Cannonical
  # UbuntuServer
  # 18.04-LTS 
  # latest

}

# - - - - - Civo Module - - - - - #
provider "civo" {
  token  = var.civo_token
  region = "LON1"
}

module "civo" {
  source = "./modules/civo"
}

# - - - - - Digital Ocean Module - - - - - #


# - - - - - Linode Module - - - - - #
provider "linode" {
  token = var.linode_token
}

module "linode" {
  source = "./modules/linode"
}

# - - - - - UpCloud Module - - - - - #
provider "upcloud" {
  username  = var.upcloud_username
  password  = var.upcloud_password
  retry_max = 3
}

module "upcloud" {
  source = "./modules/upcloud"
}

# - - - - - Vultr Module - - - - - #
provider "vultr" {
  api_key     = var.vultr_api_key
  rate_limit  = 100
  retry_limit = 3
}

module "vultr" {
  source = "./modules/vultr"
}
