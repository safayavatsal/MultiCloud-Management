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

# Azure VPN Gateway
resource "azurerm_virtual_network_gateway" "xcloud_vpn" {
  name                = "xcloud-vpn"
  location            = var.region
  resource_group_name = var.resource_group_name
  type                = "Vpn"
  vpn_type            = "RouteBased"
  sku                 = "VpnGw1"

  ip_configuration {
    name                          = "xcloud-vpn-config"
    public_ip_address_id          = azurerm_public_ip.xcloud_vpn.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.xcloud_subnet.id
  }
}

resource "azurerm_public_ip" "xcloud_vpn" {
  name                = "xcloud-vpn-ip"
  location            = var.region
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}
