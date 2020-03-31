resource "azurerm_app_service_plan" "plan" {
  name                = "sample-plan-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name

  kind                = "Linux"
  reserved            = true

  sku {
    tier = var.plan_tier
    size = var.plan_size
  }
}