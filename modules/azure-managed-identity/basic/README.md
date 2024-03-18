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
| [azurerm_user_assigned_identity.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_id | n/a | `string` | n/a | yes |
| env\_id | n/a | `string` | n/a | yes |
| res\_id | n/a | `string` | n/a | yes |
| resource\_group\_name | Specifies the Name of the Resource Group within which created resources will reside. | `string` | n/a | yes |
| subscription\_id | The Subscription ID which should be used. | `string` | n/a | yes |
| name | Specifies the Name for created resources. (Leave empty for the default one) | `string` | `""` | no |
| prefix | Specifies the prefix used in default name for created resources. | `string` | `"hum-rp-mysql-ex-"` | no |

## Outputs

| Name | Description |
|------|-------------|
| client\_id | n/a |
| id | n/a |
| principal\_id | n/a |
<!-- END_TF_DOCS -->