resource "azurerm_virtual_network" "vnet" {
  name                = "main-vnet"
  address_space       = ["10.10.0.0/16"]
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.1.0/24"]
}

resource "azurerm_subnet" "app" {
  name                 = "app"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.2.0/24"]
}

resource "azurerm_subnet" "db" {
  name                 = "db"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.3.0/24"]
}

output "frontend_subnet_id" {
  value = azurerm_subnet.frontend.id
}