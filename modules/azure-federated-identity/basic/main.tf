locals {
  # Name restrictions https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules
  default_name = trimsuffix(lower(substr("${var.prefix}${var.app_id}-${var.env_id}-${replace(var.res_id, ".", "-")}", 0, 63)), "-")
}

resource "azurerm_federated_identity_credential" "main" {
  name                = coalesce(var.name, local.default_name)
  resource_group_name = var.resource_group_name
  audience            = var.audience
  issuer              = var.issuer
  parent_id           = var.parent_id
  subject             = var.subject
}
