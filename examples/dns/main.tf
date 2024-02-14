resource "humanitec_application" "example" {
  id   = var.name
  name = var.name
}

module "dns" {
  source = "../../humanitec-resource-defs/dns/basic"
  prefix = var.prefix

  resource_packs_azure_url = var.resource_packs_azure_url
  resource_packs_azure_rev = var.resource_packs_azure_rev
  client_id                = var.client_id
  client_secret            = var.client_secret
  tenant_id                = var.tenant_id
  subscription_id          = var.subscription_id
  dns_zone                 = var.dns_zone
  resource_group_name      = var.resource_group_name

}

resource "humanitec_resource_definition_criteria" "dns" {
  resource_definition_id = module.dns.id
  app_id                 = humanitec_application.example.id
}
