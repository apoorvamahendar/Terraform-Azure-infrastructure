resource "azurerm_network_interface" "nic" {
  name                = "${var.azure_linux_virtual_machine_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}

resource "azurerm_linux_virtual_machine" "lvm" {
  name                            = var.azure_linux_virtual_machine_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = var.size
  admin_username                  = "adminuser"
  admin_password                  = var.admin_password
  disable_password_authentication = false
  custom_data = base64encode(<<-EOF
    #!/bin/bash
    apt update
    apt install nginx -y
    echo "<h1>Welcome to Terraform</h1>" > /var/www/html/index.html
    systemctl start nginx
    systemctl enable nginx
  EOF
  )
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]
  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }
  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}
