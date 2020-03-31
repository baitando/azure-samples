data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "example" {
  name                        = "ahtesttestvault"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "create",
      "get",
    ]

    secret_permissions = [
      "set",
      "get",
      "delete",
      "list"
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = azuread_service_principal.sample-principal.object_id

    secret_permissions = [
      "get",
      "list"
    ]
  }
}

resource "azurerm_key_vault_secret" "acr-admin-username" {
  name         = "acr-admin-username"
  value        = azurerm_container_registry.registry.admin_username
  key_vault_id = azurerm_key_vault.example.id
}

resource "azurerm_key_vault_secret" "acr-admin-password" {
  name         = "acr-admin-password"
  value        = azurerm_container_registry.registry.admin_password
  key_vault_id = azurerm_key_vault.example.id
}

resource "azurerm_key_vault_secret" "sp-client-id" {
  name         = "sp-client-id"
  value        = azuread_service_principal.sample-principal.application_id
  key_vault_id = azurerm_key_vault.example.id
}

resource "azurerm_key_vault_secret" "sp-client-secret" {
  name         = "sp-client-secret"
  value        = azuread_service_principal_password.sample-principal-password.value
  key_vault_id = azurerm_key_vault.example.id
}

