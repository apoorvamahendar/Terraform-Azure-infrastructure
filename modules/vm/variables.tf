variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to attach the NIC to"
  type        = string
}

variable "ip_configuration_name" {
  description = "Name of the IP configuration"
  type        = string
}

variable "private_ip_address_allocation" {
  description = "Allocation method for the private IP address"
  type        = string
}

variable "azure_linux_virtual_machine_name" {
  description = "Name of the Azure Linux virtual machine"
  type        = string
}

variable "size" {
  description = "Size of the Azure Linux virtual machine"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the Linux virtual machine"
  type        = string
  sensitive   = true
}

variable "caching" {
  description = "Caching type for the OS disk"
  type        = string
}

variable "storage_account_type" {
  description = "Storage account type for the OS disk"
  type        = string
}

variable "image_publisher" {
  description = "Publisher of the VM image"
  type        = string
}

variable "image_offer" {
  description = "Offer of the VM image"
  type        = string
}

variable "image_sku" {
  description = "SKU of the VM image"
  type        = string
}

variable "image_version" {
  description = "Version of the VM image"
  type        = string
}
