module "avm-ptn-alz" {
  source             = "Azure/avm-ptn-alz/azurerm"
  version            = "0.21.0"
  architecture_name  = "alz"
  location           = "uksouth"
  parent_resource_id = data.azapi_client_config.current.tenant_id
  subscription_placement = {
    management = {
      subscription_id       = "5036f3d8-ff69-466f-a1f7-c274f53bb4f5"
      management_group_name = "management"
    }
    # connectivity = {
    #   subscription_id       = ""
    #   management_group_name = "connectivity"
    # }
    # identity = {
    #   subscription_id       = ""
    #   management_group_name = "identity"
    # }
  }
  management_group_hierarchy_settings = {
    default_management_group_name            = "sandbox"
    require_authorisation_for_group_creation = true
  }
}
