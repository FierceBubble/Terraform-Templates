terraform {
  required_version = ">= 0.13.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
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


