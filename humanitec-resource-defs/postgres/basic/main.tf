resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}postgres-basic"
  name        = "${var.prefix}postgres-basic"
  type        = "postgres"

  driver_account = var.driver_account
  driver_inputs = {
    secrets_string = jsonencode({
      variables = {
        administrator_login    = "$${resources['${var.instance_resource}'].outputs.username}"
        administrator_password = "$${resources['${var.instance_resource}'].outputs.password}"
      }
    })

    values_string = jsonencode({
      source = {
        path = "modules/postgres/basic"
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

        subscription_id = var.subscription_id
        server_id       = "$${resources['${var.instance_resource}'].outputs.server_id}"
        host            = "$${resources['${var.instance_resource}'].outputs.host}"
      }
    })
  }
}
