output "webnic_id" {
  value = azurerm_network_interface.webnic.id
}

output "appnic_id" {
  value = azurerm_network_interface.appnic.id
}