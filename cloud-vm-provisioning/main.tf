terraform {
  backend "s3" {}
}
# - - - - - AWS Module - - - - - #
module "aws" {
  source         = "./modules/aws"
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  aws_region     = "ap-southeast-1"

  # Instance

}

# - - - - - Azure Module - - - - - #
module "azure" {
  source                = "./modules/azure"
  azure_subscription_id = var.azure_subscription_id
  azure_tenant_id       = var.azure_tenant_id

  # Resource Group
  azure_rg_name     = "RG-TF"
  azure_rg_location = "East Asia"

  # VM
  azure_vm_name             = "Master-Node"
  azure_vm_host_name        = "master-node"
  azure_vm_size             = "Standard_B2s"
  azure_vm_disable_password = "false"

  # VM User
  azure_admin_username = "bubble"
  azure_admin_password = "Passw0rd"

  # VM OS
  azure_vm_os_disk_type    = "Standard_LRS"
  azure_vm_os_disk_caching = "ReadWrite"
  azure_vm_os_disk_size    = 50 # ...GB

  # VM Image
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
module "digitalocean" {
  source               = "./modules/digitalocean"
  digitalocean_token   = var.digitalocean_token
  digitalocean_ssh_key = "Terraform"

  # Droplet
  do_droplet_name       = "terraform-web"
  do_droplet_tags       = ["webapp-droplet", "intel", "x64", "sgp1", "1vCPU", "1GB"]
  do_droplet_image      = "ubuntu-22-04-x64"
  do_droplet_region     = "sgp1"
  do_droplet_size       = "s-1vcpu-1gb"
  do_droplet_ipv6       = true
  do_droplet_monitoring = true
  do_droplet_backups    = true

  # Volume
  do_volume_name        = "terraform-volume"
  do_volume_size        = 50
  do_volume_region      = "sgp1"
  do_volume_description = "Terraform-web volume"
  do_volume_tags        = ["ext4", "sgp1", "50"]

  do_volume_filesystem_type  = "ext4"
  do_volume_filesystem_label = "ext4"
}

# - - - - - Hetzner Module - - - - - #
module "hetzner" {
  source = "./modules/hetzner"
}

# - - - - - Linode Module - - - - - #
module "linode" {
  source       = "./modules/linode"
  linode_token = var.linode_token

  # Instance
  linode_instance_label            = "terraform_test_instance"
  linode_instance_image            = "linode/ubuntu22.04"
  linode_instance_region           = "ap-south"
  linode_instance_type             = "g6-standard-1"
  linode_instance_authorized_users = ["fiercebubble"]
  linode_instance_root_password    = "terr4form-test"
  linode_instance_group            = "terraform"
  linode_instance_tags             = ["tfo"]
  linode_instance_swap_size        = 256
  linode_instance_private_ip       = true
}

# - - - - - UpCloud Module - - - - - #
module "upcloud" {
  source           = "./modules/upcloud"
  upcloud_username = var.upcloud_username
  upcloud_password = var.upcloud_password

  # Server
  upcloud_server_hostname = "terraform"
  upcloud_server_zone     = "sg-sin1"
  upcloud_server_plan     = "1xCPU-1GB"

  # Server Login
  upcloud_server_user              = "terraform"
  upcloud_server_create_password   = true
  upcloud_server_password_delivery = "email"

  # Server Network Interface
  upcloud_server_nic_type = "public"

  # Server Template (Storage)
  upcloud_server_template_storage = "Ubuntu Server 20.04 LTS (Focal Fossa)"
  uplcoud_server_template_size    = 25

  # Server Template (Storage Backup)
  upcloud_server_template_backup_interval  = "daily"
  upcloud_server_template_backup_time      = "0100"
  upcloud_server_template_backup_retention = 8
}

# # - - - - - Vultr Module - - - - - #
module "vultr" {
  source        = "./modules/vultr"
  vultr_api_key = var.vultr_api_key

  # Instance
  vultr_instance_plan             = "vc2-1c-1gb"
  vultr_instance_region           = "sgp"
  vultr_instance_os               = 1743
  vultr_instance_label            = "terraform"
  vultr_instance_tags             = ["terraform"]
  vultr_instance_hostname         = "vultr-terraform"
  vultr_instance_enable_ipv6      = true
  vultr_instance_backups          = "disabled"
  vultr_instance_ddos_protection  = false
  vultr_instance_activation_email = false

  # Instance Backups
  vultr_instance_backups_schedule_type = "daily"
}
