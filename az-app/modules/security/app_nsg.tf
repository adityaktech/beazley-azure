resource "azurerm_network_security_group" "app" {
  name                = "app-nsg"
  location            = var.location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "AllowFrontend"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "10.10.1.0/24"
    destination_address_prefix = "10.10.2.0/24"
  }
}