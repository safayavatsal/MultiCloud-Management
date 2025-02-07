variable "resource_group" {
  description = "The name of the resource group where resources will be created"
  type        = string
}

variable "region" {
  description = "Azure region where the resources will be deployed"
  type        = string
  default     = "East US"
}

variable "db_user" {
  description = "The administrator username for the PostgreSQL database"
  type        = string
}

variable "db_password" {
  description = "The administrator password for the PostgreSQL database"
  type        = string
  sensitive   = true
}

