variable "name" {
  description = "Name prefix for the AWS Launch Template"
  type        = string
}

variable "instance_type" {
  description = "AWS Instance Type"
  type        = string
}

variable "image" {
  description = "AMI ID for the instance"
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
  description = "AWS Region"
  type        = string
}

variable "subnet_id" {
  description = "AWS Subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID for the instance"
  type        = string
}

variable "ssh_key_name" {
  description = "SSH Key Pair name for the instance"
  type        = string
}
