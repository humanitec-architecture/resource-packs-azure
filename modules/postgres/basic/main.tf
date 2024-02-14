locals {
  # Name restrictions https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules
  default_name = trimsuffix(lower(substr("${var.prefix}${var.app_id}-${var.env_id}-${replace(var.res_id, ".", "-")}", 0, 63)), "-")
}

data "azurerm_resource_group" "resouce" {
  name = var.resource_group_name
}

resource "azurerm_postgresql_server" "main" {
  name                = coalesce(var.name, local.default_name)
  location            = data.azurerm_resource_group.resouce.location
  resource_group_name = var.resource_group_name

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  sku_name   = var.sku_name
  version    = var.postgres_version
  storage_mb = var.storage_mb

  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  auto_grow_enabled            = var.auto_grow_enabled

  public_network_access_enabled    = var.public_network_access_enabled
  ssl_enforcement_enabled          = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced = var.ssl_minimal_tls_version_enforced

  tags = {
    "managed-by" = "terraform"
    "humanitec"  = "true"
    "hum-app"    = var.app_id
    "hum-env"    = var.env_id
    "hum-res"    = var.res_id
  }
}

resource "azurerm_postgresql_database" "db" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.main.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

data "azurerm_virtual_network" "vn" {
  name                = var.virtual_network_name
  resource_group_name = var.virtual_network_resource_group_name
}

data "azurerm_subnet" "vn_subnets" {
  for_each             = toset(data.azurerm_virtual_network.vn.subnets)
  name                 = each.value
  virtual_network_name = data.azurerm_virtual_network.vn.name
  resource_group_name  = data.azurerm_virtual_network.vn.resource_group_name
}

resource "azurerm_private_endpoint" "endpoint" {
  name                = coalesce(var.name, local.default_name)
  location            = data.azurerm_resource_group.resouce.location
  resource_group_name = data.azurerm_virtual_network.vn.resource_group_name
  subnet_id           = data.azurerm_subnet.vn_subnets[var.subnet_name].id

  private_service_connection {
    name                           = coalesce(var.name, local.default_name)
    private_connection_resource_id = azurerm_postgresql_server.main.id
    subresource_names              = ["postgresqlServer"]
    is_manual_connection           = false
  }
}
