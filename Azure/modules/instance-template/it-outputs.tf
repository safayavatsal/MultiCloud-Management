output "ws_instance_template" {
  value = var.enable_autoscaling ? azurerm_linux_virtual_machine_scale_set.ws_instance_template[0].id : ""
}

