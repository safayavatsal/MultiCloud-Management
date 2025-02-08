variable "appserver_count" {
  type        = number
  description = "Number of application server instances"
}

variable "vpc_name" {
  type        = string
  description = "VPC network name"
}

variable "subnet_self_link" {
  type        = string
  description = "Self-link of the subnet for app servers"
}

variable "zones" {
  type        = list(string)
  description = "List of availability zones for deployment"
}

variable "image" {
  type        = string
  description = "OS image reference for the VM instances"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the application servers"
}
