rg_name = "Azure-3-tier-RG"
location = "us-west-2"
vnet_address_space = [10.0.0.0/16]
web_subnet_CIDR    = [10.1.0.0/24]
app_subnet_CIDR    = [10.2.0.0/24]
db_subnet_CIDR     = [10.3.0.0/24]
key_vault_name     = "azurekeyvalutrusnieiuhdovownwn"
wvmadmin_username  = "webtestadmin01"
avmadmin_username  = "apptestadmin01"
webvm_size         = "Standard_B2ms"
appvm_size         = "Standard_B2ms"
dbserv_primary_version  = "8.0"
dbserv_primary_admin    = "azmysqladmin01"
dbserv_primary_password = "#protected#"
  


