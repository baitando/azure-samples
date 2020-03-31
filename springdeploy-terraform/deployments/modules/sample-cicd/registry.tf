resource "azurerm_container_registry" "registry" {
  name                     = "sampleregistry${var.environment}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = var.registry_sku

  admin_enabled            = true
}