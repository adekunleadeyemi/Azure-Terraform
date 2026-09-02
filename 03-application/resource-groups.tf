module "rg_application" {

  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "0.4.0"

  name     = "rg-app-prod-uks-001"
  location = var.location
}