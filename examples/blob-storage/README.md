# Example: azure-blob resource based on Azure Blob Storage

This example configures a [azure-blob](https://developer.humanitec.com/platform-orchestrator/reference/resource-types/#azure-blob) Resource Definition using Azure Blob Storage, with two different access policies:

* `basic-admin` (full access)
* `basic-read-only` (read-only access)

Those Resource Definitions can be used in your Score file using:

```yaml
resources:
  ...
  storage:
    type: azure-blob
    class: basic-admin
```

The workload service account will automatically be assigned the necessary Azure Role.



<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| humanitec | ~> 0 |

## Providers

| Name | Version |
|------|---------|
| humanitec | ~> 0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| blob\_storage | ../../humanitec-resource-defs/azure-blob/basic | n/a |
| blob\_storage\_admin | ../../humanitec-resource-defs/azure-blob/passthrough | n/a |
| blob\_storage\_reader | ../../humanitec-resource-defs/azure-blob/passthrough | n/a |
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
| [humanitec_application.example](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/application) | resource |
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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aks\_cluster\_issuer\_url | AKS OIDC Issuer URL | `string` | n/a | yes |
| client\_id | The Client ID which should be used. | `string` | n/a | yes |
| client\_secret | The Client Secret which should be used. | `string` | n/a | yes |
| resource\_group\_name | Specifies the Name of the Resource Group within which created resources will reside. | `string` | n/a | yes |
| subscription\_id | The Subscription ID which should be used. | `string` | n/a | yes |
| tenant\_id | The Tenant ID which should be used. | `string` | n/a | yes |
| account\_replication\_type | Defines the type of replication to use for this storage account. | `string` | `"GRS"` | no |
| account\_tier | Defines the Tier to use for this storage account. | `string` | `"Standard"` | no |
| container\_access\_type | The Access Level configured for this Container. | `string` | `"private"` | no |
| container\_name | The name of the Container which should be created within the Storage Account. | `string` | `"hum-rp-blob-storage-example"` | no |
| name | Specifies the Name for created example application. | `string` | `"hum-rp-blob-storage-example"` | no |
| prefix | Specifies the prefix used in default name for created resources. | `string` | `"hum-rp-blob-storage-ex-"` | no |
| resource\_packs\_azure\_rev | Azure Resource Pack git branch. | `string` | `"refs/heads/main"` | no |
| resource\_packs\_azure\_url | Azure Resource Pack git url. | `string` | `"https://github.com/humanitec-architecture/resource-packs-azure.git"` | no |
<!-- END_TF_DOCS -->