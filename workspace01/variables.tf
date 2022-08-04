variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_address_space" {
  type = list
}

variable "web_subnet_CIDR" {
  type = list
}

variable "app_subnet_CIDR" {
  type = list
}

variable "db_subnet_CIDR" {
  type = list
}

variable "key_vault_name" {
  type = string
}

variable "wvmadmin_username" {
  type = string
}

variable "avmadmin_username" {
  type = string
}

variable "webvm_size" {
  type = string
}

variable "appvm_size" {
  type = string
}

variable "dbserv_primary_version" {
  type = string
}

variable "dbserv_primary_admin" {
  type = string
}

variable "dbserv_primary_password" {
  type = string
}

