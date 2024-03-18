locals {
  # Name restrictions https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules
  default_name = trimsuffix(lower(substr(replace(var.res_id, ".", "-"), 0, 63)), "-")
}

resource "azurerm_postgresql_flexible_server_database" "db" {
  name      = coalesce(var.database_name, local.default_name)
  server_id = var.server_id
  charset   = "UTF8"
  collation = "en_US.utf8"
}
