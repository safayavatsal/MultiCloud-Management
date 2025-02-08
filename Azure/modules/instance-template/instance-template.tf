resource "azurerm_linux_virtual_machine_scale_set" "ws_instance_template" {
  count               = var.enable_autoscaling ? 1 : 0
  name                = "${var.name}-vmss"
  resource_group_name = var.resource_group
  location            = var.region
  sku                 = var.instance_type
  instances           = var.webserver_count
  admin_username      = "adminuser"

  admin_ssh_key {
    username   = "adminuser"
    public_key = file(var.ssh_key)
  }

  network_interface {
    name    = "${var.name}-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      subnet_id = var.subnet_id

      public_ip_address {
        allocation_method = "Dynamic"
      }
    }
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching             = "ReadWrite"
  }

  custom_data = filebase64("${path.module}/scripts/startup.sh")

  tags = {
    environment = var.env
  }
}
