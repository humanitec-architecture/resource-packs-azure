# Service principal used by Humanitec to provision resources
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
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

resource "azurerm_role_assignment" "resource_group" {
  scope                = data.azurerm_resource_group.main.id
  role_definition_name = "Owner"
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

  depends_on = [
    # Otherwise the account looses permissions before the resources are deleted
    azurerm_role_assignment.resource_group
  ]
}

# Example application and resource definition criteria

resource "humanitec_application" "example" {
  id   = var.name
  name = var.name
}

locals {
  # Define the shared azure-blob-account resource id and class
  azure_blob_account_res_id = "main-blob-account"
  azure_blob_account_class  = "default"

  # Classes used to build the resource definition graph
  blob_storage_basic_class         = "basic"
  blob_storage_admin_policy_class  = "blob-storage-basic-admin"
  blob_storage_reader_policy_class = "blob-storage-basic-reader"

  # Classes that developers can select from
  blob_storage_admin_class  = "basic-admin"
  blob_storage_reader_class = "basic-read-ony"

  account_resource   = "azure-blob-account.${local.azure_blob_account_class}#${local.azure_blob_account_res_id}"
  blob_storage_scope = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Storage/storageAccounts/$${resources['${local.account_resource}'].outputs.name}/blobServices/default/containers/$${resources['azure-blob.${local.blob_storage_basic_class}'].outputs.container}"

  # Azure build in role ids: https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles
  build_in_azure_storage_blob_data_owner_role_id  = "/providers/Microsoft.Authorization/roleDefinitions/b7e6dc6d-f1e8-4753-8033-0f276bb0955b"
  build_in_azure_storage_blob_data_reader_role_id = "/providers/Microsoft.Authorization/roleDefinitions/2a2b9908-6ea1-4ae2-8e65-a410df84e7d1"
}

# Shared azure-blob-account resource

module "azure_blob_account" {
  source = "../../humanitec-resource-defs/azure-blob-account/basic"

  resource_packs_azure_url = var.resource_packs_azure_url
  resource_packs_azure_rev = var.resource_packs_azure_rev
  append_logs_to_error     = true
  terraform_state          = local.terraform_state
  driver_account           = humanitec_resource_account.humanitec_provisioner.id
  subscription_id          = var.subscription_id
  resource_group_name      = var.resource_group_name
  prefix                   = var.prefix
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "humanitec_resource_definition_criteria" "azure_blob_account" {
  resource_definition_id = module.azure_blob_account.id
  app_id                 = humanitec_application.example.id
  res_id                 = local.azure_blob_account_res_id
  class                  = local.azure_blob_account_class

  force_delete = true
}

# Workload or shared blob-storage resources

module "blob_storage" {
  source = "../../humanitec-resource-defs/azure-blob/basic"

  resource_packs_azure_url = var.resource_packs_azure_url
  resource_packs_azure_rev = var.resource_packs_azure_rev
  append_logs_to_error     = true
  terraform_state          = local.terraform_state
  driver_account           = humanitec_resource_account.humanitec_provisioner.id
  subscription_id          = var.subscription_id
  prefix                   = var.prefix
  container_access_type    = var.container_access_type
  account_resource         = local.account_resource
}

resource "humanitec_resource_definition_criteria" "blob_storage" {
  resource_definition_id = module.blob_storage.id
  app_id                 = humanitec_application.example.id
  class                  = local.blob_storage_basic_class

  force_delete = true
}

// Admin shared

// Exposed delegator resource definition
module "blob_storage_admin" {
  source = "../../humanitec-resource-defs/azure-blob/delegator"

  prefix                      = "${var.prefix}admin-"
  policy_resource_class       = local.blob_storage_admin_policy_class
  blob_storage_resource_class = local.blob_storage_basic_class
}

resource "humanitec_resource_definition_criteria" "blob_storage_admin" {
  resource_definition_id = module.blob_storage_admin.id
  app_id                 = humanitec_application.example.id
  class                  = local.blob_storage_admin_class

  force_delete = true
}

module "role_definition_admin" {
  source = "../../humanitec-resource-defs/azure-role-definition/echo"

  prefix = "${var.prefix}admin-"

