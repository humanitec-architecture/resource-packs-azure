output "account" {
  value = azurerm_storage_account.account.name
}

output "container" {
  value = azurerm_storage_container.container.name
}
