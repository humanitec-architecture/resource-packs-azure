resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}managed-identity-basic"
  name        = "${var.prefix}managed-identity-basic"
  type        = "azure-managed-identity"

  driver_inputs = {
    secrets_string = jsonencode({
      variables = {
        client_id     = var.client_id
        client_secret = var.client_secret
      }
    })

    values_string = jsonencode({
      source = {
        path = "modules/azure-managed-identity/basic"
        rev  = var.resource_packs_azure_rev
        url  = var.resource_packs_azure_url
      }

      variables = {
        res_id = "$${context.res.id}"
        app_id = "$${context.app.id}"
        env_id = "$${context.env.id}"

        name                = var.name
        tenant_id           = var.tenant_id
        subscription_id     = var.subscription_id
        resource_group_name = var.resource_group_name
      }
    })
  }

  provision = {
    "azure-role-assignments" = {
      match_dependents = false
      is_dependent     = true
    }
  }
}
