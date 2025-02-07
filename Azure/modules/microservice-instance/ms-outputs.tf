#output "app_vm_private_ips" {
#  value = { for key, vm in azurerm_linux_virtual_machine.apps : key => vm.private_ip_address }
#}
#
#output "app_vm_public_ips" {
#  value = { for key, nic in azurerm_network_interface.app_nic : key => nic.ip_configuration[0].public_ip_address }
#}

