locals {
  # Name restrictions https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules
  default_name = trimsuffix(lower(substr("${var.prefix}${var.app_id}-${var.env_id}-${replace(var.res_id, ".", "-")}", 0, 63)), "-")

  name = coalesce(var.name, local.default_name)

  default_username = "main"

  tags = {
    "managed-by" = "terraform"
    "humanitec"  = "true"
    "hum-app"    = var.app_id
    "hum-env"    = var.env_id
    "hum-res"    = var.res_id
  }
}

data "azurerm_resource_group" "postgres" {
  name = var.resource_group_name
}

data "azurerm_resource_group" "workload" {
  name = var.workload_resource_group_name
}

data "azurerm_virtual_network" "vn" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.workload.name
}

data "azurerm_subnet" "vn_subnets" {
  for_each             = toset(data.azurerm_virtual_network.vn.subnets)
  name                 = each.value
  virtual_network_name = data.azurerm_virtual_network.vn.name
  resource_group_name  = data.azurerm_virtual_network.vn.resource_group_name
}

resource "random_password" "password" {
  length  = 16
  special = false
}

resource "azurerm_postgresql_flexible_server" "main" {
  name                = local.name
  location            = data.azurerm_resource_group.postgres.location
  resource_group_name = data.azurerm_resource_group.postgres.name

  administrator_login    = coalesce(var.administrator_login, local.default_username)
  administrator_password = coalesce(var.administrator_password, random_password.password.result)

  sku_name   = var.sku_name
  version    = var.postgres_version
  storage_mb = var.storage_mb

  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  auto_grow_enabled            = var.auto_grow_enabled

  tags = local.tags

  lifecycle {
    ignore_changes = [
      zone,
    ]
  }
}

resource "azurerm_private_endpoint" "endpoint" {
  name                = coalesce(var.name, local.default_name)
  location            = data.azurerm_virtual_network.vn.location
  resource_group_name = data.azurerm_virtual_network.vn.resource_group_name
  subnet_id           = data.azurerm_subnet.vn_subnets[var.subnet_name].id

  private_service_connection {
    name                           = coalesce(var.name, local.default_name)
    private_connection_resource_id = azurerm_postgresql_flexible_server.main.id
    subresource_names              = ["postgresqlServer"]
    is_manual_connection           = false
  }

  tags = local.tags
}
