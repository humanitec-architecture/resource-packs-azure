output "host" {
  value = azurerm_redis_cache.main.hostname
}

output "port" {
  value = azurerm_redis_cache.main.ssl_port
}

output "username" {
  # redis doesn't use usernames yet
  value = ""
}

output "password" {
  value     = azurerm_redis_cache.main.primary_access_key
  sensitive = true
}
