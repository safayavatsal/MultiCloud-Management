variable "name" {}
variable "resource_group" {}  # Azure requires a resource group
variable "vnet_name" {}  # Azure Virtual Network
variable "subnet_id" {}  # Azure uses Subnet ID instead of `self_link`
variable "instance_type" {}
variable "enable_autoscaling" {}
variable "env" {}
variable "region" {}
variable "image" {}
variable "admin_username" { default = "azureuser" }  # Default admin user for VM
variable "admin_password" {}  # Required if using password authentication

