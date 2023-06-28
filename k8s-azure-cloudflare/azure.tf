resource "azurerm_resource_group" "rg" {
  name     = var.azure_rg_name
  location = var.azure_rg_location
}

module "network" {
  source      = "./modules/network"
  rg_name     = azurerm_resource_group.rg.name
  rg_location = azurerm_resource_group.rg.location
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.azure_vm_name
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = var.azure_vm_size
  disable_password_authentication = "false"
  computer_name                   = "master-node"
  admin_username                  = var.azure_admin_username
  admin_password                  = var.azure_admin_password

  network_interface_ids = [
    module.network.nic_id,
  ]

  #   admin_ssh_key {
  #     username   = "bubble"
  #     public_key = file("~/.ssh/id_rsa.pub")
  #   }

  os_disk {
    caching              = var.azure_vm_os_disk_caching
    storage_account_type = var.azure_vm_os_disk_type
    disk_size_gb         = var.azure_vm_os_disk_size
  }

  source_image_reference {
    publisher = var.azure_vm_image_publisher
    offer     = var.azure_vm_image_offer
    sku       = var.azure_vm_image_sku
    version   = var.azure_vm_image_version
  }
}

# resource "azurerm_maintenance_configuration" "example" {
#   name                = "example-mc"
#   resource_group_name = azurerm_resource_group.example.name
#   location            = azurerm_resource_group.example.location
#   scope               = "All"
# }

# resource "azurerm_maintenance_assignment_virtual_machine" "example" {
#   location                     = azurerm_resource_group.example.location
#   maintenance_configuration_id = azurerm_maintenance_configuration.example.id
#   virtual_machine_id           = azurerm_linux_virtual_machine.example.id
# }
