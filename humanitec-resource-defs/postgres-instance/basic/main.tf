resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}postgres-instance-basic"
  name        = "${var.prefix}postgres-instance-basic"
  type        = "postgres-instance"

  driver_inputs = {
    secrets_string = jsonencode({
      variables = {
        client_id     = var.client_id
        client_secret = var.client_secret
      }
    })

    values_string = jsonencode({
      source = {
        path = "modules/postgres-instance/basic"
        rev  = var.resource_packs_azure_rev
        url  = var.resource_packs_azure_url
      }

      append_logs_to_error = true

      variables = {
        res_id = "$${context.res.id}"
        app_id = "$${context.app.id}"
        env_id = "$${context.env.id}"

        name                         = var.name
        prefix                       = var.prefix
        tenant_id                    = var.tenant_id
        subscription_id              = var.subscription_id
        resource_group_name          = var.resource_group_name
        administrator_login          = var.administrator_login
        administrator_password       = var.administrator_password
        sku_name                     = var.sku_name
        postgres_version             = var.postgres_version
        storage_mb                   = var.storage_mb
        backup_retention_days        = var.backup_retention_days
        geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
        auto_grow_enabled            = var.auto_grow_enabled
        virtual_network_name         = var.virtual_network_name
        subnet_name                  = var.subnet_name
        # private_dns_zone_id          = var.private_dns_zone_id
        workload_resource_group_name = var.workload_resource_group_name
      }
    })
  }
}
