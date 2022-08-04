variable "location" {
  type = string
}

variable "rg_name" {
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