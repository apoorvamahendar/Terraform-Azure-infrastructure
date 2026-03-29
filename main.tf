resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "vnet" {
  source = "./modules/vnet"

  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet1_prefixes    = var.subnet1_prefixes
  subnet2_prefixes    = var.subnet2_prefixes

  depends_on = [azurerm_resource_group.rg]
}

module "storage" {
  source = "./modules/storage"

  resource_group_name      = var.resource_group_name
  location                 = var.location
  storage_account_name     = var.storage_account_name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  container_name           = var.container_name

  depends_on = [azurerm_resource_group.rg]
}

module "vm" {
  source = "./modules/vm"

  resource_group_name              = var.resource_group_name
  location                         = var.location
  subnet_id                        = module.vnet.subnet1_id
  ip_configuration_name            = var.ip_configuration_name
  private_ip_address_allocation    = var.private_ip_address_allocation
  azure_linux_virtual_machine_name = var.azure_linux_virtual_machine_name
  size                             = var.size
  caching                          = var.caching
  storage_account_type             = var.storage_account_type
  admin_password                   = var.admin_password
  image_publisher                  = var.image_publisher
  image_offer                      = var.image_offer
  image_sku                        = var.image_sku
  image_version                    = var.image_version

  depends_on = [azurerm_resource_group.rg]
}

module "vm2" {
  source = "./modules/vm"

  resource_group_name              = var.resource_group_name
  location                         = var.location
  subnet_id                        = module.vnet.subnet2_id
  ip_configuration_name            = var.ip_configuration_name2
  private_ip_address_allocation    = var.private_ip_address_allocation
  azure_linux_virtual_machine_name = var.azure_linux_virtual_machine_name2
  size                             = var.size
  caching                          = var.caching
  storage_account_type             = var.storage_account_type
  admin_password                   = var.admin_password
  image_publisher                  = var.image_publisher
  image_offer                      = var.image_offer
  image_sku                        = var.image_sku
  image_version                    = var.image_version

  depends_on = [azurerm_resource_group.rg]
}

module "load_balancer" {
  source = "./modules/load_balancer"

  resource_group_name       = var.resource_group_name
  location                  = var.location
  lb_name                   = var.lb_name
  lb_sku                    = var.lb_sku
  allocation_method         = var.allocation_method
  nic_id_vm1                = module.vm.nic_id
  nic_id_vm2                = module.vm2.nic_id
  ip_configuration_name_vm1 = var.ip_configuration_name
  ip_configuration_name_vm2 = var.ip_configuration_name2
  probe_protocol            = var.probe_protocol
  probe_port                = var.probe_port
  probe_request_path        = var.probe_request_path
  lb_rule_protocol          = var.lb_rule_protocol
  frontend_port             = var.frontend_port
  backend_port              = var.backend_port

  depends_on = [azurerm_resource_group.rg, module.vm, module.vm2]
}

module "security_group" {
  source = "./modules/security_group"

  resource_group_name = var.resource_group_name
  location            = var.location
  security_group_name = var.security_group_name
  subnet_id           = module.vnet.subnet1_id

  depends_on = [azurerm_resource_group.rg]
}
