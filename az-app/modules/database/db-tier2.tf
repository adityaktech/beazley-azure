resource "azurerm_mssql_server" "db_server" {
  name                         = "beazley-sqlserver"
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_mssql_database" "db" {
  name           = "beazleydb"
  server_id      = azurerm_mssql_server.db_server.id
  sku_name       = "Basic"
  zone_redundant = false
}