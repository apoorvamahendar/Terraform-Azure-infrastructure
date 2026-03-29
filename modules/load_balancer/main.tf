resource "azurerm_public_ip" "public_ip" {
  name                = "${var.lb_name}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.lb_sku
}

resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.lb_sku

  frontend_ip_configuration {
    name                 = "${var.lb_name}-frontend-ip"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name            = "${var.lb_name}-backend-pool"
  loadbalancer_id = azurerm_lb.lb.id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_assoc_vm1" {
  network_interface_id    = var.nic_id_vm1
  ip_configuration_name   = var.ip_configuration_name_vm1
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_assoc_vm2" {
  network_interface_id    = var.nic_id_vm2
  ip_configuration_name   = var.ip_configuration_name_vm2
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
}

resource "azurerm_lb_probe" "health_probe" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "${var.lb_name}-health-probe"
  protocol        = var.probe_protocol
  port            = var.probe_port
  request_path    = var.probe_request_path
}

resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "${var.lb_name}-rule"
  protocol                       = var.lb_rule_protocol
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = "${var.lb_name}-frontend-ip"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]
  probe_id                       = azurerm_lb_probe.health_probe.id
}
