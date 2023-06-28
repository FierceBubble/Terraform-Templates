
resource "azurerm_virtual_network" "vnet" {
  name                = var.azure_vnet_name
  address_space       = var.azure_vnet_addr
  location            = var.rg_location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.azure_subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.azure_subnet_prefixes
}

module "network_security" {
  source      = "./nsg"
  rg_location = var.rg_location
  rg_name     = var.rg_name
  subnet_id   = azurerm_subnet.subnet.id
}


resource "azurerm_public_ip" "public_ip" {
  name                = "masterNodePublicIP"
  resource_group_name = var.rg_name
  location            = var.rg_location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic" {
  name                = var.azure_nic_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.azure_nic_ipconfig_name
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.azure_nic_ipconfig_allocation
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}
