terraform {
  required_version = ">=0.12"
}

provider "azurerm" {
  version = ">=1.38.0"
}

provider "azuread" {
  version = ">=0.3.0"
}

module "sample-cicd" {
  source              = "../../modules/sample-cicd"
  environment         = local.environment
  location            = local.location
  resource_group_name = local.resource_group_name
  registry_sku        = local.registry_sku
}