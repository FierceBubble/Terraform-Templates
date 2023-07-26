# - - - - - AWS Module - - - - - #
module "aws" {
  source         = "./modules/aws"
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
}

# - - - - - Azure Module - - - - - #
module "azure" {
  source                = "./modules/azure"
  azure_subscription_id = var.azure_subscription_id
  azure_tenant_id       = var.azure_tenant_id

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
module "civo" {
  source     = "./modules/civo"
  civo_token = var.civo_token
}

# - - - - - Digital Ocean Module - - - - - #
# module "digitalocean" {
#   source             = "./modules/digitalocean"
#   digitalocean_token = var.digitalocean_token
# }

# - - - - - Hetzner Module - - - - - #
module "hetzner" {
  source = "./modules/hetzner"
}

# - - - - - Linode Module - - - - - #
module "linode" {
  source       = "./modules/linode"
  linode_token = var.linode_token
}

# - - - - - UpCloud Module - - - - - #
# module "upcloud" {
#   source           = "./modules/upcloud"
#   upcloud_username = var.upcloud_username
#   upcloud_password = var.upcloud_password
# }

# # - - - - - Vultr Module - - - - - #
# module "vultr" {
#   source        = "./modules/vultr"
#   vultr_api_key = var.vultr_api_key
# }
