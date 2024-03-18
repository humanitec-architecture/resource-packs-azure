# Service principal used by Humanitec to provision resources
data "azurerm_resource_group" "resource" {
  name = var.resource_group_name
}

data "azurerm_resource_group" "workload" {
  name = var.workload_resource_group_name
}

resource "azuread_application" "humanitec_provisioner" {
  display_name = var.name
}

resource "azuread_service_principal" "humanitec_provisioner" {
  client_id = azuread_application.humanitec_provisioner.client_id
}

resource "azuread_service_principal_password" "humanitec_provisioner" {
  service_principal_id = azuread_service_principal.humanitec_provisioner.object_id
}

resource "azurerm_role_assignment" "resource_group_resource" {
  scope                = data.azurerm_resource_group.resource.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.humanitec_provisioner.object_id
}

resource "azurerm_role_assignment" "resource_group_workload" {
  scope                = data.azurerm_resource_group.workload.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.humanitec_provisioner.object_id
}

resource "humanitec_resource_account" "humanitec_provisioner" {
  id   = var.name
  name = var.name
  type = "azure"

  credentials = jsonencode({
    "appId" : azuread_service_principal.humanitec_provisioner.client_id,
    "displayName" : azuread_application.humanitec_provisioner.display_name,
    "password" : azuread_service_principal_password.humanitec_provisioner.value,
    "tenant" : azuread_service_principal.humanitec_provisioner.application_tenant_id
  })
}

# Example application and resource definition criteria

# Define the shared postgres-instance resource id and class
locals {
  postgres_instance_res_id = "main-postgres"
  postgres_instance_class  = "default"
}

resource "humanitec_application" "example" {
  id   = var.name
  name = var.name
}

module "postgres_instance" {
  source = "../../humanitec-resource-defs/postgres-instance/basic"

  prefix                       = var.prefix
  resource_packs_azure_url     = var.resource_packs_azure_url
  resource_packs_azure_rev     = var.resource_packs_azure_rev
  append_logs_to_error         = true
  driver_account               = humanitec_resource_account.humanitec_provisioner.id
  subscription_id              = var.subscription_id
  resource_group_name          = data.azurerm_resource_group.resource.name
  administrator_login          = var.administrator_login
  administrator_password       = var.administrator_password
  virtual_network_name         = var.virtual_network_name
  subnet_name                  = var.subnet_name
  workload_resource_group_name = data.azurerm_resource_group.workload.name

  depends_on = [
    # Otherwise the account looses permissions before the resources are deleted
    azurerm_role_assignment.resource_group_resource,
    azurerm_role_assignment.resource_group_workload
  ]
}

resource "humanitec_resource_definition_criteria" "postgres_instance" {
  resource_definition_id = module.postgres_instance.id
  app_id                 = humanitec_application.example.id
  res_id                 = local.postgres_instance_res_id
  class                  = local.postgres_instance_class

  force_delete = true
}

module "postgres" {
  source = "../../humanitec-resource-defs/postgres/basic"

  prefix                   = var.prefix
  resource_packs_azure_url = var.resource_packs_azure_url
  resource_packs_azure_rev = var.resource_packs_azure_rev
  append_logs_to_error     = true
  driver_account           = humanitec_resource_account.humanitec_provisioner.id
  subscription_id          = var.subscription_id
  instance_resource        = "postgres-instance.${local.postgres_instance_class}#${local.postgres_instance_res_id}"

  depends_on = [
    # Otherwise the account looses permissions before the resources are deleted
    azurerm_role_assignment.resource_group_resource,
    azurerm_role_assignment.resource_group_workload
  ]
}

resource "humanitec_resource_definition_criteria" "postgres" {
  resource_definition_id = module.postgres.id
  app_id                 = humanitec_application.example.id

  force_delete = true
}
