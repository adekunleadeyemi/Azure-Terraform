terraform {
  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~> 2.12.0"
    }
    modtm = {
      source  = "azure/modtm"
      version = "~>0.4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.9.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.14.0"
    }
  }
}

provider "azurerm" {

  subscription_id = var.connectivity_subscription_id

  features {}
}

provider "azapi" {
  subscription_id = var.connectivity_subscription_id
}
