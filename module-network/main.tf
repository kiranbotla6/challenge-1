resource "azurerm_virtual_network" "vnet" {
  name                = "VNET-3-tier"
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "web_subnet" {
  name                 = "websunet"
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.web_subnet_CIDR
}

resource "azurerm_subnet" "app_subnet" {
  name                 = "appsubnet"
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.app_subnet_CIDR
}

resource "azurerm_subnet" "db_subnet" {
  name                 = "dbsubnet"
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.db_subnet_CIDR
}

