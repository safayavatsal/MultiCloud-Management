variable "name" {
  description = "Name prefix for the Azure VM Scale Set"
  type        = string
}

variable "resource_group" {
  description = "Azure Resource Group"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "subnet_id" {
  description = "Azure Subnet ID"
  type        = string
}

variable "instance_type" {
  description = "Azure VM Size"
  type        = string
}

variable "enable_autoscaling" {
  description = "Enable or disable autoscaling"
  type        = bool
  default     = false
}

variable "env" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "region" {
  description = "Azure Region"
  type        = string
}

variable "image" {
  description = "OS Image for the VM"
  type        = string
}

variable "admin_username" {
  description = "Default admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password (if using password authentication)"
  type        = string
  sensitive   = true
}
