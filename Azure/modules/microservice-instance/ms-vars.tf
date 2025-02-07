variable "appserver_count" {
  type        = number
  description = "Number of application server instances"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group"
}

variable "location" {
  type        = string
  description = "Azure region for deployment"
}

variable "vnet_name" {
  type        = string
  description = "Virtual Network name"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for app servers"
}

variable "zones" {
  type        = list(string)
  description = "List of availability zones for high availability"
}

variable "image" {
  type        = string
  description = "OS image reference for the VM"
}

variable "instance_type" {
  type        = string
  description = "VM size/type for the application servers"
}

