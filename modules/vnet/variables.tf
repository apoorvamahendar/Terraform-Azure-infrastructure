variable "vnet_name" {
  description = "Name of the shared virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the shared virtual network"
  type        = list(string)
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "subnet1_prefixes" {
  description = "Address prefixes for subnet1"
  type        = list(string)
}

variable "subnet2_prefixes" {
  description = "Address prefixes for subnet2"
  type        = list(string)
}
