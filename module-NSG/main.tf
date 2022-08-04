resource "azurerm_network_security_group" "web_subnet_nsg" {
  name                = "websubnsg"
  location            = var.location
  resource_group_name = var.rg_name


 resource "azurerm_network_security_rule" "websub_nsgrule1" {
  name                        = "webnsgrule1"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = ["10.3.0.0/24"]
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
 }

 resource "azurerm_network_security_rule" "websub_nsgrule2" {
  name                        = "webnsgrule2"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
 }

}

resource "azurerm_subnet_network_security_group_association" "websub_to_nsg" {
  subnet_id                 = var.web_subnet_id
  network_security_group_id = azurerm_network_security_group.web_subnet_nsg.id
}


resource "azurerm_network_security_group" "app_subnet_nsg" {
  name                = "appsubnsg"
  location            = var.location
  resource_group_name = var.rg_name


 resource "azurerm_network_security_rule" "appsub_nsgrule1" {
  name                        = "appnsgrule1"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = ["10.1.0.0/24"]
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
 }

 resource "azurerm_network_security_rule" "appsub_nsgrule2" {
  name                        = "appnsgrule2"
  priority                    = 101
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = ["10.1.0.0/24"]
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
 }
}

resource "azurerm_subnet_network_security_group_association" "app-nsg-subnet" {
  subnet_id                 = var.app_subnet_id
  network_security_group_id = azurerm_network_security_group.app_subnet_nsg.id
}


resource "azurerm_network_security_group" "db_subnet_nsg" {
  name                = "dbsubnsg"
  location            = var.location
  resource_group_name = var.rg_name


 resource "azurerm_network_security_rule" "dbsub_nsgrule1" {
  name                        = "dbnsgrule1"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3306"
  source_address_prefix       = ["10.1.0.0/24"]
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
 }

 resource "azurerm_network_security_rule" "dbsub_nsgrule2" {
  name                        = "dbnsgrule2"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3306"
  source_address_prefix       = ["10.2.0.0/24"]
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
 }

 resource "azurerm_network_security_rule" "dbsub_nsgrule2" {
  name                        = "dbnsgrule3"
  priority                    = 102
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3306"
  source_address_prefix       = ["10.2.0.0/24"]
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
 }
}

resource "azurerm_subnet_network_security_group_association" "db-nsg-subnet" {
  subnet_id                 = var.db_subnet_id
  network_security_group_id = azurerm_network_security_group.db_subnet_nsg.id
}