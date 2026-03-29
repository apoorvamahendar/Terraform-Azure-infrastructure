variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  
}

variable "subnet_id" {
    description = "ID of the subnet to associate with the NSG"
    type        = string
  
}