variable "application_subscription_id" {
  type = string
}

variable "hub_vnet_id" {
  type = string
}

variable "private_dns_zone_ids" {
  type = map(string)
}

variable "storage_account_resource_id" {
  type = string
}

variable "keyvault_resource_id" {
  type = string
}

variable "location" {
  type    = string
  default = "uksouth"
}