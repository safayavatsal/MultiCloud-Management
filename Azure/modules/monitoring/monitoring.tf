resource "azurerm_monitor_metric_alert" "high_cpu" {
  name                = "high-cpu-alert"
  resource_group_name = var.resource_group
  scopes              = [var.vm_id]
  description         = "Triggers when CPU usage exceeds 80%."
  severity            = 2
  frequency           = "PT1M"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = azurerm_monitor_action_group.email_alert.id
  }
}

resource "azurerm_monitor_action_group" "email_alert" {
  name                = "email-alert-group"
  resource_group_name = var.resource_group
  short_name          = "alerts"

  email_receiver {
    name          = "admin"
    email_address = var.alert_email
  }
}
