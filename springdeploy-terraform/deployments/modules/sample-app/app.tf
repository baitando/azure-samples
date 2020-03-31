resource "azurerm_app_service" "app" {
  name                = "sample-app-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  identity {
    type = "SystemAssigned"
  }

  site_config {
    linux_fx_version = "DOCKER|sampleregistrydev.azurecr.io/azure-boot-sample:latest"
    use_32_bit_worker_process = true
  }

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
    WEBSITES_PORT                       = "8080"
    DOCKER_REGISTRY_SERVER_URL          = "https://${data.azurerm_container_registry.registry.login_server}"
    DOCKER_REGISTRY_SERVER_USERNAME     = data.azurerm_key_vault_secret.secret-admin-username.value
    DOCKER_REGISTRY_SERVER_PASSWORD     = data.azurerm_key_vault_secret.secret-admin-password.value
    CLIENT_ID                           = data.azurerm_key_vault_secret.secret-client-id.value
    CLIENT_SECRET                       = data.azurerm_key_vault_secret.secret-client-secret.value
  }
}

data "azurerm_container_registry" "registry" {
  name = "sampleregistry${var.environment}"
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault" "vault" {
  name = "ahtesttestvault"
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "secret-admin-username" {
  name    = "acr-admin-username"
  key_vault_id = data.azurerm_key_vault.vault.id
}

data "azurerm_key_vault_secret" "secret-admin-password" {
  name    = "acr-admin-password"
  key_vault_id = data.azurerm_key_vault.vault.id
}

data "azurerm_key_vault_secret" "secret-client-id" {
  name    = "sp-client-id"
  key_vault_id = data.azurerm_key_vault.vault.id
}

data "azurerm_key_vault_secret" "secret-client-secret" {
  name    = "sp-client-secret"
  key_vault_id = data.azurerm_key_vault.vault.id
}