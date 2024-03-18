output "name" {
  value = azurerm_postgresql_flexible_server_database.db.name
}

output "username" {
  value     = var.administrator_login
  sensitive = true
}

output "password" {
  value     = var.administrator_password
  sensitive = true
}

output "host" {
  value = var.host
}

output "port" {
  value = 5432
}

output "ssl_mode" {
  value = "require"
}
