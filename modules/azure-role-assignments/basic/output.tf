output "ids" {
  value = azurerm_role_assignment.main[*].id
}
