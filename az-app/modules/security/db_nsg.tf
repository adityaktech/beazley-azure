resource "azurerm_network_security_group" "db" {
  name                = "db-nsg"
  location            = var.location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "AllowApp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1433"
    source_address_prefix      = "10.10.2.0/24"
    destination_address_prefix = "10.10.3.0/24"
  }
}