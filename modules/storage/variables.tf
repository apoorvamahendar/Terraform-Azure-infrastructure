variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Azure storage account"
  type        = string
}

variable "account_tier" {
  description = "Storage account tier"
  type        = string
}

variable "account_replication_type" {
  description = "Storage account replication type"
  type        = string
}

variable "container_name" {
  description = "Name of the storage container"
  type        = string
}
