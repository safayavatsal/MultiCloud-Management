variable "no_of_db_instances" {}

variable "db_name" {}

variable "db_user" {}

variable "db_password" {
  description = "The administrator password for the PostgreSQL database"
  type        = string
  sensitive   = true
}

# Disaster Recovery & Replication
variable "gcp_replica_enabled" {
  description = "Enable GCP read replica for cross-cloud disaster recovery"
  type        = bool
  default     = false
}

variable "azure_replica_enabled" {
  description = "Enable Azure read replica for cross-cloud disaster recovery"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}
