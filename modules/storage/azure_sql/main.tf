resource "azurerm_sql_server" "sql" {
  name                         = var.sqlservername
  resource_group_name          = var.rgname
  location                     = var.location
  version                      = var.db_version
  administrator_login          = var.username
  administrator_login_password = var.password
  tags = {
    Environment = var.Environment
  }
}
resource "azurerm_mssql_database" "sql" {
  name           = var.dbname
  server_id      = azurerm_sql_server.sql.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = var.dbsize
  read_scale     = true
  sku_name       = var.sku_name
  zone_redundant = false

  tags = {
    Environment = var.Environment
  }
}

