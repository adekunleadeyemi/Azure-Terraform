output "connection" {
  description = "Connection settings; use the administrator password supplied to Terraform."
  value = {
    host     = azurerm_mysql_flexible_server.db.fqdn
    database = azurerm_mysql_flexible_database.db.name
    username = azurerm_mysql_flexible_server.db.administrator_login
    port     = 3306
    ssl_mode = "REQUIRED"
  }
}
