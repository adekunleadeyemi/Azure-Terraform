provider "azurerm" {

  subscription_id = var.application_subscription_id

  features {}
}

provider "azapi" {
  subscription_id = var.application_subscription_id
}
