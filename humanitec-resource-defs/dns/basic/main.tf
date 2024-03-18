resource "humanitec_resource_definition" "main" {
  driver_type = "humanitec/terraform"
  id          = "${var.prefix}dns-basic"
  name        = "${var.prefix}dns-basic"
  type        = "dns"

  driver_account = var.driver_account
  driver_inputs = {
    values_string = jsonencode({
      source = {
        path = "modules/dns/basic"
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
        res_id    = "$${context.res.id}"
        app_id    = "$${context.app.id}"
        env_id    = "$${context.env.id}"
        subdomain = "$${context.app.id}-$${context.env.id}"

        subscription_id     = var.subscription_id
        dns_zone            = var.dns_zone
        resource_group_name = var.resource_group_name
      }
    })
  }
}
