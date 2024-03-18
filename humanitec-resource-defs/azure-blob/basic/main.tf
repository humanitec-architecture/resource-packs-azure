resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}azure-blob-storage-basic"
  name        = "${var.prefix}azure-blob-storage-basic"
  type        = "azure-blob"

  driver_account = var.driver_account
  driver_inputs = {
    values_string = jsonencode({
      source = {
        path = "modules/azure-blob/basic"
        rev  = var.resource_packs_azure_rev
        url  = var.resource_packs_azure_url
      }

      append_logs_to_error = var.append_logs_to_error

      credentials_config = {
        environment = {
          ARM_CLIENT_ID     = "appId"
          ARM_CLIENT_SECRET = "password"
          ARM_TENANT_ID     = "tenant"
        }
      }

      variables = {
        res_id = "$${context.res.id}"
        app_id = "$${context.app.id}"
        env_id = "$${context.env.id}"

        subscription_id          = var.subscription_id
        resource_group_name      = var.resource_group_name
        name                     = var.name
        prefix                   = var.prefix
        account_tier             = var.account_tier
        account_replication_type = var.account_replication_type
        container_name           = var.container_name
        container_access_type    = var.container_access_type
      }
    })
  }
}
