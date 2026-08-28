output "hub_vnet_id" {

  description = "Hub VNet resource ID"

  value = module.connectivity.virtual_network_resource_ids["uksouth"]
}


output "private_dns_zone_ids" {

  description = "Central Private DNS Zone resource IDs"

  value = module.connectivity.private_dns_zone_resource_ids["uksouth"]
}
