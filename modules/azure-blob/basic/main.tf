locals {
  # Name restrictions https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules
  default_name = replace(lower(substr("${var.prefix}${var.app_id}-${var.env_id}-${replace(var.res_id, ".", "-")}", 0, 24)), "-", "")
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "account" {
  name                     = coalesce(var.name, local.default_name)
  resource_group_name      = data.azurerm_resource_group.main.name
  location                 = data.azurerm_resource_group.main.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    "managed-by" = "terraform"
    "humanitec"  = "true"
    "hum-app"    = var.app_id
    "hum-env"    = var.env_id
    "hum-res"    = var.res_id
  }
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.account.name
  container_access_type = var.container_access_type
}