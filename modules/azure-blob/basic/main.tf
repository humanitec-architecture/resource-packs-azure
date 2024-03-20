locals {
  # Name restrictions https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules
  default_name = replace(lower(substr("${var.prefix}${var.app_id}-${var.env_id}-${replace(var.res_id, ".", "-")}", 0, 24)), "-", "")
}

resource "azurerm_storage_container" "container" {
  name                  = coalesce(var.name, local.default_name)
  storage_account_name  = var.storage_account_name
  container_access_type = var.container_access_type
}
