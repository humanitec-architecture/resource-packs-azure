resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}postgres-basic"
  name        = "${var.prefix}postgres-basic"
  type        = "postgres"

  driver_inputs = {
    secrets_string = jsonencode({
      variables = {
        client_id     = var.client_id
        client_secret = var.client_secret

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

      variables = {
        res_id = "$${context.res.id}"
        app_id = "$${context.app.id}"
        env_id = "$${context.env.id}"

        tenant_id       = var.tenant_id
        subscription_id = var.subscription_id
        server_id       = "$${resources['${var.instance_resource}'].outputs.server_id}"
        host            = "$${resources['${var.instance_resource}'].outputs.host}"
      }
    })
  }
}
