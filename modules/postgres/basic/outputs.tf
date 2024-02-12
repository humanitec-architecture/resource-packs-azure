output "name" {
  value = azurerm_postgresql_database.db.name
}

output "username" {
  value     = "${var.administrator_login}@${azurerm_postgresql_server.main.name}"
  sensitive = true
}

output "password" {
  value     = var.administrator_login_password
  sensitive = true
}

output "host" {
  value = azurerm_private_endpoint.endpoint.private_service_connection[0].private_ip_address
}

output "port" {
  value = 5432
}
