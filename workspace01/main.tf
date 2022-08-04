resource "random_password" "pwd" {
  length           = 14
  special          = true
  numeric          = true
  upper            = true
  override_special = "!#%&*()-_=+[]{}<>:?"
}

module "RG" {
  source         = "../module-RG"
  name           = var.rg_name
  location       = var.location
}

module "network" {
  source              = "../module-network"
  location            = module.RG.location
  resource_group      = module.RG.rg_name
  vnet_address_space  = var.vnet_address_space
  web_subnet_CIDR     = var.web_subnet_CIDR
  app_subnet_CIDR     = var.app_subnet_CIDR
  db_subnet_CIDR      = var.db_subnet_CIDR
}

module "keyvault" {
  source          = "../module-keyvault"
  rg_name         = module.rg.output_rg_name
  location        = module.rg.output_location
  key_vault_name  = var.key_vault_name
  depends_on      = [
    module.RG
  ]
}

resource "azurerm_key_vault_secret" "vm_pwd" {
  name         = "vm_pwds"
  value        = random_password.pwd.result
  key_vault_id = module.keyvault.key_vault_id
}

module "NSG" {
  source         = "../module-NSG"
  location       = module.RG.location
  resource_group = module.RG.rg_name
  web_subnet_id  = module.network.web_subnet_id
  app_subnet_id  = module.network.app_subnet_id
  db_subnet_id   = module.network.db_subnet_id
}

module "compute" {
  source            = "../module-VMs"
  location          = module.RG.location
  resource_group    = module.RG.rg_name
  web_subnet_id     = module.network.web_subnet_id
  app_subnet_id     = module.network.app_subnet_id
  wvmadmin_username = var.wvmadmin_username
  wvm_pwd           = azurerm_key_vault_secret.vm_pwd.value
  avmadmin_username = var.avmadmin_username
  avm_pwd           = azurerm_key_vault_secret.vm_pwd.value
  webvm_size        = var.webvm_size
  appvm_size        = var.appvm_size
}

module "DB" {
  source                  = "../module-DB"
  location                = module.RG.location
  resource_group          = module.RG.rg_name
  dbserv_primary_version  = var.dbserv_primary_version
  dbserv_primary_admin    = var.dbserv_primary_admin
  dbserv_primary_password = var.dbserv_primary_password
}
