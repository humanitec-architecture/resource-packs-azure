resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}service-bus-basic"
  name        = "${var.prefix}service-bus-basic"
  type        = "azure-service-bus-queue"

  driver_account = var.driver_account
  driver_inputs = {
    values_string = jsonencode({
      source = {
        path = "modules/azure-service-bus-queue/basic"
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

        name                = var.name
        subscription_id     = var.subscription_id
        prefix              = var.prefix
        resource_group_name = var.resource_group_name
        sku                 = var.sku
      }
    })
  }
}
