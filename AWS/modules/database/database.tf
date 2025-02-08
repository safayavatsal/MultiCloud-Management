resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "aws_db_instance" "xcloud_postgres_db" {
  name                   = "postgres_instance_${random_id.db_name_suffix.hex}"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "12.4"
  instance_class         = "db.t2.micro"
  username               = var.db_user
  password               = var.db_password
  final_snapshot_identifier = "xcloud-postgres-db-backup"
  skip_final_snapshot    = false

  backup_retention_period = 7
  storage_encrypted       = true

  # Enable Multi-AZ for DR
  multi_az = true

  # Enable Cross-Region Read Replica
  replicate_source_db = var.gcp_replica_source
}
