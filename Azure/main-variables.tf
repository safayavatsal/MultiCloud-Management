variable "name" {
  default = "xcloud-project"
}

variable "resource_group" {}

variable "region" {
  default = "West Europe"
}

variable "zones" {
  default = ["1", "2"]
}

variable "env" {
  default = "dev"
}

variable "network_name" {
  default = "xcloud-network"
}

variable "image" {
  default = "Canonical:UbuntuServer:18.04-LTS:latest"
}

variable "appserver_count" {
  default = 1
}

variable "webserver_count" {
  default = 2
}

variable "app_image" {
  default = "OpenLogic:CentOS:7.9:latest"
}

variable "instance_type" {
  default = "Standard_B1s"
}

variable "no_of_db_instances" {
  default = 1
}

variable "enable_autoscaling" {
  default = true
}

variable "db_user" {}

variable "db_password" {}

