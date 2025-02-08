variable "resource_group" {
  description = "Azure Resource Group"
  type        = string
}

variable "vm_id" {
  description = "ID of the Azure Virtual Machine"
  type        = string
}

variable "alert_email" {
  description = "Email address for receiving alerts"
  type        = string
}
