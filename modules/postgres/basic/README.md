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
| [azurerm_postgresql_flexible_server_database.db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_database) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| administrator\_login | The Administrator login for the PostgreSQL Flexible Server. | `string` | n/a | yes |
| administrator\_password | The Password associated with the administrator\_login for the PostgreSQL Flexible Server. | `string` | n/a | yes |
| host | The private IP address of the PostgreSQL Flexible Server Database | `string` | n/a | yes |
| res\_id | n/a | `string` | n/a | yes |
| server\_id | The ID of the Azure PostgreSQL Flexible Server from which to create this PostgreSQL Flexible Server Database | `string` | n/a | yes |
| subscription\_id | The Subscription ID which should be used. | `string` | n/a | yes |
| database\_name | Specifies the name for the created database | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| host | n/a |
| name | n/a |
| password | n/a |
| port | n/a |
| ssl\_mode | n/a |
| username | n/a |
<!-- END_TF_DOCS -->