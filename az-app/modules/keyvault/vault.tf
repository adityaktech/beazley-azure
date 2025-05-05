resource "azurerm_key_vault" "vault" {
  name                        = "beazleykv"
  location                    = var.location
  resource_group_name         = var.rg_name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  soft_delete_enabled         = true
  purge_protection_enabled    = true

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.admin_object_id

    secret_permissions = [
      "get", "list", "set", "delete"
    ]
  }
}

resource "azurerm_key_vault_secret" "sql_password" {
  name         = "sqladmin-password"
  value        = var.secret_value
  key_vault_id = azurerm_key_vault.vault.id
}