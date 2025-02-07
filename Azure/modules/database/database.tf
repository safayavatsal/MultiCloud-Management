resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "azurerm_postgresql_flexible_server" "postgres_db" {
  name                   = "postgres-instance-${random_id.db_name_suffix.hex}"
  location               = var.region
  resource_group_name    = var.resource_group
  administrator_login    = var.db_user
  administrator_password = var.db_password
  sku_name               = "B_Standard_B1ms" # Equivalent to "db-f1-micro" in Azure
  version                = "11"
  storage_mb             = 32768 # 32 GB storage

  backup_retention_days  = 7
  geo_redundant_backup_enabled = false
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_all" {
  name                = "allow-all"
  server_id          = azurerm_postgresql_flexible_server.postgres_db.id
  start_ip_address   = "0.0.0.0"
  end_ip_address     = "255.255.255.255"
}

