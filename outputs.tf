output "frontend_vm_private_ip" {
  value = azurerm_network_interface.frontend_nic.private_ip_address
}