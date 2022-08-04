resource "azurerm_sql_server" "dbserv_primary" {
    name = "dbservprimary"
    resource_group_name = var.rg_name
    location = var.location
    version = var.dbserv_primary_version
    administrator_login = var.dbserv_primary_admin
    administrator_login_password = var.dbserv_primary_password
}

resource "azurerm_sql_database" "db" {
  name                = "sqldb"
  resource_group_name = var.rg_name
  location            = var.location
  server_name         = azurerm_sql_server.dbserv_primary.name
}

