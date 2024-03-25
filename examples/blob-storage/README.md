# Example: azure-blob resource based on Azure Blob Storage

## Configuration

This example configures an [azure-blob](https://developer.humanitec.com/platform-orchestrator/reference/resource-types/#azure-blob) and an [azure-blob-account](https://developer.humanitec.com/platform-orchestrator/reference/resource-types/#azure-blob-account) Resource Definition to enable workloads to use Azure Blob Storage.

The `azure-blob-account` represent the Azure Storage Account and is shared across all workloads.

Workloads can use the `azure-blob` resource type to request Azure Storage Containers with two different access policies:

* `basic-admin` (full access)
* `basic-read-only` (read-only access)

From Score requesting a Azure Storage Container with full access looks like:

```yaml
resources:
  ...
  storage:
    type: azure-blob
    class: basic-admin
```

## Infrastructure setup

The workload service account will automatically be assigned the necessary Azure Role.

```mermaid
graph TD;
    subgraph Resource Group
        subgraph account["Azure Storage Account"]
            container["Azure Storage Container"]
        end
        k8s-service-account["K8s Service Account"] -- azure federated identity --> azure-managed-identity["Azure Managed Identity"]
        azure-managed-identity -- owner role --> container
        subgraph AKS Cluster
            workload-pod["Workload Pod"] --> k8s-service-account
            workload-pod -- operations --> container
        end
    end
```

## Orchestrator setup

The Resource Graph is using [delegator resources](https://developer.humanitec.com/platform-orchestrator/examples/resource-graph-patterns/#delegator-resource) to expose shared resources with different access policies.


```mermaid
graph TD;
    workload_1 --> k8s_sa_1["k8s_service_account_1, resource_type: k8s-service-account"]:::policy 
    az_fi_1 --> az_mi_1["azure_managed_identity, resource_type: azure-managed-identity"]:::policy
    az_ra_1["azure_role_assignments, resource_type: azure-role-assignments"]:::policy --> az_mi_1
    az_ra_1 --> az_rd_1["azure_role_definition, resource_type: azure-role-definition"]:::policy
    az_fi_1["azure_federated_identity, resource_type: azure-federated-identity"]:::policy --> k8s_sa_1
    workload_1 --> blob_1["delegator_blob_1, resource_type: azure-blob"]
    az_rd_1 -- owner --> blob_1
    workload_2 --> p_2["identities & roles setup similar to workload 1"]:::policy
    workload_2 --> blob_2["delegator_blob_2, resource_type: azure-blob"]
    p_2 -- reader --> blob_2
    blob_1 --> shared.blob_1["shared.blob_1, resource_type: azure-blob"]
    blob_2 --> shared.blob_1
    shared.blob_1 --> blob_account["shared.main-blob-account, resource_type: azure-blob-account"]
    
    classDef policy fill:#f96
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| azuread | ~> 2.47 |
| azurerm | ~> 3.91 |
| humanitec | ~> 1.0 |
| random | ~> 3.6 |

## Providers

| Name | Version |
|------|---------|
| azuread | ~> 2.47 |
| azurerm | ~> 3.91 |
| humanitec | ~> 1.0 |
| random | ~> 3.6 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| azure\_blob\_account | ../../humanitec-resource-defs/azure-blob-account/basic | n/a |
| blob\_storage | ../../humanitec-resource-defs/azure-blob/basic | n/a |
| blob\_storage\_admin | ../../humanitec-resource-defs/azure-blob/delegator | n/a |
| blob\_storage\_reader | ../../humanitec-resource-defs/azure-blob/delegator | n/a |
| federated\_identity | ../../humanitec-resource-defs/azure-federated-identity/basic | n/a |
| k8s\_service\_account | ../../humanitec-resource-defs/k8s/service-account | n/a |
| managed\_identity | ../../humanitec-resource-defs/azure-managed-identity/basic | n/a |
| role\_assignment | ../../humanitec-resource-defs/azure-role-assignments/basic | n/a |
| role\_definition\_admin | ../../humanitec-resource-defs/azure-role-definition/echo | n/a |
| role\_definition\_reader | ../../humanitec-resource-defs/azure-role-definition/echo | n/a |
| workload | ../../humanitec-resource-defs/workload/service-account | n/a |

## Resources

| Name | Type |
|------|------|
| [azuread_application.humanitec_provisioner](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_service_principal.humanitec_provisioner](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azuread_service_principal_password.humanitec_provisioner](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal_password) | resource |
| [azurerm_role_assignment.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_storage_account.tfstate](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.tfstate](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [humanitec_application.example](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/application) | resource |
| [humanitec_resource_account.humanitec_provisioner](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_account) | resource |
| [humanitec_resource_definition_criteria.azure_blob_account](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.blob_storage](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.blob_storage_admin](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.blob_storage_reader](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.federated_identity](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.k8s_service_account](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.managed_identity](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.role_assignment](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.role_definition_admin](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.role_definition_reader](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [humanitec_resource_definition_criteria.workload](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition_criteria) | resource |
| [random_string.storage_account_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aks\_cluster\_issuer\_url | AKS OIDC Issuer URL | `string` | n/a | yes |
| resource\_group\_name | Specifies the Name of the Resource Group within which created resources will reside. | `string` | n/a | yes |
| subscription\_id | The Subscription ID which should be used. | `string` | n/a | yes |
| account\_replication\_type | Defines the type of replication to use for this storage account. | `string` | `"GRS"` | no |
| account\_tier | Defines the Tier to use for this storage account. | `string` | `"Standard"` | no |
| container\_access\_type | The Access Level configured for this Container. | `string` | `"private"` | no |
| name | Specifies the Name for created example application. | `string` | `"hum-rp-blob-storage-example"` | no |
| prefix | Specifies the prefix used in default name for created resources. | `string` | `"hum-rp-blob-storage-ex-"` | no |
| resource\_packs\_azure\_rev | Azure Resource Pack git branch. | `string` | `"refs/heads/main"` | no |
| resource\_packs\_azure\_url | Azure Resource Pack git url. | `string` | `"https://github.com/humanitec-architecture/resource-packs-azure.git"` | no |
<!-- END_TF_DOCS -->
