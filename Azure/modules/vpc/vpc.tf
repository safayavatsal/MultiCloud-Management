resource "azurerm_virtual_network" "xcloud_vnet" {
  name                = "xcloud-vnet"
  location            = var.region
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "xcloud_subnet" {
  name                 = "${var.name}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.xcloud_vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_security_group" "xcloud_nsg" {
  name                = "xcloud-nsg"
  location            = var.region
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "allow_icmp" {
  name                        = "allow-icmp"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Icmp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.xcloud_nsg.name
}

resource "azurerm_network_security_rule" "allow_http_ports" {
  name                        = "allow-http"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "8080", "1000-2000"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.xcloud_nsg.name
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.xcloud_subnet.id
  network_security_group_id = azurerm_network_security_group.xcloud_nsg.id
}

