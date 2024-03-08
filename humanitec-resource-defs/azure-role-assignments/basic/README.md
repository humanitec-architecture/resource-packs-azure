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
| client\_id | The Client ID which should be used. | `string` | n/a | yes |
| client\_secret | The Client Secret which should be used. | `string` | n/a | yes |
| principal\_id | The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. | `string` | n/a | yes |
| role\_definition\_ids | n/a | `any` | n/a | yes |
| scopes | n/a | `any` | n/a | yes |
| subscription\_id | The Subscription ID which should be used. | `string` | n/a | yes |
| tenant\_id | The Tenant ID which should be used. | `string` | n/a | yes |
| name | Specifies the Name for created resources. (Leave empty for the default one) | `string` | `""` | no |
| prefix | Specifies the prefix used in default name for created resources. | `string` | `"hum-rp-service-bus-ex-"` | no |
| resource\_packs\_azure\_rev | Azure Resource Pack git branch. | `string` | `"refs/heads/main"` | no |
| resource\_packs\_azure\_url | Azure Resource Pack git url. | `string` | `"https://github.com/humanitec-architecture/resource-packs-azure.git"` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
<!-- END_TF_DOCS -->