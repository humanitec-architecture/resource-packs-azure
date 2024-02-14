resource "humanitec_application" "example" {
  id   = var.name
  name = var.name
}

module "mysql" {
  source = "../../humanitec-resource-defs/mysql/basic"

  prefix                              = var.prefix
  resource_packs_azure_url            = var.resource_packs_azure_url
  resource_packs_azure_rev            = var.resource_packs_azure_rev
  client_id                           = var.client_id
  client_secret                       = var.client_secret
  tenant_id                           = var.tenant_id
  subscription_id                     = var.subscription_id
  resource_group_name                 = var.resource_group_name
  administrator_login                 = var.administrator_login
  administrator_login_password        = var.administrator_login_password
  virtual_network_name                = var.virtual_network_name
  virtual_network_resource_group_name = var.virtual_network_resource_group_name
  subnet_name                         = var.subnet_name
}

resource "humanitec_resource_definition_criteria" "mysql" {
  resource_definition_id = module.mysql.id
  app_id                 = humanitec_application.example.id
}
