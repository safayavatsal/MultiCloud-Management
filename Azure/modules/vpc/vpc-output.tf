output "vpc-name" {
  value = azurerm_virtual_network.xcloud-vpc.name
}

output "subnet-self_link" {
  value = azurerm_subnet.xcloud-subnet.id
}

