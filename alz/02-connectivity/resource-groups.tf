module "rg_connectivity" {

  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "0.4.0"

  name     = "rg-connectivity-uks-001"
  location = var.location

  tags = var.tags
}


module "rg_private_dns" {

  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "0.4.0"

  name     = "rg-private-dns-001"
  location = var.location

  tags = var.tags
}
