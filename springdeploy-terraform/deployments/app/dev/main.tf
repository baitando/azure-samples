terraform {
  required_version = ">=0.12"
}

provider "azurerm" {
  version = "=1.38.0"
}

module "sample-app" {
  source              = "../../modules/sample-app"
  environment         = local.environment
  location            = local.location
  plan_tier           = local.plan_tier
  plan_size           = local.plan_size
  resource_group_name = local.resource_group_name
}