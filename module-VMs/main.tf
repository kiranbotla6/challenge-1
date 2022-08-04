#creating a web layer VM

resource "azurerm_network_interface" "webnic" {
  name                = "web_nic"
  location            = var.location
  resource_group_name = var.rg_name

   ip_configuration {
     name                          = "webnicipconfig"
     subnet_id                     = var.websubnet_id
     private_ip_address_allocation = "dynamic"
   }
}

resource "azurerm_virtual_machine" "webvm" {
  name                  = "web_vm"
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_id  = azurerm_network_interface.webnic.id
  vm_size               = var.webvm_size

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter-G2"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = var.wvmadmin_username
    admin_password = var.wvm_pwd
  }

  tags = {
    environment = "dev"
  }
}
  

#Creating an app layer VM

resource "azurerm_network_interface" "appnic" {
  name                = "app_nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "appnicipconfig"
    subnet_id                     = var.appsubnet_id
    private_ip_address_allocation = "dynamic"
  }
}

resource "azurerm_virtual_machine" "appvm" {
  name                  = "app_vm"
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_id  = azurerm_network_interface.appnic.id
  vm_size               = var.appvm_size

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter-G2"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = var.avmadmin_username
    admin_password = var.avm_pwd
  }

  tags = {
    environment = "dev"
  }
}