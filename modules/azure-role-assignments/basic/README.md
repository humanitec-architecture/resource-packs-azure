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
| [azurerm_role_assignment.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| principal\_id | The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. | `string` | n/a | yes |
| role\_definition\_ids | n/a | `any` | n/a | yes |
| scopes | n/a | `any` | n/a | yes |
| subscription\_id | The Subscription ID which should be used. | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| ids | n/a |
<!-- END_TF_DOCS -->