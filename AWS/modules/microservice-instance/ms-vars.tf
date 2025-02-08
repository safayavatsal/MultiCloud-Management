variable "appserver_count" {
  type        = number
  description = "Number of application server instances"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type for the application servers"
}

variable "image" {
  type        = string
  description = "Amazon Machine Image (AMI) ID for the application servers"
}

variable "zones" {
  type        = list(string)
  description = "List of availability zones for deployment"
}
