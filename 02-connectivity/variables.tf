variable "connectivity_subscription_id" {
  type = string
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "tags" {
  type = map(string)

  default = {
    environment = "platform"
    managed_by  = "terraform"
  }
}