resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}role-definition-basic"
  name        = "${var.prefix}role-definition-basic"
  type        = "azure-role-definition"

  driver_inputs = {
    secrets_string = jsonencode({
      variables = {
        client_id     = var.client_id
        client_secret = var.client_secret
      }
    })

    values_string = jsonencode({
      source = {
        path = "modules/azure-role-definition/basic"
        rev  = var.resource_packs_azure_rev
        url  = var.resource_packs_azure_url
      }

      variables = {
        res_id = "$${context.res.id}"
        app_id = "$${context.app.id}"
        env_id = "$${context.env.id}"
        prefix = var.prefix

        name            = var.name
        tenant_id       = var.tenant_id
        subscription_id = var.subscription_id
        prefix          = var.prefix
        scope           = var.scope
        actions         = var.actions
        data_actions    = var.data_actions
      }
    })
  }
}
