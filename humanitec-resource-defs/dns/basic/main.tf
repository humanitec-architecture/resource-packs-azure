resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}dns-basic"
  name        = "${var.prefix}dns-basic"
  type        = "dns"

  driver_inputs = {
    secrets_string = jsonencode({
      variables = {
        client_id     = var.client_id
        client_secret = var.client_secret
      }
    })

    values_string = jsonencode({
      source = {
        path = "modules/dns/basic"
        rev  = var.resource_packs_azure_rev
        url  = var.resource_packs_azure_url
      }

      variables = {
        res_id    = "$${context.res.id}"
        app_id    = "$${context.app.id}"
        env_id    = "$${context.env.id}"
        subdomain = "$${context.app.id}-$${context.env.id}"

        tenant_id           = var.tenant_id
        subscription_id     = var.subscription_id
        dns_zone            = var.dns_zone
        resource_group_name = var.resource_group_name
      }
    })
  }
}
