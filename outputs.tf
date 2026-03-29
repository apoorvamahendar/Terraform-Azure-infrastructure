output "vm_id" {
  description = "ID of the virtual machine"
  value       = module.vm.vm_id
}

output "lb_public_ip" {
  description = "Public IP address of the Load Balancer"
  value       = module.load_balancer.lb_public_ip
}
