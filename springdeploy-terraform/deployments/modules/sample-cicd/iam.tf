resource "azuread_application" "sample-ad" {
  name = "sample-ad-application-${var.environment}"
}

resource "azuread_service_principal" "sample-principal" {
  application_id = azuread_application.sample-ad.application_id
}

resource "random_password" "default" {
  length  = 33
  special = true
}

resource "azuread_service_principal_password" "sample-principal-password" {
  service_principal_id = azuread_service_principal.sample-principal.id
  value                = random_password.default.result
  end_date             = "2021-02-01T01:02:03Z"
}