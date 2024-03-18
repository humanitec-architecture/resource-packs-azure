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
| [azurerm_mysql_database.db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_database) | resource |
| [azurerm_mysql_server.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_server) | resource |
| [azurerm_private_endpoint.endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_resource_group.resouce](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.vn_subnets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_virtual_network.vn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| administrator\_login | The Administrator login for the MySQL Server. | `string` | n/a | yes |
| administrator\_login\_password | The Password associated with the administrator\_login for the MySQL Server. | `string` | n/a | yes |
| app\_id | n/a | `string` | n/a | yes |
| auto\_grow\_enabled | Enable/Disable auto-growing of the storage. Storage auto-grow prevents your server from running out of storage and becoming read-only. | `bool` | n/a | yes |
| backup\_retention\_days | Backup retention days for the server, supported values are between 7 and 35 days. | `number` | n/a | yes |
| database\_name | Specifies the name for the created database | `string` | n/a | yes |
| env\_id | n/a | `string` | n/a | yes |
| geo\_redundant\_backup\_enabled | Turn Geo-redundant server backups on/off. | `bool` | n/a | yes |
| mysql\_version | Specifies the version of MySQL to use. | `string` | n/a | yes |
| public\_network\_access\_enabled | Whether or not public network access is allowed for this server. | `bool` | n/a | yes |
| res\_id | n/a | `string` | n/a | yes |
| resource\_group\_name | Specifies the Name of the Resource Group within which created resources will reside. | `string` | n/a | yes |
| sku\_name | Specifies the SKU Name for this MySQL Server. | `string` | n/a | yes |
| ssl\_enforcement\_enabled | Specifies if SSL should be enforced on connections. | `bool` | n/a | yes |
| ssl\_minimal\_tls\_version\_enforced | The minimum TLS version to support on the sever. | `string` | n/a | yes |
| storage\_mb | Max storage allowed for a server. | `number` | n/a | yes |
| subnet\_name | The name of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. | `string` | n/a | yes |
| subscription\_id | The Subscription ID which should be used. | `string` | n/a | yes |
| virtual\_network\_name | The name of the virtual network where Private Endpoint will be allocated. | `string` | n/a | yes |
| virtual\_network\_resource\_group\_name | Specifies the Name of the Resource Group within which the Private Endpoint should exist. | `string` | n/a | yes |
| name | Specifies the Name for created resources. (Leave empty for the default one) | `string` | `""` | no |
| prefix | Specifies the prefix used in default name for created resources. | `string` | `"hum-rp-mysql-ex-"` | no |

## Outputs

| Name | Description |
|------|-------------|
| host | n/a |
| name | n/a |
| password | n/a |
| port | n/a |
| username | n/a |
<!-- END_TF_DOCS -->