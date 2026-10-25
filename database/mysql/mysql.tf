
resource "azurerm_resource_group" "db" {
  name     = "rg-mysql-demo"
  location = var.location
}

resource "azurerm_mysql_flexible_server" "db" {
  name                = var.server_name
  resource_group_name = azurerm_resource_group.db.name
  location            = azurerm_resource_group.db.location
  version             = "8.0.21"

  administrator_login    = "mysqladmin"
  administrator_password = var.administrator_password
  sku_name               = "B_Standard_B1ms" # 1 vCore, 2 GiB RAM.

  storage {
    size_gb            = 32
    auto_grow_enabled  = false
    io_scaling_enabled = false
  }

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  public_network_access        = "Enabled"

  # Omit the high_availability block to keep HA disabled.
  # Standard pay-as-you-go usage needs no separate billing argument.
}

resource "azurerm_mysql_flexible_database" "db" {
  name                = "catalogdb"
  resource_group_name = azurerm_resource_group.db.name
  server_name         = azurerm_mysql_flexible_server.db.name
  charset             = "utf8mb4"
  collation           = "utf8mb4_unicode_ci"
}

resource "azurerm_mysql_flexible_server_firewall_rule" "client" {
  name                = "allow-client-ip"
  resource_group_name = azurerm_resource_group.db.name
  server_name         = azurerm_mysql_flexible_server.db.name
  start_ip_address    = var.allowed_client_ip
  end_ip_address      = var.allowed_client_ip
}

