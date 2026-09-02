module "storage_blob_private_endpoint" {

  source  = "Azure/avm-res-network-privateendpoint/azurerm"
  version = "0.2.0"

  name = "pe-storage-blob-uks-001"

  network_interface_name = "nic-pe-storage-blob-uks-001"

  location = var.location

  resource_group_name = module.rg_application.name

  subnet_resource_id = module.spoke_a.subnets["private_endpoints"].resource_id

  private_connection_resource_id = var.storage_account_resource_id

  subresource_names = [
    "blob"
  ]

  private_dns_zone_group_name = "default"

  private_dns_zone_resource_ids = [
    var.private_dns_zone_ids["blob"]
  ]
}

module "keyvault_private_endpoint" {

  source  = "Azure/avm-res-network-privateendpoint/azurerm"
  version = "0.2.0"

  name = "pe-keyvault-uks-001"

  network_interface_name = "nic-pe-keyvault-uks-001"

  location = var.location

  resource_group_name = module.rg_application.name

  subnet_resource_id = module.spoke_b.subnets["private_endpoints"].resource_id

  private_connection_resource_id = var.keyvault_resource_id

  subresource_names = [
    "vault"
  ]

  private_dns_zone_group_name = "default"

  private_dns_zone_resource_ids = [
    var.private_dns_zone_ids["keyvault"]
  ]
}
