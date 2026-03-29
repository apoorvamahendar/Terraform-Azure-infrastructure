output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet1_id" {
  description = "ID of subnet1"
  value       = azurerm_subnet.subnet1.id
}

output "subnet2_id" {
  description = "ID of subnet2"
  value       = azurerm_subnet.subnet2.id
}
