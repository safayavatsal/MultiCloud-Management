variable "region" {}
variable "zones" { 
  type = list(string) 
}

# VPN variables for Multi-Cloud Connectivity
variable "gcp_vpn_public_ip" {
  description = "Public IP of the GCP VPN Gateway"
  type        = string
}

variable "azure_vpn_public_ip" {
  description = "Public IP of the Azure VPN Gateway"
  type        = string
}

variable "vpn_shared_secret" {
  description = "Shared secret for VPN tunnels"
  type        = string
  sensitive   = true
}
