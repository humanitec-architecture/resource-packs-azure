resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}federated-identity-basic"
  name        = "${var.prefix}federated-identity-basic"
  type        = "azure-federated-identity"

  driver_account = var.driver_account
  driver_inputs = {
    values_string = jsonencode({
      source = {
        path = "modules/azure-federated-identity/basic"
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
        audience            = var.audience
        issuer              = var.issuer
        parent_id           = var.parent_id
        subject             = var.subject
      }
    })
  }
}
