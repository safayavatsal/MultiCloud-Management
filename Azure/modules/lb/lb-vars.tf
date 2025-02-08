variable "name" {}

variable "resource_group" {
  description = "Azure requires a resource group"
}

variable "region" {}

variable "webserver_count" {}

variable "vmss_id" {
  description = "Azure uses VM Scale Sets instead of instance templates"
}

variable "zones" { 
  type = list
}

# Multi-cloud Load Balancing & Failover
variable "enable_cross_cloud_lb" {
  description = "Enable cross-cloud load balancing with AWS and GCP"
  type        = bool
  default     = false
}

variable "enable_failover" {
  description = "Enable failover routing in case Azure region goes down"
  type        = bool
  default     = true
}
