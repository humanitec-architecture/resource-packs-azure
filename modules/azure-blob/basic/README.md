<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| azurerm | ~> 3.91 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 3.91 |

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_id | n/a | `string` | n/a | yes |
| client\_id | The Client ID which should be used. | `string` | n/a | yes |
| client\_secret | The Client Secret which should be used. | `string` | n/a | yes |
| container\_name | The name of the Container which should be created within the Storage Account. | `string` | n/a | yes |
| env\_id | n/a | `string` | n/a | yes |
| res\_id | n/a | `string` | n/a | yes |
| resource\_group\_name | Specifies the Name of the Resource Group within which created resources will reside. | `string` | n/a | yes |
| subscription\_id | The Subscription ID which should be used. | `string` | n/a | yes |
| tenant\_id | The Tenant ID which should be used. | `string` | n/a | yes |
| account\_replication\_type | Defines the type of replication to use for this storage account. | `string` | `"GRS"` | no |
| account\_tier | Defines the Tier to use for this storage account. | `string` | `"Standard"` | no |
| container\_access\_type | The Access Level configured for this Container. | `string` | `"private"` | no |
| name | Specifies the Name for created resources. (Leave empty for the default one) | `string` | `""` | no |
| prefix | Specifies the prefix used in default name for created resources. | `string` | `"hum-rp-blob-storage-ex-"` | no |

## Outputs

| Name | Description |
|------|-------------|
| account | n/a |
| container | n/a |
<!-- END_TF_DOCS -->