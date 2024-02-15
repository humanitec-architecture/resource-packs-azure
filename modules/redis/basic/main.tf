locals {
  # Name restrictions https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules
  default_name = trimsuffix(lower(substr("${var.prefix}${var.app_id}-${var.env_id}-${replace(var.res_id, ".", "-")}", 0, 63)), "-")
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_redis_cache" "main" {
  name                = coalesce(var.name, local.default_name)
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  capacity            = var.capacity
  family              = var.family
  sku_name            = var.sku_name
  enable_non_ssl_port = var.enable_non_ssl_port
  minimum_tls_version = var.minimum_tls_version

  redis_configuration {
  }

  tags = {
    "managed-by" = "terraform"
    "humanitec"  = "true"
    "hum-app"    = var.app_id
    "hum-env"    = var.env_id
    "hum-res"    = var.res_id
  }
}
