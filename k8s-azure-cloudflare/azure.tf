resource "azurerm_resource_group" "rg" {
  name     = var.azure_rg_name
  location = var.azure_rg_location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.azure_vnet_name
  address_space       = var.azure_vnet_addr
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.azure_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.azure_subnet_prefixes
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.azure_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "ssh" {
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                       = "ssh"
  priority                   = 1001
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "22"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "k8s-allow-api-server" {
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                       = "k8s-allow-api-server"
  priority                   = 1002
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "6443"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "k8s-allow-kubectl-commands" {
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                       = "k8s-allow-kubectl-commands"
  priority                   = 1003
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "8080"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "k8s-allow-kubelet-check" {
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                       = "k8s-allow-kubelet-check"
  priority                   = 1004
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "10248"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "k8s-allow-http" {
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                       = "k8s-allow-http"
  priority                   = 1005
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "k8s-allow-https" {
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name

  name                       = "k8s-allow-https"
  priority                   = 1006
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "443"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}

resource "azurerm_network_interface" "nic" {
  name                = var.azure_nic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.azure_nic_ipconfig_name
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.azure_nic_ipconfig_allocation
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.azure_vm_name
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = var.azure_vm_size
  disable_password_authentication = "false"
  admin_username                  = var.azure_admin_username
  admin_password                  = var.azure_admin_password
  network_interface_ids = [
    azurerm_network_interface.nic.id,
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
