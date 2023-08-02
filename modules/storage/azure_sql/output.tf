output "server_id" {
  value = azurerm_sql_server.sql.id    
}
output "db_id" {
  value = azurerm_mssql_database.sql.id    
}
