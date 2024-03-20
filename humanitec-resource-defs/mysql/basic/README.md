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
| administrator\_login | The Administrator login for the MySQL Server. | `string` | n/a | yes |
| administrator\_login\_password | The Password associated with the administrator\_login for the MySQL Server. | `string` | n/a | yes |
| driver\_account | The ID of the Resource Account which should be used. | `string` | n/a | yes |
| prefix | Specifies the prefix used in default name for created resources. | `string` | n/a | yes |
| resource\_group\_name | Specifies the Name of the Resource Group within which this database will reside. | `string` | n/a | yes |
| subnet\_name | The name of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. | `string` | n/a | yes |
| subscription\_id | The Subscription ID which should be used. | `string` | n/a | yes |
| virtual\_network\_name | The name of the virtual network where Private Endpoint will be allocated. | `string` | n/a | yes |
| virtual\_network\_resource\_group\_name | Specifies the Name of the Resource Group within which the Private Endpoint should exist. | `string` | n/a | yes |
| append\_logs\_to\_error | Append Terraform logs to error messages. | `bool` | `false` | no |
| auto\_grow\_enabled | Enable/Disable auto-growing of the storage. Storage auto-grow prevents your server from running out of storage and becoming read-only. | `bool` | `true` | no |
| backup\_retention\_days | Backup retention days for the server, supported values are between 7 and 35 days. | `number` | `7` | no |
| geo\_redundant\_backup\_enabled | Turn Geo-redundant server backups on/off. | `bool` | `true` | no |
| mysql\_version | Specifies the version of MySQL to use. | `string` | `"5.7"` | no |
| name | Specifies the Name for created resources. (Leave empty for the default one) | `string` | `""` | no |
| public\_network\_access\_enabled | Whether or not public network access is allowed for this server. | `bool` | `false` | no |
| resource\_packs\_azure\_rev | Azure Resource Pack git branch. | `string` | `"refs/heads/main"` | no |
| resource\_packs\_azure\_url | Azure Resource Pack git url. | `string` | `"https://github.com/humanitec-architecture/resource-packs-azure.git"` | no |
| sku\_name | Specifies the SKU Name for this MySQL Server. | `string` | `"GP_Gen5_2"` | no |
| ssl\_enforcement\_enabled | Specifies if SSL should be enforced on connections. | `bool` | `true` | no |
| ssl\_minimal\_tls\_version\_enforced | The minimum TLS version to support on the sever. | `string` | `"TLS1_2"` | no |
| storage\_mb | Max storage allowed for a server. | `number` | `5120` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
<!-- END_TF_DOCS -->