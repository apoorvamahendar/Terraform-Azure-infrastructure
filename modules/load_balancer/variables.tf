variable "lb_name" {
  description = "The name of the Load Balancer."
  type        = string
}

variable "location" {
  description = "The Azure region where the Load Balancer will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Load Balancer."
  type        = string
}

variable "lb_sku" {
  description = "The SKU of the Load Balancer. Possible values are 'Basic' and 'Standard'."
  type        = string
}

variable "allocation_method" {
  description = "The allocation method for the public IP address. Possible values are 'Static' and 'Dynamic'."
  type        = string
}

variable "nic_id_vm1" {
  description = "Network interface ID of VM1"
  type        = string
}

variable "nic_id_vm2" {
  description = "Network interface ID of VM2"
  type        = string
}

variable "ip_configuration_name_vm1" {
  description = "IP configuration name of VM1 NIC"
  type        = string
}

variable "ip_configuration_name_vm2" {
  description = "IP configuration name of VM2 NIC"
  type        = string
}

variable "probe_protocol" {
  description = "Protocol for the health probe (Http, Https, Tcp)"
  type        = string
}

variable "probe_port" {
  description = "Port for the health probe"
  type        = number
}

variable "probe_request_path" {
  description = "Request path for Http/Https health probes"
  type        = string
  default     = "/"
}

variable "lb_rule_protocol" {
  description = "Protocol for the LB rule (Tcp, Udp)"
  type        = string
}

variable "frontend_port" {
  description = "Frontend port for the LB rule"
  type        = number
}

variable "backend_port" {
  description = "Backend port for the LB rule"
  type        = number
}
