variable "name" {}
variable "region" {}
variable "resource_group_name" {}

# VPN variables for Multi-Cloud Connectivity
variable "aws_vpn_public_ip" {
  description = "Public IP of the AWS VPN Gateway"
  type        = string
}

variable "gcp_vpn_public_ip" {
  description = "Public IP of the GCP VPN Gateway"
  type        = string
}

variable "vpn_shared_secret" {
  description = "Shared secret for VPN tunnels"
  type        = string
  sensitive   = true
}
