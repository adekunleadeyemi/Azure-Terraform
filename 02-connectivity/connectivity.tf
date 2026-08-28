module "connectivity" {

  source  = "Azure/avm-ptn-alz-connectivity-hub-and-spoke-vnet/azurerm"
  version = "0.17.1"

  hub_virtual_networks = {

    uksouth = {

      location = var.location

      default_parent_id = module.rg_connectivity.resource_id

      enabled_resources = {

        firewall = false

        firewall_policy = false

        bastion = false

        virtual_network_gateway_express_route = false

        virtual_network_gateway_vpn = false

        nat_gateway = false

        # What we want for now
        private_dns_zones = true

        # Add later if you need hybrid/central DNS
        private_dns_resolver = false
      }


      # -----------------------------
      # Hub VNet
      # -----------------------------

      hub_virtual_network = {

        name = "vnet-hub-uks-001"

        address_space = [
          "10.0.0.0/16"
        ]

        parent_id = module.rg_connectivity.resource_id
      }


      # -----------------------------
      # Central Private DNS
      # -----------------------------

      private_dns_zones = {

        parent_id = module.rg_private_dns.resource_id

        auto_registration_zone_enabled = false

        private_link_private_dns_zones = {

          blob = {
            zone_name = "privatelink.blob.core.windows.net"
          }

          keyvault = {
            zone_name = "privatelink.vaultcore.azure.net"
          }

          sql = {
            zone_name = "privatelink.database.windows.net"
          }

          webapps = {
            zone_name = "privatelink.azurewebsites.net"
          }
        }

        tags = var.tags
      }
    }
  }

  tags = var.tags
}
