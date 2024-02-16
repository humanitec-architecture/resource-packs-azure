resource "azurerm_role_assignment" "main" {
  count = length(var.role_definition_ids)

  scope              = var.scopes[count.index]
  role_definition_id = var.role_definition_ids[count.index]
  principal_id       = var.principal_id
}
