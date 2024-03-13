output "name" {
  value = "postgres"
}

output "username" {
  value     = azurerm_postgresql_flexible_server.main.administrator_login
  sensitive = true
}

output "password" {
  value     = azurerm_postgresql_flexible_server.main.administrator_password
  sensitive = true
}

output "host" {
  value = azurerm_private_endpoint.endpoint.private_service_connection[0].private_ip_address
}

output "port" {
  value = 5432
}

output "ssl_mode" {
  value = "require"
}

output "server_id" {
  value = azurerm_postgresql_flexible_server.main.id
}
