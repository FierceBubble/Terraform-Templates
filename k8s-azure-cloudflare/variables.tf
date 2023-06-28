# - - - - - Cloudflare Variables - - - - - #
variable "cloudflare_api_key" {
  description = "Cloudflare API Key"
}

variable "cloudflare_email" {
  description = "Cloudflare Email"
}

# - - - - - Azure Variables - - - - - #
variable "azure_subscription_id" {
  description = " Azure Subscription ID"
}

variable "azure_tenant_id" {
  description = " Azure Tenant ID"
}

# - - - - - Azure Resource Group Variables - - - - - #
variable "azure_rg_name" {
  description = "Azure RG name"
  default     = "RG-TF"
}

variable "azure_rg_location" {
  description = "Azure RG location (Region)"
  default     = "Japan East"
}

# - - - - - Azure VM Variables - - - - - #
variable "azure_vm_name" {
  description = "Azure VM name"
  default     = "Master-Node"
}

variable "azure_vm_size" {
  description = "Azure VM size"
  default     = "Standard_D2s_v3"
}

variable "azure_admin_password" {
  description = "Admin password to VM"
}

variable "azure_admin_username" {
  description = "Admin username to VM"
}

variable "azure_vm_os_disk_type" {
  description = "Azure VM OS Disk type"
  default     = "Standard_LRS"
}

variable "azure_vm_os_disk_caching" {
  description = "Azure VM OS Disk caching option"
  default     = "ReadWrite"
}

variable "azure_vm_os_disk_size" {
  description = "Azure VM OS Disk size (GB)"
  default     = 50
}

variable "azure_vm_image_publisher" {
  description = "Azure VM Image Publisher"
  default     = "Canonical"
}

variable "azure_vm_image_offer" {
  description = "Azure VM Image Offer"
  default     = "0001-com-ubuntu-server-jammy"
}

variable "azure_vm_image_sku" {
  description = "Azure VM Image SKU"
  default     = "22_04-lts-gen2"
}

variable "azure_vm_image_version" {
  description = "Azure VM Image Version"
  default     = "latest"
}

# Ubuntu 20.04 LTS Image
# Canonical
# 0001-com-ubuntu-server-focal
# 20_04-lts
# latest
