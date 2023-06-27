variable "cloudflare_api_key" {
  description = "Cloudflare API Key"
}

variable "cloudflare_email" {
  description = "Cloudflare Email"
}

variable "azure_subscription_id" {
  description = " Azure Subscription ID"
}

variable "azure_tenant_id" {
  description = " Azure Tenant ID"
}

variable "azure_rg_name" {
  description = "Azure RG name"
  default     = "RG-TF"
}

variable "azure_rg_location" {
  description = "Azure RG location (Region)"
  default     = "Japan East"
}

variable "azure_vnet_name" {
  description = "Azure VM Virtual Network name"
  default     = "vnet"
}

variable "azure_vnet_addr" {
  description = "Azure VM Virtual Network address space"
  default     = ["10.230.0.0/24"]
}

variable "azure_subnet_name" {
  description = "Azure VM Subnet name"
  default     = "subnet"
}

variable "azure_subnet_prefixes" {
  description = "Azure VM Subnet address prefixes"
  default     = ["10.230.0.0/27"]
}

variable "azure_nsg_name" {
  description = "Azure VM Network Security Group name"
  default     = "nsg"
}

variable "azure_nic_name" {
  description = "Azure VM Network Interface name"
  default     = "nic"
}

variable "azure_nic_ipconfig_name" {
  description = "Azure VM Network Interface IP config name"
  default     = "nic-ipconfig"
}

variable "azure_nic_ipconfig_allocation" {
  description = "Azure VM Network Interface IP config address allocation"
  default     = "Dynamic"
}

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
  default     = "0001-com-ubuntu-server-focal"
}

variable "azure_vm_image_sku" {
  description = "Azure VM Image SKU"
  default     = "20_04-lts"
}

variable "azure_vm_image_version" {
  description = "Azure VM Image Version"
  default     = "latest"
}
