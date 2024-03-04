resource "humanitec_application" "example" {
  id   = var.name
  name = var.name
}

locals {
  # Classes used to build the resource definition graph
  service_bus_basic_class            = "basic"
  service_bus_publisher_policy_class = "service-bus-basic-publisher"
  service_bus_consumer_policy_class  = "service-bus-basic-consumer"

  # Classes that developers can select from
  service_bus_publisher_class = "basic-publisher"
  service_bus_consumer_class  = "basic-consumer"

  service_bus_scope = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.ServiceBus/namespaces/$${resources['azure-service-bus-queue.${local.service_bus_basic_class}'].outputs.namespace}/queues/$${resources['azure-service-bus-queue.${local.service_bus_basic_class}'].outputs.queue}"

  # Azure build in role ids: https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles
  build_in_azure_service_bus_data_receiver_role_id = "/providers/Microsoft.Authorization/roleDefinitions/4f6d3b9b-027b-4f4c-9142-0e5a2a2247e0"
  build_in_azure_service_bus_data_sender_role_id   = "/providers/Microsoft.Authorization/roleDefinitions/69a216fc-b8fb-44d8-bc22-1f3c2cd27a39"
}

module "service_bus" {
  source = "../../humanitec-resource-defs/azure-service-bus-queue/basic"

  resource_packs_azure_url = var.resource_packs_azure_url
  resource_packs_azure_rev = var.resource_packs_azure_rev
  client_id                = var.client_id
  client_secret            = var.client_secret
  tenant_id                = var.tenant_id
  subscription_id          = var.subscription_id
  resource_group_name      = var.resource_group_name
  prefix                   = var.prefix
  sku                      = var.sku
}

resource "humanitec_resource_definition_criteria" "service_bus" {
  resource_definition_id = module.service_bus.id
  app_id                 = humanitec_application.example.id
  class                  = local.service_bus_basic_class
}

// Publisher shared

// Exposed delegator resource definition
module "service_bus_publisher" {
  source = "../../humanitec-resource-defs/azure-service-bus-queue/delegator"

  prefix                     = "${var.prefix}publisher-"
  policy_resource_class      = local.service_bus_publisher_policy_class
  service_bus_resource_class = local.service_bus_basic_class
}

resource "humanitec_resource_definition_criteria" "service_bus_publisher" {
  resource_definition_id = module.service_bus_publisher.id
  app_id                 = humanitec_application.example.id
  class                  = local.service_bus_publisher_class
}

module "role_definition_publisher" {
  source = "../../humanitec-resource-defs/azure-role-definition/echo"

  prefix = "${var.prefix}publisher-"

  role_definition_id    = local.build_in_azure_service_bus_data_sender_role_id
  role_definition_scope = local.service_bus_scope
}

resource "humanitec_resource_definition_criteria" "role_definition_publisher" {
  resource_definition_id = module.role_definition_publisher.id
  app_id                 = humanitec_application.example.id
  class                  = local.service_bus_publisher_policy_class
}

// Consumer shared

// Exposed delegator resource definition
module "service_bus_consumer" {
  source = "../../humanitec-resource-defs/azure-service-bus-queue/delegator"

  prefix                     = "${var.prefix}consumer-"
  policy_resource_class      = local.service_bus_consumer_policy_class
  service_bus_resource_class = local.service_bus_basic_class
}

resource "humanitec_resource_definition_criteria" "service_bus_consumer" {
  resource_definition_id = module.service_bus_consumer.id
  app_id                 = humanitec_application.example.id
  class                  = local.service_bus_consumer_class
}

module "role_definition_consumer" {
  source = "../../humanitec-resource-defs/azure-role-definition/echo"

  prefix = "${var.prefix}consumer-"

  role_definition_id    = local.build_in_azure_service_bus_data_receiver_role_id
  role_definition_scope = local.service_bus_scope
}

resource "humanitec_resource_definition_criteria" "role_definition_consumer" {
  resource_definition_id = module.role_definition_consumer.id
  app_id                 = humanitec_application.example.id
  class                  = local.service_bus_consumer_policy_class
}

// Workload based

module "workload" {
  source = "../../humanitec-resource-defs/workload/service-account"

  prefix = var.prefix
}

resource "humanitec_resource_definition_criteria" "workload" {
  resource_definition_id = module.workload.id
  app_id                 = humanitec_application.example.id
}

module "k8s_service_account" {
  source = "../../humanitec-resource-defs/k8s/service-account"

  prefix = var.prefix
}

resource "humanitec_resource_definition_criteria" "k8s_service_account" {
  resource_definition_id = module.k8s_service_account.id
  app_id                 = humanitec_application.example.id
}

module "federated_identity" {
  source = "../../humanitec-resource-defs/azure-federated-identity/basic"

  resource_packs_azure_url = var.resource_packs_azure_url
  resource_packs_azure_rev = var.resource_packs_azure_rev

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id

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
}

module "managed_identity" {
  source = "../../humanitec-resource-defs/azure-managed-identity/basic"

  resource_packs_azure_url = var.resource_packs_azure_url
  resource_packs_azure_rev = var.resource_packs_azure_rev

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id

  prefix              = var.prefix
  resource_group_name = var.resource_group_name
}

resource "humanitec_resource_definition_criteria" "managed_identity" {
  resource_definition_id = module.managed_identity.id
  app_id                 = humanitec_application.example.id
}

module "role_assignment" {
  source = "../../humanitec-resource-defs/azure-role-assignments/basic"

  resource_packs_azure_url = var.resource_packs_azure_url
  resource_packs_azure_rev = var.resource_packs_azure_rev

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id

  prefix              = var.prefix
  role_definition_ids = "$${resources.workload>azure-role-definition.outputs.id}"
  scopes              = "$${resources.workload>azure-role-definition.outputs.scope}"
  principal_id        = "$${resources.azure-managed-identity.outputs.principal_id}"
}

resource "humanitec_resource_definition_criteria" "role_assignment" {
  resource_definition_id = module.role_assignment.id
  app_id                 = humanitec_application.example.id
}
