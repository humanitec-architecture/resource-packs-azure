resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}federated-identity-basic"
  name        = "${var.prefix}federated-identity-basic"
  type        = "azure-federated-identity"

  driver_inputs = {
    secrets_string = jsonencode({
      variables = {
        client_id     = var.client_id
        client_secret = var.client_secret
      }
    })

    values_string = jsonencode({
      source = {
        path = "modules/azure-federated-identity/basic"
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
