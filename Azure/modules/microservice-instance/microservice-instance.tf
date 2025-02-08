resource "random_id" "app_name_suffix" {
  byte_length = 4
}

resource "azurerm_network_interface" "app_nic" {
  for_each            = toset(var.zones)
  name                = "app-nic-${each.key}"
  location            = var.region
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "apps" {
  for_each            = toset(var.zones)
  name                = "apps-${random_id.app_name_suffix.hex}-${each.key}"
  resource_group_name = var.resource_group
  location            = var.region
  size                = var.instance_type
  admin_username      = "adminuser"

  network_interface_ids = [azurerm_network_interface.app_nic[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
