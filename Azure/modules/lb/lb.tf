resource "azurerm_lb" "load_balancer" {
  name                = "${var.name}-lb"
  location            = var.region
  resource_group_name = var.resource_group
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIP"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

resource "azurerm_public_ip" "lb_public_ip" {
  name                = "${var.name}-lb-ip"
  location            = var.region
  resource_group_name = var.resource_group
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name                = "BackendPool"
  loadbalancer_id     = azurerm_lb.load_balancer.id
}

resource "azurerm_lb_probe" "health_probe" {
  name                = "${var.name}-health-probe"
  loadbalancer_id     = azurerm_lb.load_balancer.id
  protocol            = "Http"
  port               = 80
  request_path        = "/"
}

resource "azurerm_lb_rule" "http_rule" {
  name                           = "${var.name}-http-rule"
  loadbalancer_id                = azurerm_lb.load_balancer.id
  frontend_ip_configuration_name = "PublicIP"
  backend_address_pool_id        = azurerm_lb_backend_address_pool.backend_pool.id
  probe_id                       = azurerm_lb_probe.health_probe.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
}

resource "azurerm_linux_virtual_machine_scale_set" "webserver_vmss" {
  name                = "${var.name}-vmss"
  resource_group_name = var.resource_group
  location            = var.region
  sku                 = "Standard_B1ms"
  instances           = var.webserver_count
  admin_username      = "adminuser"

  network_interface {
    name                      = "vmss-nic"
    primary                   = true
    ip_configuration {
      name                          = "internal"
      subnet_id                     = azurerm_subnet.main.id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.backend_pool.id]
    }
  }

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

