variable "resource_group" {
  description = "The name of the resource group where resources will be created"
  type        = string
}

variable "region" {
  description = "Azure region where the resources will be deployed"
  type        = string
  default     = "East US"
}

variable "db_user" {
  description = "The administrator username for the PostgreSQL database"
  type        = string
}

variable "db_password" {
  description = "The administrator password for the PostgreSQL database"
  type        = string
  sensitive   = true
}

# Disaster Recovery & Replication
variable "aws_replica_enabled" {
  description = "Enable AWS read replica for cross-cloud disaster recovery"
  type        = bool
  default     = false
}

variable "gcp_replica_enabled" {
  description = "Enable GCP read replica for cross-cloud disaster recovery"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}
