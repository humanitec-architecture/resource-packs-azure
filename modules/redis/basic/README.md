<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| azurerm | ~> 3.91 |

### Providers

| Name | Version |
|------|---------|
| azurerm | ~> 3.91 |

### Resources

| Name | Type |
|------|------|
| [azurerm_redis_cache.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/redis_cache) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_id | n/a | `string` | n/a | yes |
| env\_id | n/a | `string` | n/a | yes |
| res\_id | n/a | `string` | n/a | yes |
| resource\_group\_name | Specifies the Name of the Resource Group within which created resources will reside. | `string` | n/a | yes |
| subscription\_id | The Subscription ID which should be used. | `string` | n/a | yes |
| capacity | The size of the Redis cache to deploy. | `number` | `2` | no |
| enable\_non\_ssl\_port | Enable the non-SSL port | `bool` | `false` | no |
| family | The SKU family/pricing group to use. | `string` | `"C"` | no |
| minimum\_tls\_version | The minimum TLS version. | `string` | `"1.2"` | no |
| name | Specifies the Name for created resources. (Leave empty for the default one) | `string` | `""` | no |
| prefix | Specifies the prefix used in default name for created resources. | `string` | `"hum-rp-mysql-ex-"` | no |
| sku\_name | The SKU of Redis to use. | `string` | `"Standard"` | no |

### Outputs

| Name | Description |
|------|-------------|
| host | n/a |
| password | n/a |
| port | n/a |
| username | n/a |
<!-- END_TF_DOCS -->