module "spoke_a" {

  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.22.1"

  name = "vnet-spoke-a-uks-001"

  location = var.location

  parent_id = module.rg_application.resource_id

  address_space = [
    "10.10.0.0/16"
  ]

  subnets = {

    application = {

      name = "snet-app"

      address_prefixes = [
        "10.10.1.0/24"
      ]
    }

    private_endpoints = {

      name = "snet-private-endpoints"

      address_prefixes = [
        "10.10.2.0/24"
      ]
    }
  }
}

module "spoke_b" {

  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.22.1"

  name = "vnet-spoke-b-uks-001"

  location = var.location

  parent_id = module.rg_application.resource_id

  address_space = [
    "10.20.0.0/16"
  ]

  subnets = {

    application = {

      name = "snet-app"

      address_prefixes = [
        "10.20.1.0/24"
      ]
    }

    private_endpoints = {

      name = "snet-private-endpoints"

      address_prefixes = [
        "10.20.2.0/24"
      ]
    }
  }
}