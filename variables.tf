variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "terraform-demo-rg"
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "southindia"
}

variable "storage_account_name" {
  description = "Name of the Azure storage account (must be globally unique, lowercase, 3-24 chars)"
  type        = string
  default     = "tfstoragedemo84721"
}

variable "account_tier" {
  description = "Storage account tier (Standard or Premium)"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Storage account replication type (LRS, GRS, RAGRS, ZRS)"
  type        = string
  default     = "LRS"
}

variable "container_name" {
  description = "Name of the storage container"
  type        = string
  default     = "terraform-demo-container"
}

variable "vnet_name" {
  description = "Name of the shared virtual network"
  type        = string
  default     = "shared-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the shared virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet1_prefixes" {
  description = "Address prefixes for subnet1 (VM1)"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "subnet2_prefixes" {
  description = "Address prefixes for subnet2 (VM2)"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "ip_configuration_name" {
  description = "Name of the IP configuration for VM1"
  type        = string
  default     = "ipconfig1"
}

variable "ip_configuration_name2" {
  description = "Name of the IP configuration for VM2"
  type        = string
  default     = "ipconfig2"
}

variable "private_ip_address_allocation" {
  description = "Allocation method for the private IP address"
  type        = string
  default     = "Dynamic"
}

variable "azure_linux_virtual_machine_name" {
  description = "Name of the first Azure Linux virtual machine"
  type        = string
  default     = "web1"
}

variable "azure_linux_virtual_machine_name2" {
  description = "Name of the second Azure Linux virtual machine"
  type        = string
  default     = "web2"
}

variable "size" {
  description = "Size of the Azure Linux virtual machine"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_password" {
  description = "Admin password for the Linux virtual machine"
  type        = string
  sensitive   = true
}

variable "caching" {
  description = "Caching type for the OS disk"
  type        = string
  default     = "ReadWrite"
}

variable "storage_account_type" {
  description = "Storage account type for the OS disk"
  type        = string
  default     = "Standard_LRS"
}

variable "image_publisher" {
  description = "Publisher of the VM image"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "Offer of the VM image"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "image_sku" {
  description = "SKU of the VM image"
  type        = string
  default     = "22_04-lts"
}

variable "image_version" {
  description = "Version of the VM image"
  type        = string
  default     = "latest"
}

variable "security_group_name" {
  description = "Name of the network security group"
  type        = string
}

variable "allocation_method" {
  description = "Allocation method for the public IP address"
  type        = string
  default     = "Static"
}

variable "lb_name" {
  description = "Name of the load balancer"
  type        = string
  default     = "demo-lb"
}

variable "lb_sku" {
  description = "SKU of the load balancer (Standard or Basic)"
  type        = string
  default     = "Standard"
}

variable "probe_protocol" {
  description = "Protocol for the health probe (Http, Https, Tcp)"
  type        = string
  default     = "Http"
}

variable "probe_port" {
  description = "Port for the health probe"
  type        = number
  default     = 80
}

variable "probe_request_path" {
  description = "Request path for Http/Https health probes"
  type        = string
  default     = "/"
}

variable "lb_rule_protocol" {
  description = "Protocol for the LB rule (Tcp, Udp)"
  type        = string
  default     = "Tcp"
}

variable "frontend_port" {
  description = "Frontend port for the LB rule"
  type        = number
  default     = 80
}

variable "backend_port" {
  description = "Backend port for the LB rule"
  type        = number
  default     = 80
}
