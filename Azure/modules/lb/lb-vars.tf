variable "name" {}
variable "resource_group" {}  # Azure requires a resource group
variable "region" {}
variable "webserver_count" {}
variable "vmss_id" {}  # Azure uses VM Scale Sets instead of instance templates
variable "zones" { type = list }

