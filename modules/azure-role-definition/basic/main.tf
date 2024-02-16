locals {
  # Name restrictions https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules
  default_name = trimsuffix(lower(substr("${var.prefix}${var.app_id}-${var.env_id}-${replace(var.res_id, ".", "-")}", 0, 36)), "-")
}

resource "azurerm_role_definition" "main" {
  name  = coalesce(var.name, local.default_name)
  scope = var.scope

  permissions {
    actions      = var.actions
    data_actions = var.data_actions
  }

  assignable_scopes = [
    var.scope
  ]
}