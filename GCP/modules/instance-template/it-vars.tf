variable "name" {
  description = "Name prefix for the GCP instance template"
  type        = string
}

variable "project" {
  description = "GCP Project ID"
  type        = string
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "subnet_self_link" {
  description = "Subnet self-link for the instance"
  type        = string
}

variable "instance_type" {
  description = "GCP Instance Type"
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
  description = "GCP Region"
  type        = string
}

variable "image" {
  description = "OS Image for the instance"
  type        = string
}
