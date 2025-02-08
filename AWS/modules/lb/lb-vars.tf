variable "image" {}

variable "instance_type" {}

variable "region" {}

variable "zones" { 
  type = list
}

variable "vpc-id" {}

# Multi-cloud Load Balancing & Failover
variable "enable_cross_cloud_lb" {
  description = "Enable cross-cloud load balancing with GCP and Azure"
  type        = bool
  default     = false
}

variable "enable_failover" {
  description = "Enable failover routing in case AWS region goes down"
  type        = bool
  default     = true
}