  role_definition_id    = local.build_in_azure_storage_blob_data_owner_role_id
  role_definition_scope = local.blob_storage_scope
}

resource "humanitec_resource_definition_criteria" "role_definition_admin" {
  resource_definition_id = module.role_definition_admin.id
  app_id                 = humanitec_application.example.id
  class                  = local.blob_storage_admin_policy_class

  force_delete = true
}

// Reader shared

// Exposed delegator resource definition
module "blob_storage_reader" {
  source = "../../humanitec-resource-defs/azure-blob/delegator"

  prefix                      = "${var.prefix}reader-"
  policy_resource_class       = local.blob_storage_reader_policy_class
  blob_storage_resource_class = local.blob_storage_basic_class
}

resource "humanitec_resource_definition_criteria" "blob_storage_reader" {
  resource_definition_id = module.blob_storage_reader.id
  app_id                 = humanitec_application.example.id
  class                  = local.blob_storage_reader_class

  force_delete = true
}

module "role_definition_reader" {
  source = "../../humanitec-resource-defs/azure-role-definition/echo"

  prefix = "${var.prefix}reader-"

  role_definition_id    = local.build_in_azure_storage_blob_data_reader_role_id
  role_definition_scope = local.blob_storage_scope
}

resource "humanitec_resource_definition_criteria" "role_definition_reader" {
  resource_definition_id = module.role_definition_reader.id
  app_id                 = humanitec_application.example.id
  class                  = local.blob_storage_reader_policy_class

  force_delete = true
}

// Workload based

module "workload" {
  source = "../../humanitec-resource-defs/workload/service-account"

  prefix = var.prefix
}

resource "humanitec_resource_definition_criteria" "workload" {
  resource_definition_id = module.workload.id
  app_id                 = humanitec_application.example.id

  force_delete = true
}

module "k8s_service_account" {
  source = "../../humanitec-resource-defs/k8s/service-account"

  prefix = var.prefix
}

resource "humanitec_resource_definition_criteria" "k8s_service_account" {
  resource_definition_id = module.k8s_service_account.id
  app_id                 = humanitec_application.example.id

  force_delete = true
}

module "federated_identity" {
  source = "../../humanitec-resource-defs/azure-federated-identity/basic"

  resource_packs_azure_url = var.resource_packs_azure_url
  resource_packs_azure_rev = var.resource_packs_azure_rev
  append_logs_to_error     = true
  terraform_state          = local.terraform_state
  driver_account           = humanitec_resource_account.humanitec_provisioner.id
  subscription_id          = var.subscription_id

  prefix = var.prefix

  resource_group_name = var.resource_group_name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = var.aks_cluster_issuer_url
  parent_id           = "$${resources.azure-managed-identity.outputs.id}"
  subject             = "system:serviceaccount:$${resources.k8s-namespace.outputs.namespace}:$${resources.k8s-service-account.outputs.name}"
}

resource "humanitec_resource_definition_criteria" "federated_identity" {
  resource_definition_id = module.federated_identity.id
  app_id                 = humanitec_application.example.id

  force_delete = true
}

module "managed_identity" {
  source = "../../humanitec-resource-defs/azure-managed-identity/basic"

  resource_packs_azure_url = var.resource_packs_azure_url
  resource_packs_azure_rev = var.resource_packs_azure_rev
  append_logs_to_error     = true
  terraform_state          = local.terraform_state
  driver_account           = humanitec_resource_account.humanitec_provisioner.id
  subscription_id          = var.subscription_id

  prefix              = var.prefix
  resource_group_name = var.resource_group_name
}

resource "humanitec_resource_definition_criteria" "managed_identity" {
  resource_definition_id = module.managed_identity.id
  app_id                 = humanitec_application.example.id

  force_delete = true
}

module "role_assignment" {
  source = "../../humanitec-resource-defs/azure-role-assignments/basic"

  resource_packs_azure_url = var.resource_packs_azure_url
  resource_packs_azure_rev = var.resource_packs_azure_rev
  append_logs_to_error     = true
  terraform_state          = local.terraform_state
  driver_account           = humanitec_resource_account.humanitec_provisioner.id
  subscription_id          = var.subscription_id

  prefix              = var.prefix
  role_definition_ids = "$${resources.workload>azure-role-definition.outputs.id}"
  scopes              = "$${resources.workload>azure-role-definition.outputs.scope}"
  principal_id        = "$${resources.azure-managed-identity.outputs.principal_id}"
}

resource "humanitec_resource_definition_criteria" "role_assignment" {
  resource_definition_id = module.role_assignment.id
  app_id                 = humanitec_application.example.id

  force_delete = true
}
