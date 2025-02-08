variable "name" {}

variable "project" {}

variable "region" {}

variable "webserver_count" {}

variable "ws-instance_template" {}

variable "zones" { 
  type = list
}

# Multi-cloud Load Balancing & Failover
variable "enable_cross_cloud_lb" {
  description = "Enable cross-cloud load balancing with AWS and Azure"
  type        = bool
  default     = false
}

variable "enable_failover" {
  description = "Enable failover routing in case GCP region goes down"
  type        = bool
  default     = true
}
