variable "subscription_id" {
  description = "Azure subscription in which to create the resources."
  type        = string
}

variable "server_name" {
  description = "Globally unique MySQL server name; use lowercase letters, numbers and hyphens."
  type        = string
}

variable "location" {
  description = "Azure region; B1ms availability depends on region and subscription capacity."
  type        = string
  default     = "uksouth"
}

variable "administrator_password" {
  description = "Strong MySQL administrator password. Supply securely or enter when prompted."
  type        = string
  sensitive   = true
}

variable "allowed_client_ip" {
  description = "Public IPv4 address of your laptop or CI agent, without a /32 suffix."
  type        = string

  validation {
    condition     = can(cidrnetmask("${var.allowed_client_ip}/32")) && var.allowed_client_ip != "0.0.0.0"
    error_message = "Enter a single IPv4 address other than 0.0.0.0."
  }
}
