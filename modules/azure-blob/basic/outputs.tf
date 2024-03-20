output "account" {
  value = var.storage_account_name
}

output "container" {
  value = azurerm_storage_container.container.name
}
