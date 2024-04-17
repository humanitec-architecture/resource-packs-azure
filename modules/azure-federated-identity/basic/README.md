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
| [azurerm_federated_identity_credential.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/federated_identity_credential) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_id | n/a | `string` | n/a | yes |
| audience | Specifies the audience for this Federated Identity Credential. | `set(string)` | n/a | yes |
| env\_id | n/a | `string` | n/a | yes |
| issuer | Specifies the issuer of this Federated Identity Credential. | `string` | n/a | yes |
| parent\_id | Specifies parent ID of User Assigned Identity for this Federated Identity Credential. | `string` | n/a | yes |
| prefix | Specifies the prefix used in default name for created resources. | `string` | n/a | yes |
| res\_id | n/a | `string` | n/a | yes |
| resource\_group\_name | Specifies the Name of the Resource Group within which created resources will reside. | `string` | n/a | yes |
| subject | Specifies the subject for this Federated Identity Credential. | `string` | n/a | yes |
| subscription\_id | The Subscription ID which should be used. | `string` | n/a | yes |
| name | Specifies the Name for created resources. (Leave empty for the default one) | `string` | `""` | no |

### Outputs

| Name | Description |
|------|-------------|
| id | n/a |
<!-- END_TF_DOCS -->