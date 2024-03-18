<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| humanitec | ~> 1.0 |

## Providers

| Name | Version |
|------|---------|
| humanitec | ~> 1.0 |

## Resources

| Name | Type |
|------|------|
| [humanitec_resource_definition.main](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| driver\_account | The ID of the Resource Account which should be used. | `string` | n/a | yes |
| resource\_group\_name | Specifies the Name of the Resource Group within which this database will reside. | `string` | n/a | yes |
| subscription\_id | The Subscription ID which should be used. | `string` | n/a | yes |
| append\_logs\_to\_error | Append Terraform logs to error messages. | `bool` | `false` | no |
| capacity | The size of the Redis cache to deploy. | `number` | `2` | no |
| enable\_non\_ssl\_port | Enable the non-SSL port | `bool` | `false` | no |
| family | The SKU family/pricing group to use. | `string` | `"C"` | no |
| minimum\_tls\_version | The minimum TLS version. | `string` | `"1.2"` | no |
| name | Specifies the Name for created resources. (Leave empty for the default one) | `string` | `""` | no |
| prefix | Specifies the prefix used in default name for created resources. | `string` | `"hum-rp-mysql-ex-"` | no |
| resource\_packs\_azure\_rev | Azure Resource Pack git branch. | `string` | `"refs/heads/main"` | no |
| resource\_packs\_azure\_url | Azure Resource Pack git url. | `string` | `"https://github.com/humanitec-architecture/resource-packs-azure.git"` | no |
| sku\_name | The SKU of Redis to use. | `string` | `"Standard"` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
<!-- END_TF_DOCS -->