<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.3.0 |
| humanitec | ~> 1.0 |

### Providers

| Name | Version |
|------|---------|
| humanitec | ~> 1.0 |

### Resources

| Name | Type |
|------|------|
| [humanitec_resource_definition.main](https://registry.terraform.io/providers/humanitec/humanitec/latest/docs/resources/resource_definition) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| audience | Specifies the audience for this Federated Identity Credential. | `set(string)` | n/a | yes |
| driver\_account | The ID of the Resource Account which should be used. | `string` | n/a | yes |
| issuer | Specifies the issuer of this Federated Identity Credential. | `string` | n/a | yes |
| parent\_id | Specifies parent ID of User Assigned Identity for this Federated Identity Credential. | `string` | n/a | yes |
| resource\_group\_name | Specifies the Name of the Resource Group within which created resources will reside. | `string` | n/a | yes |
| subject | Specifies the subject for this Federated Identity Credential. | `string` | n/a | yes |
| subscription\_id | The Subscription ID which should be used. | `string` | n/a | yes |
| append\_logs\_to\_error | Append Terraform logs to error messages. | `bool` | `false` | no |
| name | Specifies the Name for created resources. (Leave empty for the default one) | `string` | `""` | no |
| prefix | Specifies the prefix used in default name for created resources. | `string` | `"hum-rp-service-bus-ex-"` | no |
| resource\_packs\_azure\_rev | Azure Resource Pack git branch. | `string` | `"refs/heads/main"` | no |
| resource\_packs\_azure\_url | Azure Resource Pack git url. | `string` | `"https://github.com/humanitec-architecture/resource-packs-azure.git"` | no |
| terraform\_state | Use terraform remote state. | <pre>object({<br>    subscription_id      = string<br>    resource_group_name  = string<br>    storage_account_name = string<br>    container_name       = string<br>    key_prefix           = optional(string)<br>  })</pre> | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| id | n/a |
<!-- END_TF_DOCS -->